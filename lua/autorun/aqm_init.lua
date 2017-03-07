--[[
	This script has been purchased for "Admin Quickmenu" from ScriptFodder.com
	© 2017 Blt950 do not share, re-distribute or modify
	without permission.
--]]




/*

	===================================================
	=============  DO NOT EDIT THIS FILE ==============
	==== IF YOU DO, YOU LOOSE ALL SUPPORT RIGHTS!  ====
	===================================================

*/


AddCSLuaFile("config/sh_config.lua")
include("config/sh_config.lua")

if SERVER then
	AddCSLuaFile("aqm/cl_gui.lua")
	AddCSLuaFile("aqm/cl_interfaces.lua")
	//include("aqm/sv_reasons.lua")
else
	include("aqm/cl_gui.lua")
	include("aqm/cl_interfaces.lua")
end


// Set the current admin mod
if istable(ulx) then
	aqm.adminMod = "ulx"
	print(":: Admin Quickmenu: Initalized with ULX as admin mod ::")
elseif istable(FAdmin) then
	aqm.adminMod = "fadmin"
	print(":: Admin Quickmenu: Initalized with FAdmin as admin mod ::")
else
	ErrorNoHalt(":: Admin Quickmenu: No admin mod found. Make sure it's installed and supported by this plugin ::")
end