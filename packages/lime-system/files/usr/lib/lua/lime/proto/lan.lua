#!/usr/bin/lua

lan = {}
lan_dsa = {}

local network = require("lime.network")
local config = require("lime.config")
local utils = require("lime.utils")

lan.configured = false
lan_dsa.configured = false

function lan.configure(args)
	local lans = utils.is_dsa() and {"lan", "lan_dsa"} or {"lan"}
	for v,lan_if in pairs(lans) do
		local lan_br = lan_if == 'lan' and "br-lan" or "br-dsa"
		if lan_if == "lan_dsa" and lan_dsa.configured then return end 
		if lan_if == "lan_dsa" then lan_dsa.configured = true end
		if lan_if == "lan" and lan.configured then return end
		if lan_if == "lan" then lan.configured = true end

		utils.log('lime.proto.lan Configuring interface: ' .. lan_if)
		local uci = config.get_uci_cursor()
		local ipv4, ipv6 = network.primary_address()
		uci:set("network", lan_if, "interface")
		uci:set("network", lan_if, "device", lan_br)
		uci:set("network", lan_if, "ip6addr", ipv6:string())
		uci:set("network", lan_if, "ipaddr", ipv4:host():string())
		uci:set("network", lan_if, "netmask", ipv4:mask():string())
		uci:set("network", lan_if, "proto", "static")
		uci:set("network", lan_if, "mtu", "1500")
		local br_lan_section = utils.find_bridge_cfgid(lan_br)
		utils.log(br_lan_section)
		if br_lan_section then uci:delete("network", br_lan_section, "ports") end
		uci:save("network")
	end
-- end

	-- disable bat0 on alfred if batadv not enabled
	if utils.is_installed("alfred") then
		local is_batadv_enabled = false
		local generalProtocols = config.get("network", "protocols")
		for _,protocol in pairs(generalProtocols) do
			local protoModule = "lime.proto."..utils.split(protocol,":")[1]
			if protoModule == "lime.proto.batadv" then
				is_batadv_enabled = true
				break
			end
		end
		if not is_batadv_enabled then
			uci:set("alfred", "alfred", "batmanif", "none")
			uci:save("alfred")
		end
	end
end

function lan.setup_interface(ifname, args)
	if ifname:match("^wlan") then return end
	if ifname:match(network.protoVlanSeparator.."%d+$") then return end
	utils.log('lime.proto.lan setup interface ' .. ifname)
	local lan_if
	local lan_br
	if utils.is_dsa() and ifname ~= "bat0" then
		lan_if = "lan_dsa"
		lan_br = "br-dsa"
	else
		lan_if = "lan"
		lan_br = "br-lan"
	end
	local uci = config.get_uci_cursor()
	local bridgedIfs = {}
	local br_lan_section = utils.find_bridge_cfgid(lan_br)
	if not br_lan_section then return end
	local oldIfs = uci:get("network", br_lan_section, "ports") or {}
	-- it should be a table, it was a string in old OpenWrt releases
	if type(oldIfs) == "string" then oldIfs = utils.split(oldIfs, " ") end
	for _,iface in pairs(oldIfs) do
		if iface ~= ifname then
			table.insert(bridgedIfs, iface)
		end
	end
	table.insert(bridgedIfs, ifname)
	uci:set("network", br_lan_section, "ports", bridgedIfs)
	uci:save("network")
end

function lan.bgp_conf(templateVarsIPv4, templateVarsIPv6)
	local base_conf = [[
protocol direct {
	interface "br-lan";
}
]]
	return base_conf
end

function lan.runOnDevice(linuxDev, args) end

return lan
