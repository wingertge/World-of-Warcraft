--[[
## Title: PetFinder
## Version: 1.0.2
## Notes: Displays pets you have not learned upon entering zones
## Author: cas IV --thanks to Neutronic for some code I "borrowed"
]]--


PetFinder = {}
PetFinder.debugging = false
PetFinder.f = CreateFrame("Frame")
PetFinder.f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
PetFinder.f:RegisterEvent("PET_BATTLE_OVER")
PetFinder.f:RegisterEvent("PLAYER_ENTERING_WORLD")
PetFinder.f:RegisterEvent("PET_BATTLE_OPENING_DONE")
--PET_BATTLE_CLOSE

--PetFinder.waitTable = {};
--PetFinder.waitFrame = nil;
--[[function PetFinder.wait(delay, func, ...)
  if(type(delay)~="number" or type(func)~="function") then
    return false;
  end
  if(PetFinder.waitFrame == nil) then
    PetFinder.waitFrame = CreateFrame("Frame","PetFinder.waitFrame", UIParent);
    PetFinder.waitFrame:SetScript("onUpdate",function (self,elapse)
      local count = #PetFinder.waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(PetFinder.waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(PetFinder.waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(PetFinder.waitTable,{delay,func,{...}});
  return true;
end
]]--
function PetFinder.e(self, event, ...)
    parm = ...
    if event == "ADDON_LOADED" then 
        local x=parm
        PetFinder.dbug(x)
    end
    if event == "PLAYER_ENTERING_WORLD" then
        --PetFinder:DisplayMissingPets()
        --PetFinder.wait(20, PetFinder:DisplayMissingPets())
        PetFinder.f:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
    if event == "ZONE_CHANGED_NEW_AREA" then
        PetFinder:DisplayMissingPets()
    elseif event == "PET_BATTLE_OVER" then
        PetFinder:DisplayMissingPets()
    elseif (event == "ADDON_LOADED") and (parm == "PetFinder")then
        if IsAddOnLoaded("Blizzard_PetJournal") then 
            PetFinder:DisplayMissingPets()
            --PetFinder.f:UnregisterEvent("ADDON_LOADED")
        end
        PetFinder:InitializeAddon()
    elseif (event == "ADDON_LOADED") and (parm == "Blizzard_PetJournal")then
        if IsAddOnLoaded("PetFinder") then
            PetFinder.f:UnregisterEvent("ADDON_LOADED")
        end
    elseif (event == "PET_BATTLE_OPENING_DONE") and not (IsAddOnLoaded("BattlePetQualityNotifier"))then
        PetFinder.dbug("BattlePetQualityNotifier not loaded")
        PetFinder:ShowPetsInBattle()
    end
end
PetFinder.f:SetScript("OnEvent", PetFinder.e)
function PetFinder:InitializeAddon() --sets up defaults (in progress)
    if PetFinderDB == nil then PetFinderDB = {};end
        if PetFinderDB["options"] == nil then PetFinderDB["options"] = {};end
            if PetFinderDB["options"]["spamAllKnown"] == nil then PetFinderDB["options"]["spamAllKnown"] = true;end
            --if PetFinderDB["options"]["spamUpgrade"] == nil then PetFinderDB["options"]["spamUpgrade"] = nil;end
        if PetFinderDB["filters"] == nil then PetFinderDB["filters"] = {};end
            --need to save search filters to be reset after searches****************************
end
function PetFinder:ShowPetsInBattle()
    if C_PetBattles.IsWildBattle(2,i) then
        --PetFinder.print("|cFF5cb4f8 Battle Pet - Quality Notifier|r")
        PetFinder.RemoveFilters()
        for i=1,C_PetBattles.GetNumPets(2) do 
            local battleQuality = C_PetBattles.GetBreedQuality(2,i)
            local SpeciesId = C_PetBattles.GetPetSpeciesID(2,i)
            local Extra = " "
            local haveQuality = PetFinder:GetHighestQuality(SpeciesId)
            if haveQuality == -1 then
                Extra = "|cFFccff00 (Not Owned)|r"
            else
                if haveQuality < battleQuality then
                Extra = "|cFFff5a00 (Upgrade) |r"
                end
            end
            PetFinder.print("|cFFf9eb77 Wild Pet "..
            i..
            ":|r "..
            _G.ITEM_QUALITY_COLORS[battleQuality-1].hex..
            C_PetBattles.GetName(2,i)..
            "|r"..
            Extra)
				
				--[[print("|cFFf9eb77 Wild Pet "..
				i..
				":|r "..
				_G.ITEM_QUALITY_COLORS[Quality-1].hex..
				C_PetBattles.GetName(2,i)..
				"|r",
				Extra)]]-- 
        end
    end
end
    function PetFinder:DisplayMissingPets()
        --removes all pet filters before searching
        PetFinder.RemoveFilters()
        --vars
        local numPets = C_PetJournal.GetNumPets(PetJournal.isWild)
        zone = GetZoneText()
        local zone2 = ""
        local numInZone = 0
        local zoneLevel = PetFinder:ZoneLevelInfo(zone)
        --need to change zoneLevel depending on current zone
        if zone == "Kun-Lai Summit" then
            zone = "Summit" --bliz uses "Kun--Lai Summit" short version used incase bliz fixes
        elseif zone == "Valley of the Four Winds" then 
            zone = "Four Winds" --bliz uses "Valley of Four Winds" (no 'the') short version used incase bliz fixes
        elseif zone == "The Jade Forest" then 
            zone = "Jade Forest" --bliz uses "Jade Forest" (no 'the') short version used incase bliz fixes
        --elseif zone == "" then 
            
        --elseif zone == "" then 
            
        --elseif zone == "" then 
            
        else
            zone2 = zone
        end
        --gets info from each pet
        for i = 1, numPets do
            local petID, speciesID, owned,_,_,_,_,name,_,_,_,location,infotext = C_PetJournal.GetPetInfoByIndex(i, isWild)
            --PetFinder.print( C_PetJournal.GetPetInfoByIndex(i, isWild))
            if (string.find(location, zone2)) ~= nil then
                if not(owned) then
                    if numInZone == 0 then
                        PetFinder.print("PetFinder: Pets missing in "..zone..". "..zoneLevel) 
                    end
                    numInZone = numInZone +1
                    PetFinder.print("    |cffffffff"..name.."|cffff0000".."(not owned) "..PetFinder:PetCaptureInfo(speciesID))
                else   
                    if false then --PetFinder.debugging then
                        local MaxQuality, Qlv, Qcolor = PetFinder:GetHighestQuality(speciesID)
                        if MaxQuality <4 then
                           PetFinder.print("|c" .. Qcolor .. name.."|r ("..Qlv..")")
                        end
                    end
                end
            end
        end
        if numInZone == 0 then 
            PetFinder.print("PetFinder: All pets known in "..zone..".")
        end
        --reset search filters
        
    end

--display additional info to help capture
function PetFinder:PetCaptureInfo(speciesID)
    local returnvalue = ""
    
    
    return returnvalue
end
--display pet levels per zone
function PetFinder:ZoneLevelInfo(zone)
    local returnvalue = ""
    local zoneInt =-1
    if zone == "The Storm Peaks" then 
        zoneInt = 22
    elseif zone == "Uldum" then 
        zoneInt = 23
    elseif zone == "Tanaris" then 
        zoneInt = 13
    elseif zone == "" then 
        returnvalue = ""
    elseif zone == "" then 
        returnvalue = ""
    elseif zone == "" then 
        returnvalue = ""
    elseif zone == "" then 
        returnvalue = ""
    end
    if zoneInt <= 1 then
        returnvalue = "~lv "..zoneInt
    end
    return returnvalue
end
function PetFinder:GetHighestQuality(speciesID)
    PetFinder.RemoveFilters()
    local numPets = C_PetJournal.GetNumPets(PetJournal.isWild)
    local MaxQuality = -1
    local level = -1
    for j = 1,numPets do
        local pID, sId = C_PetJournal.GetPetInfoByIndex(j, isWild)
        if sId == speciesID then -- Pet exists in journal
            local _, _, _, _, Quality = C_PetJournal.GetPetStats(pID)
            if MaxQuality < Quality then
                MaxQuality = Quality
                --PetFinder.print(pID,sId)
            end
        end
    end
    local Qcolor = ""
    if  MaxQuality ==1 then
        Qcolor = "ff9d9d9d"
    elseif MaxQuality ==2 then
        Qcolor = "ffffffff"
    elseif MaxQuality ==3 then
        Qcolor = "ff1eff00"
    elseif MaxQuality ==4 then
        Qcolor = "ff0070dd"
    elseif MaxQuality ==5 then
        Qcolor = "ffa3355ee"
    elseif MaxQuality ==6 then
        Qcolor = "ffff8000"
    end
    --if MaxQuality <=0 then
        --return false, 0, "ffffffff"
    --else
        return MaxQuality, level, Qcolor
    --end
end
function PetFinder.RemoveFilters()
    --TODO:save search filters first*********************
    PetJournalSearchBox:SetText("")
    C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_COLLECTED, true)
    C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_FAVORITES, false)
    C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_NOT_COLLECTED, true)
    C_PetJournal.AddAllPetSourcesFilter()
    for  i=1, C_PetJournal.GetNumPetTypes() do
        C_PetJournal.SetPetTypeFilter(i, true)
    end
end
function PetFinder.print(msg)
    if msg == nil then
        DEFAULT_CHAT_FRAME:AddMessage("")
    elseif msg == "" then
        DEFAULT_CHAT_FRAME:AddMessage(msg)
    else
        DEFAULT_CHAT_FRAME:AddMessage(msg)
    end
end
function PetFinder.dbug(msg)
    if PetFinder.debugging then
        if msg == nil then
            DEFAULT_CHAT_FRAME:AddMessage("NIL value passed to .dbug")
        elseif msg == "" then
            DEFAULT_CHAT_FRAME:AddMessage(msg)
        else
            DEFAULT_CHAT_FRAME:AddMessage(msg,1)
        end
    end
end