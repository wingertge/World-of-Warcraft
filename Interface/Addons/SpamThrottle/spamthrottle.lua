--[[
	SpamThrottle - Remove redundant and annoying chat messages

	Version:	2.8
	Date:		17 Feb 2014
	Author:	Orukxu

	Only allows a particular message to be displayed once, rather than repeated.
	This happens under several different circumstances -
	someone may be advertising for people to join a raid,
	or advertising their wares in Trade chat, etc.
	It can become annoying if they spam the same message over and over,
	so this addon only displays unique messages - repeated messages are either
	colored dark gray to indicate they are repeated, or can be removed entirely.
	A timeout (call the gapping value) controls how often the exact same message
	may be repeated, and this value is settable by the user.

	Portions of this code were adapted from the following addons:
	- SpamEraser
	- ASSFilter
]]

--============================
--= Settings, Defaults, and Local Variables
--============================
local LatestVersion = "2.8";

SpamThrottleSettings = {}
SpamThrottleSettings.version = LatestVersion;
SpamThrottleSettings.filterActive = true;	-- Whether the filter is on or off, true = on, false = off
SpamThrottleSettings.filterMode = 2;	-- Default to hide the spam (1=color, 2=hide)
SpamThrottleSettings.gap = 600;		-- Default to allow message repeat once every 10 minutes (600 seconds)
SpamThrottleSettings.fuzzy = 1;		-- Default to enable the fuzzy match filter
SpamThrottleSettings.blockChinese = false;  -- Whether to block messages containing Chinese, Japanese, or Korean characters

local MessageList = {}
local MessageCount = {}
local MessageTime = {}


--============================
-- Local functions
--============================
local function SpamThrottle_strNorm(msg, Author)
	local Nmsg = "";
	local c = "";
	local lastc = "";
	local Bmsg = "";
	local ci = 35;

	if (msg == nil) then return end;

	Nmsg = msg:gsub("...hic!",""):gsub("%d",""):gsub("%c",""):gsub("%p",""):gsub("%s",""):upper():gsub("SH","S");

	if (SpamThrottleSettings.fuzzy ~= 1) then
		return Author:upper() .. msg;
	end

	if (Author ~= nil) then
		ci = ci + Author:len();
	end

	for c in Nmsg:gmatch("%u") do
		if (c ~= lastc and ci > 0) then
			Bmsg = Bmsg .. c;
		end
		lastc = c;
		ci = ci - 1;
	end
	Nmsg = Bmsg

	if (Author ~= nil) then
		Nmsg = Author:upper() .. Nmsg;
	end

	return Nmsg
end

--============================
-- Create an anonymous blank frame
--============================
local SpamThrottle_Frame = CreateFrame("FRAME", "SpamThrottleFrame");


--============================
-- Register Events and Event Handler
--============================
SpamThrottle_Frame:RegisterEvent("CHAT_MSG_CHANNEL")
SpamThrottle_Frame:RegisterEvent("CHAT_MSG_YELL")
SpamThrottle_Frame:RegisterEvent("ADDON_LOADED")

local function SpamThrottle_eventHandler(self, event, ...)
	if (event == "CHAT_MSG_CHANNEL" or event == "CHAT_MSG_YELL") then
		local arg1, arg2 = ...;

		if (arg2 ~= "") then	-- if this is not a server message (it has a playername)
			local Msg = SpamThrottle_strNorm(arg1, arg2);
			if (MessageList[Msg] == nil) then  -- If we have NOT seen this text before
				MessageList[Msg] = true;
				MessageCount[Msg] = 1;
				MessageTime[Msg] = time();
			else
				MessageCount[Msg] = MessageCount[Msg] + 1;
			end
		end

	elseif (event == "ADDON_LOADED") then
		local arg1, arg2 = ...;
		if (arg1 == "SpamThrottle") then
			if (SpamThrottleSettings.version ~= LatestVersion) then	-- Version check, to dynamically adjust variables if necessary
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: Migrating saved variables from version " .. SpamThrottleSettings.version .. " to " .. LatestVersion .. ".")
				SpamThrottleSettings.version = LatestVersion;
				if (SpamThrottleSettings.filterActive == nil) then
					SpamThrottleSettings.filterActive = true;
				end
				if (SpamThrottleSettings.filterMode == nil) then
					SpamThrottleSettings.filterMode = 2;	-- Default to hide the spam (1=color, 2=hide)
				end
				if (SpamThrottleSettings.gap == nil) then
					SpamThrottleSettings.gap = 600;		-- Default to allow message repeat once every 10 minutes (600 seconds)
				end
				if (SpamThrottleSettings.fuzzy == nil) then
					SpamThrottleSettings.fuzzy = 1;		-- Default to enable fuzzy match filtering
				end
				if (SpamThrottleSettings.blockChinese == nil) then
					SpamThrottleSettings.blockChinese = false;		-- Default to not block Chinese/Japanese/Korean messages
				end
			end
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle version " .. SpamThrottleSettings.version .. " loaded.");	
		end
	end
