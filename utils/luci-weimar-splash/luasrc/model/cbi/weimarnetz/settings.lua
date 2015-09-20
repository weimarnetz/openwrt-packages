-- Copyright 2015 Andreas Bräu <ab@andi95.de> 
-- Licensed to the public under the Apache License 2.0.                                     
                                                                                
local fs = require "nixio.fs"
local util = require "luci.util"
local uci = require "luci.model.uci".cursor()
local profiles = "/etc/config/profile_*"

m = Map("system", translate("Einstellungen fürs Weimarnetz"))
n = Map("wireless", translate("WLAN-Einstellungen"))
o = Map("meshwizard", translate("Knoteneinstellungen"))
w = m:section(NamedSection, "weblogin", "weblogin", nil, translate("Splashpage"))
f = m:section(NamedSection, "fwupdate", "fwupdate", nil, translate("Firmware"))
p = o:section(NamedSection, "community", "public", nil, translate("Knoten"))
v = m:section(NamedSection, "vpn", "vpn", nil, translate("VPN"))
s = n:section(TypedSection, "wifi-iface", translate("SSID-Namen"))
s:depends("mode", "ap")
s.anonymous=true

splash = w:option(Flag, "enabled", translate("Informationsseite"), translate("Soll WLAN-Nutzern eine Informationsseite angezeigt werden?"))
splash.rmempty=false

profile = p:option(Value, "nodenumber", translate("Knotennummer"), translate("Mit der Knotennummer werden zahlreiche Netzwerkeinstellungen vorgenommen. Sie ist pro Router eindeutig und liegt zwischen 2 und 980. Im  <a href=\"http://reg.weimarnetz.de\" target=\"blank\">Registrator</a> sind alle bereits vergebenen Nummer aufgelistet. Sei vorsichtig an dieser Stelle!"))
function profile:validate(value)
	if value:match("^[0-9]*$") and value:len()<4 then
		return value
	else
		return false
	end
end
btnnode = p:option(Button, "_btnnode", translate("Knotennummer ändern"))
function btnnode.write()
    luci.sys.call("/etc/init.d/applyprofile.code boot")
end

fwMode = f:option(ListValue, "mode", "Updatemodus", "Modus für Firmwareupdates") 
fwMode:value("stable", translate("Stabile Versionen"))
fwMode:value("beta", translate("Betaversionen"))
fwMode:value("testing", translate("Testversionen"))
fwMode:value("none", translate("Keine Updates"))
fwUrl = f:option(Value, "url", "URL", translate("Update-URL für Firmwareupdates"))
fwUrl:depends("mode", "stable")
fwUrl:depends("mode", "beta")
fwUrl:depends("mode", "testing")

vpnMode = v:option(ListValue, "enable", translate("VPN-Modus"), translate("Wie soll VPN genutzt werden?"))
vpnMode:value("0", translate("VPN deaktivieren"))
vpnMode:value("1", translate("VPN aktivieren und Internetverkehr darüber leiten"))
vpnMode:value("2", translate("VPN aktivieren, nur zur Verbindung mit der Wokle"))
vpnNoInternet = v:option(Flag, "disableinternet", translate("Kein Internet bei VPN-Ausfall"), translate("Soll der Internetzugang für WLAN-Nutzer gesperrt werden, wenn VPN ausfällt?"))
vpnNoInternet.rmempty=false
vpnNoInternet.default='0'
vpnNoInternet:depends("enable", "1")
btn = v:option(Button, "_btn", translate("VPN-Änderungen anwenden"))
function btn.write()
    luci.sys.call(". /tmp/loader && _vpn restart")
end

ssid = s:option(Value, "ssid", translate("SSID"), translate("SSID für das öffentlich zugängliche Netzwerk")) 
function ssid:validate(value)
	if value:len()<=32 and value:match("[0-9A-Za-z\ -\(\)]") then
		return value
	else
		return false
	end
end

return m,n,o

