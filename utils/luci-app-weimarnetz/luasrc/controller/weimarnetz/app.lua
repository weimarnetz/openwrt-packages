--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

module("luci.controller.weimarnetz.app", package.seeall)

function index()
   page = node("freifunk", "captive")
   page.title    = luci.i18n.translate("Informationsseite")
   page.order    = 1
   page.target   = template("weimarnetz/infopage")
   page.setuser  = false
   page.setgroup = false

   page        = node("admin", "freifunk", "weimarnetz")
   page.target = cbi("weimarnetz/settings")
   page.title  = _("Weimarnetz Settings")
   page.order  = 60
end