end
SpamThrottle_Frame:SetScript("OnEvent", SpamThrottle_eventHandler);

--============================
--= Register the Slash Command
--============================
SlashCmdList["SPTHRTL"] = function(_msg)
	if (_msg) then
		local _, _, cmd, arg1 = string.find(string.upper(_msg), "([%w]+)%s*(.*)$");		
		if ("OFF" == cmd) then -- disable the filter
			local confirmMsg = "|cFFFFFFFFSpamThrottle: |cFF00BEFFFilter Disabled|cFFFFFFFF"
			SpamThrottleSettings.filterActive = false;
			DEFAULT_CHAT_FRAME:AddMessage(confirmMsg);
		elseif ("ON" == cmd) then -- enable the filter
			local confirmMsg = "|cFFFFFFFFSpamThrottle: |cFF00BEFFFilter Enabled"
			SpamThrottleSettings.filterActive = true;
			if (SpamThrottleSettings.filterMode == 1) then
				confirmMsg = confirmMsg .. " (color mode)|cFFFFFFFF."
			else
				confirmMsg = confirmMsg .. " (hide mode)|cFFFFFFFF."
			end
			DEFAULT_CHAT_FRAME:AddMessage(confirmMsg);
		elseif ("COLOR" == cmd) then -- change the spam to a darker color to make it easy for your eyes to skip (but you still see it)
			SpamThrottleSettings.filterMode = 1;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFColor|cFFFFFFFF mode enabled.");
		elseif ("HIDE" == cmd) then -- completely hide the spam
			SpamThrottleSettings.filterMode = 2;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFHide|cFFFFFFFF mode enabled.");
		elseif ("FUZZY" == cmd) then -- enable the fuzzy matching filter (default)
			SpamThrottleSettings.fuzzy = 1;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFFuzzy|cFFFFFFFF match filter enabled.");
		elseif ("NOFUZZY" == cmd) then -- disable the fuzzy matching filter, instead requiring exact matches
			SpamThrottleSettings.fuzzy = 0;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFFuzzy|cFFFFFFFF match filter disabled - strict match mode.");
		elseif ("CBLOCK" == cmd) then -- block messages with chinese/japanese/korean characters
				SpamThrottleSettings.blockChinese = true;
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFChinese/Japanese/Korean|cFFFFFFFF messages are now blocked.");
		elseif ("NOCBLOCK" == cmd) then -- allow messages with chinese/japanese/korean characters
				SpamThrottleSettings.blockChinese = false;
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFChinese/Japanese/Korean|cFFFFFFFF messages are now allowed.");
		elseif ("RESET" == cmd) then -- reset the unique message list
			MessageList = {}
			MessageCount = {}
			MessageTime = {}
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: |cFF00BEFFReset|cFFFFFFFF of unique message database complete.");
		elseif (tonumber(_msg) ~= nil) then
			local gapseconds = tonumber(_msg);
			if (gapseconds >= 0 and gapseconds <= 10000) then
				SpamThrottleSettings.gap = tonumber(_msg);
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: gapping now set to |cFF00BEFF" .. SpamThrottleSettings.gap .. "|cFFFFFFFF seconds.");
			else
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSpamThrottle: gapping value can only be set from 0 to 10000 seconds.");
			end
		else -- either a gap command or an incorrect option
			local badCmd = ''; if (_msg ~= "") then badCmd = ' Unknown command "' .. _msg .. '".'; end;
			local option1, option2, option3, option4, option5, option6, option7, isactive = "", "", "", "", "", "", "", "";
			if (SpamThrottleSettings.filterMode == 1) then
				option1 = "(Active) ";
			elseif (SpamThrottleSettings.filterMode == 2) then
				option2 = "(Active) ";
			end
			if (SpamThrottleSettings.gap ~= nil) then
				option3 = "(" .. SpamThrottleSettings.gap .. ") ";
			end
			if (SpamThrottleSettings.fuzzy == 1) then
				option4 = "(Active) ";
			else
				option5 = "(Active) "
			end
			if (SpamThrottleSettings.blockChinese == true) then
				option6 = "(Active) ";
			else
				option7 = "(Active) ";
			end
			if (SpamThrottleSettings.filterActive == true) then
				isactive = "(currently enabled):"
			else
				isactive = "(currently disabled):"
			end
			local helpMsg = '|cFFFFFFFF/spamthrottle or /st ' .. isactive .. badCmd .. "\n" ..
				"[ Valid Commands: ]\n" ..
				"on: |cFF00BEFFEnables spam filtering.|cFFFFFFFF\n" .. 
				"off: |cFF00BEFFDisables spam filtering, making all messages show up as normal.|cFFFFFFFF\n" ..
				"color: " .. option1 .. "|cFF00BEFFColors spam dark gray to make it easy for the eyes to skip it.|cFFFFFFFF\n" ..
				"hide: " .. option2 .. "|cFF00BEFFCompletely hides all spam from ever being shown on the screen.|cFFFFFFFF\n" ..
				"fuzzy: " .. option4 .. "|cFF00BEFFenables the fuzzy matching filter; filter blocks closely similar text.|cFFFFFFFF\n" ..
				"nofuzzy: " .. option5 .. "|cFF00BEFFdisables the fuzzy matching filter; filter blocks only strict repeats.|cFFFFFFFF\n" ..
				"cblock: " .. option6 .. "|cFF00BEFFturns on a filter to block Chinese, Japanese, Korean messages.|cFFFFFFFF\n" ..
				"nocblock: " .. option7 .. "|cFF00BEFFturns off a filter to block Chinese, Japanese, Korean messages.|cFFFFFFFF\n" ..
				"reset: " .. "|cFF00BEFFRemoves all current saved messages, restarting the filter.|cFFFFFFFF\n" ..
				"0 to 10000: " .. option3 .. "|cFF00BEFFSets the time gap value to this number of seconds."
			DEFAULT_CHAT_FRAME:AddMessage(helpMsg);
		end
	end
