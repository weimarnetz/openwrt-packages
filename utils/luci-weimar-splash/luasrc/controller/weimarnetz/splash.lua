module("luci.controller.weimarnetz.splash", package.seeall)

function index()
   page = node("freifunk", "captive")
   page.title    = "Informationsseite"
   page.order    = 1
   page.target   = template("weimarnetz-splash/infopage")
   page.setuser  = false
   page.setgroup = false
end
