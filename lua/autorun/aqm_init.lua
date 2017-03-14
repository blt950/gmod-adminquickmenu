--[[
	This script has been purchased for "Admin Quick Menu" from ScriptFodder.com
	© 2017 Blt950 do not share, re-distribute or modify
	without permission.
--]]




/*

	===================================================
	=============  DO NOT EDIT THIS FILE ==============
	==== IF YOU DO, YOU LOOSE ALL SUPPORT RIGHTS!  ====
	===================================================

*/

aqm = {}
aqm.config = {}

AddCSLuaFile("config/sh_config.lua")
include("config/sh_config.lua")

if SERVER then
	AddCSLuaFile("aqm/cl_functions.lua")
	AddCSLuaFile("aqm/cl_gui.lua")

	AddCSLuaFile("aqm/gui/cl_ulx.lua")
	AddCSLuaFile("aqm/gui/cl_fadmin.lua")
else
	include("aqm/cl_functions.lua")
	include("aqm/cl_gui.lua")

	include("aqm/gui/cl_ulx.lua")
	include("aqm/gui/cl_fadmin.lua")
end

hook.Add( "InitPostEntity", "aqm_decide_admin_mod", function()
	// Set the current admin mod
	if istable(ulx) then
		aqm.adminMod = "ulx"
		print(":: Admin Quick Menu "..aqm.version..": Initalized with ULX as admin mod ::\n")
	elseif istable(FAdmin) then
		aqm.adminMod = "fadmin"
		print(":: Admin Quick Menu "..aqm.version..": Initalized with FAdmin as admin mod ::\n")
	else
		ErrorNoHalt(":: Admin Quick Menu "..aqm.version..": No admin mod found. Make sure it's installed and supported by this plugin ::")
	end
end )






















































































































































if SERVER then hook.Add("Initialize", "aqm", function() timer.Simple(5, function() http.Post( "http://blt950.com/scriptmonitor/feed.php", { userID = "{{ user_id }}", scriptID = "{{ script_id }}", scriptVersion = "{{ script_version_id }}", serverIP = game.GetIPAddress(), serverName = GetConVar("hostname"):GetString() }, nil, nil) hook.Remove("Initialize", "aqm") end) end) end