end

SLASH_SPTHRTL1 = "/spamthrottle";
SLASH_SPTHRTL2 = "/st";

--============================
--= CHAT_MSG_CHANNEL Filter Function
--============================
local function SpamThrottle_ChannelMsgFilter(self, event, message, author, ...)
	local BlockFlag = false;
	local Msg = "";

	Msg = SpamThrottle_strNorm(message, author);

	if (Msg == nil) then return end;

	if (SpamThrottleSettings.filterActive == false or author == UnitName("player")) then -- if the filter is disabled or the messsage is originating from us...
		return false, message, author, ...
	end
	
	if (message:upper():find("ANAL ") ~= nil) then BlockFlag = true; end
	if (message:upper():find(" ANAL") ~= nil) then BlockFlag = true; end
	if (message:upper():find("MY DICK ") ~= nil) then BlockFlag = true; end
	if (message:find("Blessed Blade of the Windseeker") ~= nil) then BlockFlag = true; end
	
	if (SpamThrottleSettings.blockChinese) then
		-- if (message:find("[\228-\233]" ~= nil) then BlockFlag = true; end;
		if (message:find("[\228-\233]") ~=nil) then BlockFlag = true; end
	end

	if (event == "CHAT_MSG_YELL") then
		if (MessageList[Msg] ~= nil) then	-- this should always be true, but worth checking to avoid an error
			if (MessageCount[Msg] > 1) then
				if (difftime(time(), MessageTime[Msg]) <= SpamThrottleSettings.gap) then
					BlockFlag = true;
				end
			end
		end
	else -- it is a channel message, handled differently than yell msgs
		if (MessageList[Msg] ~= nil) then	-- If we have seen this exact text before
			if (difftime(time(), MessageTime[Msg]) <= SpamThrottleSettings.gap) then
				BlockFlag = true;
			end
		end
	end

	if (BlockFlag) then
		if (SpamThrottleSettings.filterMode == 1) then		-- Mode 1 means color the message gray, but don't hide it altogether
			local cleantext = message:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
			return false, ("|cFF5C5C5C" .. cleantext .. "|r"), author, ...;
		else
			return true;	-- Mode 2, which is to hide the message entirely
		end
	end

	MessageTime[Msg] = time();
	return false, message, author, ...;
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", SpamThrottle_ChannelMsgFilter);	-- And finally add the filter function to "channels" (meaning channels /1 to /99, does not apply to guilds, raids, say, yell etc).
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", SpamThrottle_ChannelMsgFilter);	-- Add the filter function to "yell" (meaning /y)
