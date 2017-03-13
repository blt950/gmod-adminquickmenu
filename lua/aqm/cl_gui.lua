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


function aqm.showMenu()
	local menu = DermaMenu() 
	menu:AddOption("Admin Quick Menu", function() chatError("by Blt950. Purchased from ScriptFodder.com") end)
	menu:AddSpacer()


	// Draw the menus

	for ikey, interface in pairs(aqm.interfaces) do

		local MENU_PRIMARY, MENU_ICO = menu:AddSubMenu( interface.label )
		MENU_ICO:SetImage( interface.icon )

		local noPly = #player.GetAll() == 0
		for _,ply in pairs(player.GetAll()) do

			local MENU_SECONDARY = nil
			local MENU_TERTIARY = nil

			if interface.draw["ulx"].playerSelect then

				if interface.draw["ulx"].reasonSelect then
					MENU_SECONDARY = MENU_PRIMARY:AddSubMenu(ply:Name())
				else
					MENU_PRIMARY:AddOption(ply:Name(), function()

						Derma_StringRequest(
							interface.label, 
							"Write your reason below to "..string.lower(interface.label).." "..ply:Name(), 
							nil, 
							function(text) interface.draw["ulx"].endPointFunc(ply, text) end,
							nil, 
							interface.label
						)

				 	end)
				end

				if interface.draw["ulx"].reasonSelect then
					for x, y in pairs(interface.draw["ulx"].reasonTable) do
						MENU_SECONDARY:AddOption(y, function() interface.draw["ulx"].endPointFunc(ply, y) end)
					end

					if interface.draw["ulx"].reasonCustom then
						MENU_SECONDARY:AddSpacer()
						MENU_SECONDARY:AddOption("Custom reason", function()
							Derma_StringRequest(
								interface.label, 
								"Write your reason below to "..string.lower(interface.label).." "..ply:Name(), 
								nil, 
								function(text) interface.draw["ulx"].endPointFunc(ply, text) end,
								nil, 
								interface.label
							)
					 	end)
					end
				end
			end
		end
	end


	/* KICK MENU */
	/*if hasAccess("ulx kick") then

	local KICK_SUBMENU, KICK_SUBMENU_ICO = menu:AddSubMenu("Kick")
	KICK_SUBMENU_ICO:SetImage( "icon16/error.png" )
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local KICK_SUBMENUREASON = KICK_SUBMENU:AddSubMenu(v:Name())
			for x, y in pairs(ulx.common_kick_reasons) do
				KICK_SUBMENUREASON:AddOption(y, function() RunConsoleCommand("ulx", "kick", v:Name(), y) end)
			end
			KICK_SUBMENUREASON:AddSpacer()
			KICK_SUBMENUREASON:AddOption("Custom reason", function()
				Derma_StringRequest( "Kick", "Write your kick reason below to kick "..v:Name(), nil, function(text) RunConsoleCommand("ulx", "kick", v:Name(), text) end, function() end )
		 	end) 
		end
		if count == 0 then KICK_SUBMENU:AddOption("(None)", function() end) end

	end*/
	/* BAN MENU */
	if hasAccess("ulx ban") then

	local BAN_SUBMENU, BAN_SUBMENU_ICO = menu:AddSubMenu("Ban")
	BAN_SUBMENU_ICO:SetImage( "icon16/exclamation.png" )
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local BAN_SUBMENULENGTH = BAN_SUBMENU:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.banLengths) do
				local BAN_SUBMENUREASON = BAN_SUBMENULENGTH:AddSubMenu(y.Str)
				for q, w in pairs(ulx.common_kick_reasons) do
					BAN_SUBMENUREASON:AddOption(w, function() RunConsoleCommand("ulx", "ban", v:Name(), y.Len, w) end)
				end
				BAN_SUBMENUREASON:AddSpacer()
				BAN_SUBMENUREASON:AddOption("Custom reason", function()
					Derma_StringRequest( "Ban", "Write your ban reason below to ban "..v:Name().." for "..y.Str, nil, function(text) RunConsoleCommand("ulx", "ban", v:Name(), y.Len, text) end, function() end )
			 	end) 
			end
			
		end
		if count == 0 then BAN_SUBMENU:AddOption("(None)", function() end) end

	end

	/* UNBAN */
	if hasAccess("ulx unban") and hasAccess("xgui_managebans") then
		menu:AddOption("Unban ...", function() RunConsoleCommand("xgui", "show", "Bans") end)
		
	end

	menu:AddSpacer()

	/* FUN */
	local FUN_SUBMENU, FUN_SUBMENU_ICO = menu:AddSubMenu("Fun")
	FUN_SUBMENU_ICO:SetImage( "icon16/emoticon_smile.png" )

	if hasAccess("ulx hp") then
		local FUN_SUBMENU_HEALTH = FUN_SUBMENU:AddSubMenu("Health")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local FUN_SUBMENU_HEALTH_AMOUNT = FUN_SUBMENU_HEALTH:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_HEALTH_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "hp", v:Name(), y.Len) end)
			end
		end
		if count == 0 then FUN_SUBMENU_HEALTH:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx armor") then
		local FUN_SUBMENU_ARMOR = FUN_SUBMENU:AddSubMenu("Armor")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local FUN_SUBMENU_ARMOR_AMOUNT = FUN_SUBMENU_ARMOR:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_ARMOR_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "armor", v:Name(), y.Len) end)
			end
		end
		if count == 0 then FUN_SUBMENU_ARMOR:AddOption("(None)", function() end) end
	end
	FUN_SUBMENU:AddSpacer()

	if hasAccess("ulx blind") then
		local FUN_SUBMENU_BLIND = FUN_SUBMENU:AddSubMenu("Blind")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local FUN_SUBMENU_BLIND_AMOUNT = FUN_SUBMENU_BLIND:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_BLIND_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "blind", v:Name(), y.Len) end)
			end
		end
		if count == 0 then FUN_SUBMENU_BLIND:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx cloak") then
		local FUN_SUBMENU_CLOAK = FUN_SUBMENU:AddSubMenu("Cloak")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_CLOAK:AddOption(v:Name(), function() RunConsoleCommand("ulx", "cloak", v:Name(), 255 ) end)
		end
		if count == 0 then FUN_SUBMENU_CLOAK:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx freeze") then
		local FUN_SUBMENU_FREEZE = FUN_SUBMENU:AddSubMenu("Freeze")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_FREEZE:AddOption(v:Name(), function() RunConsoleCommand("ulx", "freeze", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_FREEZE:AddOption("(None)", function() end) end
	end
	
	if hasAccess("ulx god") then
		local FUN_SUBMENU_GOD = FUN_SUBMENU:AddSubMenu("God")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_GOD:AddOption(v:Name(), function() RunConsoleCommand("ulx", "god", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_GOD:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx jail") then
		local FUN_SUBMENU_JAIL = FUN_SUBMENU:AddSubMenu("Jail")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local FUN_SUBMENU_JAIL_AMOUNT = FUN_SUBMENU_JAIL:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.jailValues) do
				FUN_SUBMENU_JAIL_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "jail", v:Name(), y.Len) end)
			end
		end
		if count == 0 then FUN_SUBMENU_JAIL:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx ragdoll") then
		local FUN_SUBMENU_RAGDOLL = FUN_SUBMENU:AddSubMenu("Ragdoll")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_RAGDOLL:AddOption(v:Name(), function() RunConsoleCommand("ulx", "ragdoll", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_RAGDOLL:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx slap") then
		local FUN_SUBMENU_SLAP = FUN_SUBMENU:AddSubMenu("Slap")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local FUN_SUBMENU_SLAP_AMOUNT = FUN_SUBMENU_SLAP:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_SLAP_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "slap", v:Name(), y.Len) end)
			end
		end
		if count == 0 then FUN_SUBMENU_SLAP:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx slay") then
		local FUN_SUBMENU_SLAY = FUN_SUBMENU:AddSubMenu("Slay")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_SLAY:AddOption(v:Name(), function() RunConsoleCommand("ulx", "slay", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_SLAY:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx strip") then
		local FUN_SUBMENU_STRIP = FUN_SUBMENU:AddSubMenu("Strip")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_STRIP:AddOption(v:Name(), function() RunConsoleCommand("ulx", "strip", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_STRIP:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx whip") then
		local FUN_SUBMENU_WHIP = FUN_SUBMENU:AddSubMenu("Whip")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local FUN_SUBMENU_WHIP_AMOUNT = FUN_SUBMENU_WHIP:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.defaultValues) do
				FUN_SUBMENU_WHIP_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("ulx", "whip", v:Name(), 10, y.Len) end)
			end
		end
		if count == 0 then FUN_SUBMENU_SLAP:AddOption("(None)", function() end) end
	end

	FUN_SUBMENU:AddSpacer()

	if hasAccess("ulx uncloak") then
		local FUN_SUBMENU_UNCLOAK = FUN_SUBMENU:AddSubMenu("Un-Cloak")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_UNCLOAK:AddOption(v:Name(), function() RunConsoleCommand("ulx", "uncloak", v:Name(), 255 ) end)
		end
		if count == 0 then FUN_SUBMENU_UNCLOAK:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx unfreeze") then
		local FUN_SUBMENU_UNFREEZE = FUN_SUBMENU:AddSubMenu("Un-Freeze")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_UNFREEZE:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unfreeze", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_UNFREEZE:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx ungod") then
		local FUN_SUBMENU_UNGOD = FUN_SUBMENU:AddSubMenu("Un-God")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_UNGOD:AddOption(v:Name(), function() RunConsoleCommand("ulx", "ungod", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_UNGOD:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx jail") then
		local FUN_SUBMENU_UNJAIL = FUN_SUBMENU:AddSubMenu("Un-Jail")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_UNJAIL:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unjail", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_UNJAIL:AddOption("(None)", function() end) end
	end


	if hasAccess("ulx unragdoll") then
		local FUN_SUBMENU_UNRAGDOLL = FUN_SUBMENU:AddSubMenu("Un-Ragdoll")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			FUN_SUBMENU_UNRAGDOLL:AddOption(v:Name(), function() RunConsoleCommand("ulx", "unragdoll", v:Name() ) end)
		end
		if count == 0 then FUN_SUBMENU_UNRAGDOLL:AddOption("(None)", function() end) end
	end

	/* RCON */
	if hasAccess("ulx cexec") or hasAccess("ulx luarun") or hasAccess("ulx rcon") then

	local RCON_SUBMENU, RCON_SUBMENU_ICO = menu:AddSubMenu("Rcon")
	RCON_SUBMENU_ICO:SetImage( "icon16/application_xp_terminal.png" )

	if hasAccess("ulx cexec") then
		local RCON_SUBMENU_CEXEC = RCON_SUBMENU:AddSubMenu("Cexec")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			RCON_SUBMENU_CEXEC:AddOption(v:Name(), function() 
				Derma_StringRequest( "CEXEC", "Write your command to run on "..v:Name(), nil, function(text) RunConsoleCommand("ulx", "cexec", v:Name(), text) end, function() end )
			end)
		end
		if count == 0 then RCON_SUBMENU_CEXEC:AddOption("(None)", function() end) end
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

	/* TELEPORT */
	local TELE_SUBMENU, TELE_SUBMENU_ICO = menu:AddSubMenu("Teleport")
	TELE_SUBMENU_ICO:SetImage( "icon16/map.png" )

	if hasAccess("ulx bring") then
		local TELE_SUBMENU_BRING = TELE_SUBMENU:AddSubMenu("Bring")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			if v != LocalPlayer() then
				count = count + 1
				TELE_SUBMENU_BRING:AddOption(v:Name(), function() RunConsoleCommand("ulx", "bring", v:Name()) end)
			end
		end
		if count == 0 then TELE_SUBMENU_BRING:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx goto") then
		local TELE_SUBMENU_GOTO = TELE_SUBMENU:AddSubMenu("Goto")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			if v != LocalPlayer() then
				count = count + 1
				TELE_SUBMENU_GOTO:AddOption(v:Name(), function() RunConsoleCommand("ulx", "goto", v:Name()) end)
			end
		end
		if count == 0 then TELE_SUBMENU_GOTO:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx return") then
		local TELE_SUBMENU_RETURN = TELE_SUBMENU:AddSubMenu("Return")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			TELE_SUBMENU_RETURN:AddOption(v:Name(), function() RunConsoleCommand("ulx", "return", v:Name()) end)
		end
		if count == 0 then TELE_SUBMENU_RETURN:AddOption("(None)", function() end) end
	end

	/* ACCESS */
	menu:AddSpacer()

	if hasAccess("ulx adduser") or hasAccess("ulx removeuser") then

	local ACC_SUBMENU, ACC_SUBMENU_ICO = menu:AddSubMenu("Access")
	ACC_SUBMENU_ICO:SetImage( "icon16/key.png" )

	if hasAccess("ulx adduser") then
		local ACC_SUBMENU_ADDUSER = ACC_SUBMENU:AddSubMenu("Add User")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			local ACC_SUBMENU_ADDUSER_GROUP = ACC_SUBMENU_ADDUSER:AddSubMenu(v:Name())
			for x, y in ipairs(xgui.data.groups) do
				ACC_SUBMENU_ADDUSER_GROUP:AddOption(y, function() RunConsoleCommand("ulx", "adduser", v:Name(), y) end)
			end
		end
		if count == 0 then ACC_SUBMENU_ADDUSER:AddOption("(None)", function() end) end
	end

	if hasAccess("ulx removeuser") then
		local ACC_SUBMENU_ADDUSER = ACC_SUBMENU:AddSubMenu("Remove User")
		local count = 0
		for k,v in pairs(player.GetAll()) do
			count = count + 1
			ACC_SUBMENU_ADDUSER:AddOption(v:Name(), function() RunConsoleCommand("ulx", "removeuser", v:Name()) end)
		end
		if count == 0 then ACC_SUBMENU_ADDUSER:AddOption("(None)", function() end) end
	end

	end

	menu:Open( 100, 100 )
	gui.SetMousePos( 110, 110 )
end

function aqm.hideMenu()
	CloseDermaMenus()
end
concommand.Add("+ULXqm", aqm.showMenu)
concommand.Add("-ULXqm", aqm.hideMenu)

function hasAccess(cmd)
	if LocalPlayer():query(cmd) then
		return true
	else
		return false
	end
end	

function chatError(string)
	chat.AddText(Color(200,100,100),"Admin Quick Menu: "..string)
end