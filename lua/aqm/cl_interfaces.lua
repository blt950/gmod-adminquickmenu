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

function aqm.hasAccess(ply, cmd)

	return true

end


aqm.interfaces = {
	
	kick = {
		compability = "ulx",
		label = "Kick",
		icon = "icon16/error.png",
		hasAccess = aqm.hasAccess(),
		draw = {
			["ulx"] = {
				playerSelect = true,
				reasonSelect = true
			}
		}
	},
	
	ban = {
		compability = {"ulx", "fadmin"}
	}

}