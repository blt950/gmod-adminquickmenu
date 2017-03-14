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

function aqm.buildFAMenu(menu)

	// ===========================
	// === KICK MENU
	// ===========================
	if aqm.hasAccess("kick") then

		local SUBMENU, SUBMENU_ICO = menu:AddSubMenu("Kick")
		SUBMENU_ICO:SetImage( "icon16/error.png" )

		for k,v in pairs(player.GetAll()) do
			SUBMENU:AddOption(v:Name(), function()
				Derma_StringRequest( "Kick", "Write your reason to kick '"..v:Name().."'", nil, function(text) RunConsoleCommand("fadmin", "kick", v:Name(), text) end, nil, "Kick" )
		 	end) 
		end
		aqm.addNoneLabel(SUBMENU, 0)

	end

	// ===========================
	// === BAN MENU
	// ===========================
	if aqm.hasAccess("ban") then

		local SUBMENU, SUBMENU_ICO = menu:AddSubMenu("Ban")
		SUBMENU_ICO:SetImage( "icon16/exclamation.png" )

		for k,v in pairs(player.GetAll()) do
			local SUBMENU_LENGTH = SUBMENU:AddSubMenu(v:Name())
			for x, y in ipairs(aqm.config.banLengths) do
				SUBMENU_LENGTH:AddOption(y.Str, function()
					Derma_StringRequest( "Ban", "Write your reason to your "..string.lower(y.Str).." ban for '"..v:Name().."'", nil, function(text) RunConsoleCommand("fadmin", "ban", v:Name(), y.Len, text) end, nil, y.Str.." Ban")
			 	end) 
			end
			
		end
		aqm.addNoneLabel(SUBMENU, 0)

	end

	// ===========================
	// === BAN MENU
	// ===========================
	if aqm.hasAccess("unban") then
		menu:AddOption("Unban ...", function()
			Derma_StringRequest( "Unban", "Write STEAMID to unban", nil, function(text) RunConsoleCommand("fadmin", "unban", text) end, nil, "Unban")
		end)
	end

	





	// ###########################
	// ### TELEPORT CATEGORY
	// ###########################

	if aqm.hasAccess("bring") or aqm.hasAccess("goto") or aqm.hasAccess("return") then

		menu:AddSpacer()
		local CATEGORY_TELEPORT, CATEGORY_TELEPORT_ICO = menu:AddSubMenu("Teleport")
		CATEGORY_TELEPORT_ICO:SetImage( "icon16/map.png" )


			// ===========================
			// === BRING MENU
			// ===========================
			if aqm.hasAccess("bring") then
				local SUBMENU = CATEGORY_TELEPORT:AddSubMenu("Bring")

				for k,v in pairs(player.GetAll()) do
					if v != LocalPlayer() then
						SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "bring", v:Name()) end)
					end
				end
				aqm.addNoneLabel(SUBMENU, 1)
			end

			// ===========================
			// === GOTO MENU
			// ===========================
			if aqm.hasAccess("goto") then
				local SUBMENU = CATEGORY_TELEPORT:AddSubMenu("Goto")

				for k,v in pairs(player.GetAll()) do
					if v != LocalPlayer() then
						SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "goto", v:Name()) end)
					end
				end
				aqm.addNoneLabel(SUBMENU, 1)
			end

	end










	// ###########################
	// ### ADMIN CATEGORY
	// ###########################

	if aqm.hasAccess("hp") or aqm.hasAccess("armor") or aqm.hasAccess("jail") or aqm.hasAccess("chatmute") or aqm.hasAccess("voicemute") 
		or aqm.hasAccess("unchatmute") or aqm.hasAccess("unvoicemute") or aqm.hasAccess("unjail") then

		menu:AddSpacer()
		local CATEGORY_ADMIN, CATEGORY_ADMIN_ICO = menu:AddSubMenu("Administrative")
		CATEGORY_ADMIN_ICO:SetImage( "icon16/user.png" )

			// ===========================
			// === HP MENU
			// ===========================
			if aqm.hasAccess("hp") then
				local SUBMENU, SUBMENU_ICO = CATEGORY_ADMIN:AddSubMenu("Health")
				SUBMENU_ICO:SetImage( "icon16/heart.png" )

				for k,v in pairs(player.GetAll()) do
					local SUBMENU_AMOUNT = SUBMENU:AddSubMenu(v:Name())
					for x, y in ipairs(aqm.config.defaultValues) do
						SUBMENU_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("fadmin", "hp", v:Name(), y.Len) end)
					end
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === JAIL MENU
			// ===========================
			if aqm.hasAccess("jail") then
				local SUBMENU, SUBMENU_ICO = CATEGORY_ADMIN:AddSubMenu("Jail")
				SUBMENU_ICO:SetImage( "icon16/flag_red.png" )

				for k,v in pairs(player.GetAll()) do
					local SUBMENU_TIME = SUBMENU:AddSubMenu(v:Name())
					for x, y in ipairs(aqm.config.jailValues) do
						SUBMENU_TIME:AddOption(y.Str, function() RunConsoleCommand("fadmin", "jail", v:Name(), "normal", y.Len) end)
					end
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === CHAT MUTE MENU
			// ===========================
			if aqm.hasAccess("chatmute") then

				local SUBMENU, SUBMENU_ICO = CATEGORY_ADMIN:AddSubMenu("Chat Mute")
				SUBMENU_ICO:SetImage( "icon16/comment_delete.png" )

				for k,v in pairs(player.GetAll()) do

					local SUBMENU_TIME = SUBMENU:AddSubMenu(v:Name())
					for _, time in pairs(aqm.config.defaultValues_FADMIN) do
						SUBMENU_TIME:AddOption(time.Str, function() RunConsoleCommand("fadmin", "chatmute", v:Name(), time.Len) end)
					end
					
				end

				aqm.addNoneLabel(SUBMENU, 0)

			end

			// ===========================
			// === VOICE MUTE MENU
			// ===========================
			if aqm.hasAccess("voicemute") then

				local SUBMENU, SUBMENU_ICO = CATEGORY_ADMIN:AddSubMenu("Voice Mute")
				SUBMENU_ICO:SetImage( "icon16/comment_delete.png" )

				for k,v in pairs(player.GetAll()) do

					local SUBMENU_TIME = SUBMENU:AddSubMenu(v:Name())
					for _, time in pairs(aqm.config.defaultValues_FADMIN) do
						SUBMENU_TIME:AddOption(time.Str, function() RunConsoleCommand("fadmin", "voicemute", v:Name(), time.Len) end)
					end
					
				end

				aqm.addNoneLabel(SUBMENU, 0)

			end

			// ===========================
			// === SET TEAM MENU
			// ===========================
			if aqm.hasAccess("setteam") then

				local SUBMENU, SUBMENU_ICO = CATEGORY_ADMIN:AddSubMenu("Set Team")
				SUBMENU_ICO:SetImage( "icon16/group.png" )

				for k,v in pairs(player.GetAll()) do
					local SUBMENU_TEAMS = SUBMENU:AddSubMenu(v:Name())

					for _, team in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
						if team.Joinable then
							SUBMENU_TEAMS:AddOption(team.Name, function() RunConsoleCommand("fadmin", "setteam", v:Name(), team.Name) end)
						end
					end
				end

				aqm.addNoneLabel(SUBMENU, 0)

			end
			

			CATEGORY_ADMIN:AddSpacer()

			// ===========================
			// === UN-CHATMUTE MENU
			// ===========================
			if aqm.hasAccess("unchatmute") then

				local SUBMENU = CATEGORY_ADMIN:AddSubMenu("Un-Chat Mute")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "unchatmute", v:Name()) end)
				end

				aqm.addNoneLabel(SUBMENU, 0)

			end

			// ===========================
			// === UN-VOICEMUTE MENU
			// ===========================
			if aqm.hasAccess("unvoicemute") then

				local SUBMENU = CATEGORY_ADMIN:AddSubMenu("Un-Voice Mute")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "unvoicemute", v:Name()) end)
				end

				aqm.addNoneLabel(SUBMENU, 0)

			end


			// ===========================
			// === UN-JAIL MENU
			// ===========================
			if aqm.hasAccess("unjail") then

				local SUBMENU = CATEGORY_ADMIN:AddSubMenu("Un-Jail")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "unjail", v:Name()) end)
				end

				aqm.addNoneLabel(SUBMENU, 0)

			end
	end










	// ###########################
	// ### FUN CATEGORY
	// ###########################

	if aqm.hasAccess("cloak") or aqm.hasAccess("freeze") or aqm.hasAccess("god") or aqm.hasAccess("ignite")
		or aqm.hasAccess("ragdoll") or aqm.hasAccess("slap") or aqm.hasAccess("slay") or aqm.hasAccess("strip")
		 or aqm.hasAccess("uncloak") or aqm.hasAccess("unfreeze") or aqm.hasAccess("ungod") or aqm.hasAccess("unragdoll") then

		local CATEGORY_FUN, CATEGORY_FUN_ICO = menu:AddSubMenu("Fun")
		CATEGORY_FUN_ICO:SetImage( "icon16/emoticon_smile.png" )


			// ===========================
			// === CLOAK MENU
			// ===========================
			if aqm.hasAccess("cloak") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Cloak")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "cloak", v:Name(), 255 ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === FREEZE MENU
			// ===========================
			if aqm.hasAccess("freeze") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Freeze")

				for k,v in pairs(player.GetAll()) do

					local SUBMENU_TIME = SUBMENU:AddSubMenu(v:Name())
					for _, time in pairs(aqm.config.defaultValues_FADMIN) do
						SUBMENU_TIME:AddOption(time.Str, function() RunConsoleCommand("fadmin", "freeze", v:Name(), time.Len) end)
					end
					
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end
			
			// ===========================
			// === GOD MENU
			// ===========================
			if aqm.hasAccess("god") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("God")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "god", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === IGNITE MENU
			// ===========================
			if aqm.hasAccess("ignite") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Ignite")

				for k,v in pairs(player.GetAll()) do
					local SUBMENU_AMOUNT = SUBMENU:AddSubMenu(v:Name())
					for x, y in ipairs(aqm.config.igniteValues) do
						SUBMENU_AMOUNT:AddOption(y.Str, function() RunConsoleCommand("fadmin", "ignite", v:Name(), y.Len) end)
					end
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === RAGDOLL MENU
			// ===========================
			if aqm.hasAccess("ragdoll") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Ragdoll")

				for k,v in pairs(player.GetAll()) do

					local SUBMENU_TIME = SUBMENU:AddSubMenu(v:Name())
					for _, time in pairs(aqm.config.defaultValues_FADMIN) do
						SUBMENU_TIME:AddOption(time.Str, function() RunConsoleCommand("fadmin", "ragdoll", v:Name(), time.Len) end)
					end
					
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === SLAP MENU
			// ===========================
			if aqm.hasAccess("slap") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Slap")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "slap", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === SLAY MENU
			// ===========================
			if aqm.hasAccess("slay") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Slay")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "slay", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === STRIP MENU
			// ===========================
			if aqm.hasAccess("strip") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Strip")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "strip", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			CATEGORY_FUN:AddSpacer()

			// ===========================
			// === UN-CLOAK MENU
			// ===========================
			if aqm.hasAccess("uncloak") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Un-Cloak")
				for k,v in pairs(player.GetAll()) do

					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "uncloak", v:Name(), 255 ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === UN-FREEZE MENU
			// ===========================
			if aqm.hasAccess("unfreeze") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Un-Freeze")
				for k,v in pairs(player.GetAll()) do

					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "unfreeze", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === UN-GOD MENU
			// ===========================
			if aqm.hasAccess("ungod") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Un-God")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "ungod", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === UN-RAGDOLL MENU
			// ===========================
			if aqm.hasAccess("unragdoll") then
				local SUBMENU = CATEGORY_FUN:AddSubMenu("Un-Ragdoll")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "unragdoll", v:Name() ) end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

	end









	// ###########################
	// ### RCON CATEGORY
	// ###########################

	menu:AddSpacer()

	if aqm.hasAccess("rcon") then
		
		local CATEGORY_RCON, CATEGORY_RCON_ICO = menu:AddSubMenu("Rcon")
		CATEGORY_RCON_ICO:SetImage( "icon16/application_xp_terminal.png" )

			// ===========================
			// === RCON MENU
			// ===========================
			if aqm.hasAccess("rcon") then
				CATEGORY_RCON:AddOption("Send to console", function()
					Derma_StringRequest( "RCON", "Write your command to RCON", nil, function(text) RunConsoleCommand("fadmin", "rcon", text) end, function() end )
				end)
			end

	end









	// ###########################
	// ### ACCESS CATEGORY
	// ###########################

	if aqm.hasAccess("setaccess") then

		local CATEGORY_ACCESS, CATEGORY_ACCESS_ICO = menu:AddSubMenu("Access")
		CATEGORY_ACCESS_ICO:SetImage( "icon16/key.png" )

			// ===========================
			// === ADDUSER MENU
			// ===========================
			if aqm.hasAccess("setaccess") then
				local SUBMENU = CATEGORY_ACCESS:AddSubMenu("Set User")

				for k,v in pairs(player.GetAll()) do
					local SUBMENU_GROUP = SUBMENU:AddSubMenu(v:Name())
					for x, y in pairs(FAdmin.Access.Groups) do
						SUBMENU_GROUP:AddOption(string.capitalize(x), function() RunConsoleCommand("fadmin", "setaccess", v:Name(), x) end)
					end
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end

			// ===========================
			// === REMOVEUSER MENU
			// ===========================
			if aqm.hasAccess("setaccess") then
				local SUBMENU = CATEGORY_ACCESS:AddSubMenu("Remove User")

				for k,v in pairs(player.GetAll()) do
					SUBMENU:AddOption(v:Name(), function() RunConsoleCommand("fadmin", "setaccess", v:Name(), "user") end)
				end
				aqm.addNoneLabel(SUBMENU, 0)
			end
	end


end // End of build function