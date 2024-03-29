--[[
	This script has been purchased for "Admin Quick Menu" from ScriptFodder.com
	© 2017 Blt950 do not share, re-distribute or modify
	without permission.
--]]

aqm.version = "1.0"

/*

	This is the CONFIGURATION file. Feel free to tweak settings UNDER THIS COMMENT if you wish to.
	NO OTHER FILES are supposed to be edited, IF you do so, you LOOSE all your support rights.

*/


// Edit the length of possible bans. The number "Len" should be in minutes.
aqm.config.banLengths = {
	{Len = 0, Str = "Permanent"},
	{Len = 10080, Str = "1 Week"},
	{Len = 4320, Str = "3 Days"},
	{Len = 1440, Str = "1 Day"},
	{Len = 60, Str = "1 Hour"}
}


// Jail lengths. The number "Len" should be in seconds.
aqm.config.jailValues = {
	{Len = 0, Str = "Infinity"},
	{Len = 10, Str = "10 seconds"},
	{Len = 60, Str = "1 minute"},
	{Len = 180, Str = "3 minutes"},
	{Len = 300, Str = "5 minutes"},
	{Len = 600, Str = "10 minutes"},
	{Len = 900, Str = "15 minutes"},
	{Len = 1800, Str = "30 minutes"}
}

// Ignite lengths. The number "Len" should be in seconds.
aqm.config.igniteValues = {
	{Len = 1, Str = "1 second"},
	{Len = 5, Str = "5 seconds"},
	{Len = 10, Str = "10 seconds"},
	{Len = 15, Str = "15 seconds"},
	{Len = 30, Str = "30 seconds"},
	{Len = 60, Str = "1 minute"},
	{Len = 120, Str = "2 minutes"},
	{Len = 300, Str = "5 minutes"}
}

// [ULX ONLY] Default values used for things such as how much to cloak and similar.
aqm.config.defaultValues_ULX = {
	{Len = 0, Str = "0"},
	{Len = 1, Str = "1"},
	{Len = 25, Str = "25"},
	{Len = 50, Str = "50"},
	{Len = 75, Str = "75"},
	{Len = 100, Str = "100"},
	{Len = 255, Str = "255"}
}

// [FADMIN ONLY] Default values used for things such as lengths of freezes, mutes and similar.
aqm.config.defaultValues_FADMIN = {
	{Len = 0, Str = "Infinity"},
	{Len = 10, Str = "10 seconds"},
	{Len = 60, Str = "1 minute"},
	{Len = 180, Str = "3 minutes"},
	{Len = 300, Str = "5 minutes"},
	{Len = 600, Str = "10 minutes"},
	{Len = 900, Str = "15 minutes"},
	{Len = 1800, Str = "30 minutes"}
}
