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

function aqm.buildULXMenu(menu)

	/* KICK MENU */
	if hasAccess("ulx kick") then

		local KICK_SUBMENU, KICK_SUBMENU_ICO = menu:AddSubMenu("Kick")
		KICK_SUBMENU_ICO:SetImage( "icon16/error.png" )

		for k,v in pairs(player.GetAll()) do
			local KICK_SUBMENUREASON = KICK_SUBMENU:AddSubMenu(v:Name())
			for x, y in pairs(ulx.common_kick_reasons) do
				KICK_SUBMENUREASON:AddOption(y, function() RunConsoleCommand("ulx", "kick", v:Name(), y) end)
			end
			KICK_SUBMENUREASON:AddSpacer()
			KICK_SUBMENUREASON:AddOption("Custom reason", function()
				Derma_StringRequest( "Kick", "Write your reason to kick '"..v:Name().."'", nil, function(text) RunConsoleCommand("ulx", "kick", v:Name(), text) end, nil, "Kick" )
		 	end) 
		end
		if #player.GetAll() == 0 then KICK_SUBMENU:AddOption("(None)", function() end) end

	end

	/* BAN MENU */
	if hasAccess("ulx ban") then

	local BAN_SUBMENU, BAN_SUBMENU_ICO = menu:AddSubMenu("Ban")
	BAN_SUBMENU_ICO:SetImage( "icon16/exclamation.png" )

		for k,v in pairs(player.GetAll()) do
			local BAN_SUBMENULENGTH = BAN_SUBMENU:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.banLengths) do
				local BAN_SUBMENUREASON = BAN_SUBMENULENGTH:AddSubMenu(y.Str)
				for q, w in pairs(ulx.common_kick_reasons) do
					BAN_SUBMENUREASON:AddOption(w, function() RunConsoleCommand("ulx", "ban", v:Name(), y.Len, w) end)
				end
				BAN_SUBMENUREASON:AddSpacer()
				BAN_SUBMENUREASON:AddOption("Custom reason", function()
					Derma_StringRequest( "Ban", "Write your reason to your "..string.lower(y.Str).." ban for '"..v:Name().."'", nil, function(text) RunConsoleCommand("ulx", "ban", v:Name(), y.Len, text) end, nil, y.Str.." Ban")
			 	end) 
			end
			
		end
		aqm.addNoneLabel(BAN_SUBMENU, 0)

	end

	/* UNBAN */
	if hasAccess("ulx unban") and hasAccess("xgui_managebans") then
		menu:AddOption("Unban ...", function() RunConsoleCommand("xgui", "show", "Bans") end)
		
	end

	menu:AddSpacer()

	/* TELEPORT */
	local TELE_SUBMENU, TELE_SUBMENU_ICO = menu:AddSubMenu("Teleport")
	TELE_SUBMENU_ICO:SetImage( "icon16/map.png" )

	if hasAccess("ulx bring") then
		local TELE_SUBMENU_BRING = TELE_SUBMENU:AddSubMenu("Bring")

		for k,v in pairs(player.GetAll()) do
			if v != LocalPlayer() then
				TELE_SUBMENU_BRING:AddOption(v:Name(), function() RunConsoleCommand("ulx", "bring", v:Name()) end)
			end
		end
		aqm.addNoneLabel(TELE_SUBMENU_BRING, 1)
	end

	if hasAccess("ulx goto") then
		local TELE_SUBMENU_GOTO = TELE_SUBMENU:AddSubMenu("Goto")

		for k,v in pairs(player.GetAll()) do
			if v != LocalPlayer() then
				TELE_SUBMENU_GOTO:AddOption(v:Name(), function() RunConsoleCommand("ulx", "goto", v:Name()) end)
			end
		end
		aqm.addNoneLabel(TELE_SUBMENU_GOTO, 1)
	end

	if hasAccess("ulx return") then
		local TELE_SUBMENU_RETURN = TELE_SUBMENU:AddSubMenu("Return")

		for k,v in pairs(player.GetAll()) do
			TELE_SUBMENU_RETURN:AddOption(v:Name(), function() RunConsoleCommand("ulx", "return", v:Name()) end)
		end
		aqm.addNoneLabel(TELE_SUBMENU_RETURN, 0)
	end


	/* SPECTATE MENU */
	if hasAccess("ulx spectate") then

		local SPECTATE_SUBMENU, SPECTATE_SUBMENU_ICO = menu:AddSubMenu("Spectate")
		SPECTATE_SUBMENU_ICO:SetImage( "icon16/eye.png" )

		for k,v in pairs(player.GetAll()) do
			SPECTATE_SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("ulx", "spectate", v:Name()) end)
		end

		aqm.addNoneLabel(BAN_SUBMENU, 0)

	end

	menu:AddSpacer()

	/* Player */
	local PLAYER_SUBMENU, PLAYER_SUBMENU_ICO = menu:AddSubMenu("Administrative")
	PLAYER_SUBMENU_ICO:SetImage( "icon16/user.png" )

	if hasAccess("ulx hp") then
		local SUBMENU_HEALTH, SUBMENU_HEALTH_ICO = PLAYER_SUBMENU:AddSubMenu("Health")
		SUBMENU_HEALTH_ICO:SetImage( "icon16/heart.png" )

		for k,v in pairs(player.GetAll()) do
			local SUBMENU_HEALTH_AMOUNT = SUBMENU_HEALTH:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				SUBMENU_HEALTH_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "hp", v:Name(), y.Len) end)
			end
		end
		aqm.addNoneLabel(SUBMENU_HEALTH_AMOUNT, 0)
	end

	if hasAccess("ulx armor") then
		local SUBMENU_ARMOR, SUBMENU_ARMOR_ICON = PLAYER_SUBMENU:AddSubMenu("Armor")
		SUBMENU_ARMOR_ICON:SetImage( "icon16/shield.png" )

		for k,v in pairs(player.GetAll()) do
			local SUBMENU_ARMOR_AMOUNT = SUBMENU_ARMOR:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				SUBMENU_ARMOR_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "armor", v:Name(), y.Len) end)
			end
		end
		aqm.addNoneLabel(SUBMENU_ARMOR_AMOUNT, 0)
	end

	if hasAccess("ulx jail") then
		local SUBMENU, SUBMENU_ICO = PLAYER_SUBMENU:AddSubMenu("Jail")
		SUBMENU_ICO:SetImage( "icon16/flag_red.png" )

		for k,v in pairs(player.GetAll()) do
			local SUBMENU_TIME = SUBMENU:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.jailValues) do
				SUBMENU_TIME:AddOption(y.Str, function() RunConsoleCommand("ulx", "jail", v:Name(), y.Len) end)
			end
		end
		aqm.addNoneLabel(SUBMENU, 0)
	end

	if hasAccess("ulx mute") then

		local MUTE_SUBMENU, MUTE_SUBMENU_ICO = PLAYER_SUBMENU:AddSubMenu("Mute")
		MUTE_SUBMENU_ICO:SetImage( "icon16/comment_delete.png" )

		for k,v in pairs(player.GetAll()) do
			MUTE_SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("ulx", "mute", v:Name()) end)
		end

		aqm.addNoneLabel(MUTE_SUBMENU, 0)

	end
	

	PLAYER_SUBMENU:AddSpacer()

	if hasAccess("ulx unmute") then

		local MUTE_SUBMENU = PLAYER_SUBMENU:AddSubMenu("Un-Mute")

		for k,v in pairs(player.GetAll()) do
			MUTE_SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unmute", v:Name()) end)
		end

		aqm.addNoneLabel(MUTE_SUBMENU, 0)

	end

	if hasAccess("ulx unjail") then

		local MUTE_SUBMENU = PLAYER_SUBMENU:AddSubMenu("Un-Jail")

		for k,v in pairs(player.GetAll()) do
			MUTE_SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unjail", v:Name()) end)
		end

		aqm.addNoneLabel(MUTE_SUBMENU, 0)

	end

	/* FUN */
	local FUN_SUBMENU, FUN_SUBMENU_ICO = menu:AddSubMenu("Fun")
	FUN_SUBMENU_ICO:SetImage( "icon16/emoticon_smile.png" )

	if hasAccess("ulx blind") then
		local FUN_SUBMENU_BLIND = FUN_SUBMENU:AddSubMenu("Blind")

		for k,v in pairs(player.GetAll()) do
			local FUN_SUBMENU_BLIND_AMOUNT = FUN_SUBMENU_BLIND:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_BLIND_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "blind", v:Name(), y.Len) end)
			end
		end
		aqm.addNoneLabel(FUN_SUBMENU_BLIND_AMOUNT, 0)
	end

	if hasAccess("ulx cloak") then
		local FUN_SUBMENU_CLOAK = FUN_SUBMENU:AddSubMenu("Cloak")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_CLOAK:AddOption(v:Name(), function() RunConsoleCommand("ulx", "cloak", v:Name(), 255 ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_CLOAK, 0)
	end

	if hasAccess("ulx freeze") then
		local FUN_SUBMENU_FREEZE = FUN_SUBMENU:AddSubMenu("Freeze")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_FREEZE:AddOption(v:Name(), function() RunConsoleCommand("ulx", "freeze", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_FREEZE, 0)
	end
	
	if hasAccess("ulx god") then
		local FUN_SUBMENU_GOD = FUN_SUBMENU:AddSubMenu("God")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_GOD:AddOption(v:Name(), function() RunConsoleCommand("ulx", "god", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_GOD, 0)
	end

	if hasAccess("ulx ignite") then
		local FUN_SUBMENU_JAIL = FUN_SUBMENU:AddSubMenu("Ignite")

		for k,v in pairs(player.GetAll()) do
			local FUN_SUBMENU_JAIL_AMOUNT = FUN_SUBMENU_JAIL:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.jailValues) do
				FUN_SUBMENU_JAIL_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "ignite", v:Name(), y.Len) end)
			end
		end
		aqm.addNoneLabel(FUN_SUBMENU_JAIL_AMOUNT, 0)
	end


	if hasAccess("ulx maul") then
		local FUN_SUBMENU_SLAY = FUN_SUBMENU:AddSubMenu("Maul")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_SLAY:AddOption(v:Name(), function() RunConsoleCommand("ulx", "maul", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_SLAY, 0)
	end

	if hasAccess("ulx ragdoll") then
		local FUN_SUBMENU_RAGDOLL = FUN_SUBMENU:AddSubMenu("Ragdoll")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_RAGDOLL:AddOption(v:Name(), function() RunConsoleCommand("ulx", "ragdoll", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_RAGDOLL, 0)
	end

	if hasAccess("ulx slap") then
		local FUN_SUBMENU_SLAP = FUN_SUBMENU:AddSubMenu("Slap")

		for k,v in pairs(player.GetAll()) do
			local FUN_SUBMENU_SLAP_AMOUNT = FUN_SUBMENU_SLAP:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_SLAP_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "slap", v:Name(), y.Len) end)
			end
		end
		aqm.addNoneLabel(FUN_SUBMENU_SLAP_AMOUNT, 0)
	end

	if hasAccess("ulx slay") then
		local FUN_SUBMENU_SLAY = FUN_SUBMENU:AddSubMenu("Slay")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_SLAY:AddOption(v:Name(), function() RunConsoleCommand("ulx", "slay", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_SLAY, 0)
	end

	if hasAccess("ulx sslay") then
		local FUN_SUBMENU_SLAY = FUN_SUBMENU:AddSubMenu("Silent Slay")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_SLAY:AddOption(v:Name(), function() RunConsoleCommand("ulx", "sslay", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_SLAY, 0)
	end

	if hasAccess("ulx strip") then
		local FUN_SUBMENU_STRIP = FUN_SUBMENU:AddSubMenu("Strip")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_STRIP:AddOption(v:Name(), function() RunConsoleCommand("ulx", "strip", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_STRIP, 0)
	end

	if hasAccess("ulx whip") then
		local FUN_SUBMENU_WHIP = FUN_SUBMENU:AddSubMenu("Whip")

		for k,v in pairs(player.GetAll()) do
			local FUN_SUBMENU_WHIP_AMOUNT = FUN_SUBMENU_WHIP:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_WHIP_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "whip", v:Name(), 10, y.Len) end)
			end
		end
		aqm.addNoneLabel(FUN_SUBMENU_WHIP_AMOUNT, 0)
	end

	FUN_SUBMENU:AddSpacer()

	if hasAccess("ulx uncloak") then
		local FUN_SUBMENU_UNCLOAK = FUN_SUBMENU:AddSubMenu("Un-Cloak")
		for k,v in pairs(player.GetAll()) do

			FUN_SUBMENU_UNCLOAK:AddOption(v:Name(), function() RunConsoleCommand("ulx", "uncloak", v:Name(), 255 ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_UNCLOAK, 0)
	end

	if hasAccess("ulx unfreeze") then
		local FUN_SUBMENU_UNFREEZE = FUN_SUBMENU:AddSubMenu("Un-Freeze")
		for k,v in pairs(player.GetAll()) do

			FUN_SUBMENU_UNFREEZE:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unfreeze", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_UNFREEZE, 0)
	end

	if hasAccess("ulx ungod") then
		local FUN_SUBMENU_UNGOD = FUN_SUBMENU:AddSubMenu("Un-God")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_UNGOD:AddOption(v:Name(), function() RunConsoleCommand("ulx", "ungod", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_UNGOD, 0)
	end

	if hasAccess("ulx jail") then
		local FUN_SUBMENU_UNJAIL = FUN_SUBMENU:AddSubMenu("Un-Jail")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_UNJAIL:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unjail", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_UNJAIL, 0)
	end


	if hasAccess("ulx unragdoll") then
		local FUN_SUBMENU_UNRAGDOLL = FUN_SUBMENU:AddSubMenu("Un-Ragdoll")

		for k,v in pairs(player.GetAll()) do
			FUN_SUBMENU_UNRAGDOLL:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unragdoll", v:Name() ) end)
		end
		aqm.addNoneLabel(FUN_SUBMENU_UNRAGDOLL, 0)
	end

	
	menu:AddSpacer()

	/* RCON */
	if hasAccess("ulx cexec") or hasAccess("ulx luarun") or hasAccess("ulx rcon") then

	local RCON_SUBMENU, RCON_SUBMENU_ICO = menu:AddSubMenu("Rcon")
	RCON_SUBMENU_ICO:SetImage( "icon16/application_xp_terminal.png" )

	if hasAccess("ulx cexec") then
		local RCON_SUBMENU_CEXEC = RCON_SUBMENU:AddSubMenu("Cexec")

		for k,v in pairs(player.GetAll()) do
			RCON_SUBMENU_CEXEC:AddOption(v:Name(), function() 
				Derma_StringRequest( "CEXEC", "Write your command to run on "..v:Name(), nil, function(text) RunConsoleCommand("ulx", "cexec", v:Name(), text) end, function() end )
			end)
		end
		aqm.addNoneLabel(RCON_SUBMENU_CEXEC, 0)
	end

	if hasAccess("ulx luarun") then
		RCON_SUBMENU:AddOption("Luarun", function()
			Derma_StringRequest( "LUARUN", "Write your command to luarun", nil, function(text) RunConsoleCommand("ulx", "luarun", text) end, function() end )
		end)
	end

	if hasAccess("ulx rcon") then
		RCON_SUBMENU:AddOption("Rcon", function()
			Derma_StringRequest( "RCON", "Write your command to RCON", nil, function(text) RunConsoleCommand("ulx", "rcon", text) end, function() end )
		end)
	end

	end

	/* ACCESS */
	if hasAccess("ulx adduser") or hasAccess("ulx removeuser") then

		local ACC_SUBMENU, ACC_SUBMENU_ICO = menu:AddSubMenu("Access")
		ACC_SUBMENU_ICO:SetImage( "icon16/key.png" )

		if hasAccess("ulx adduser") then
			local ACC_SUBMENU_ADDUSER = ACC_SUBMENU:AddSubMenu("Add User")

			for k,v in pairs(player.GetAll()) do
				local ACC_SUBMENU_ADDUSER_GROUP = ACC_SUBMENU_ADDUSER:AddSubMenu(v:Name())
				for x, y in ipairs(xgui.data.groups) do
					ACC_SUBMENU_ADDUSER_GROUP:AddOption(y, function() RunConsoleCommand("ulx", "adduser", v:Name(), y) end)
				end
			end
			aqm.addNoneLabel(ACC_SUBMENU_ADDUSER_GROUP, 0)
		end

		if hasAccess("ulx removeuser") then
			local ACC_SUBMENU_ADDUSER = ACC_SUBMENU:AddSubMenu("Remove User")

			for k,v in pairs(player.GetAll()) do
				ACC_SUBMENU_ADDUSER:AddOption(v:Name(), function() RunConsoleCommand("ulx", "removeuser", v:Name()) end)
			end
			aqm.addNoneLabel(ACC_SUBMENU_ADDUSER_GROUP, 0)
		end
	end
end