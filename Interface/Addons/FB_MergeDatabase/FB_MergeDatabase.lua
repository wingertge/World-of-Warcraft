-- add fishies to a "delta" database
-- if we figure out that it's not "our" data anymore, do a merge

local FL = LibStub("LibFishing-1.0");

-- 5.0.4 has a problem with a global "_" (see some for loops below)
local _

local FBAPI = LibStub("FishingBuddyApi-1.0");

-- Temporary, until we're pretty sure everyone has upgraded
local function RegisterHandlers(...)
	if (FBAPI) then
		return FBAPI:RegisterHandlers(...);
	else
		return FishingBuddy.API.RegisterHandlers(...);
	end
end

local function GetKey()
	if (FBAPI) then
		return FBAPI:GetKey();
	else
		return FishingBuddy.API.GetKey();
	end
end

local function CheckForeignKey(...)
	if (FBAPI) then
		return FBAPI:CheckForeignKey(...);
	else
		return FishingBuddy.API.CheckForeignKey(...);
	end
end

FB_MDConstants = {};

-- is this a new enough version of FB?
local mykey;

local function GetTimestamp()
   local weekday, month, day, year = CalendarGetDate();
   local hours,minutes = GetGameTime();
   return year.."."..month.."."..day..":"..hours..":"..minutes;
end

local function ResetMerger()
   if ( not FB_MergeDatabase ) then
      FB_MergeDatabase = {};
   end
   FB_MergeDatabase.key = mykey;
   FB_MergeDatabase.Timestamp = nil;
   FB_MergeDatabase["Fishies"] = {};
   FB_MergeDatabase["FishingHoles"] = {};
   FB_MergeDatabase["FishSchools"] = {};
end

local DoingMerge = false;
local MergeEvents = {};
MergeEvents["VARIABLES_LOADED"] = function()
   local zmto = FishingBuddy.ZoneMarkerTo;
   local zmex = FishingBuddy.ZoneMarkerEx;
   mykey = GetKey();
   if ( not mykey ) then return end;
   if ( not FB_MergeDatabase or not FB_MergeDatabase.key ) then
      ResetMerger();
   end
   if ( FB_MergeDatabase.locale and GetLocale() ~= FB_MergeDatabase.locale ) then
      return;
   end
   if ( mykey ~= FB_MergeDatabase.key ) then
      if ( CheckForeignKey(FB_MergeDatabase.key, FB_MergeDatabase.Timestamp)) then
         DoingMerge = true;
         local fishcount = 0;
         if ( FB_MergeDatabase["Fishies"] ) then
            for id,info in pairs(FB_MergeDatabase["Fishies"]) do
               if ( not FishingBuddy_Info["Fishies"][id] ) then
                  FishingBuddy_Info["Fishies"][id] = FL:copytable(info, 0);
                  fishcount = fishcount + 1;
               end
               if ( info.name and not FishingBuddy_Info["Fishies"][id].name ) then
                  FishingBuddy_Info["Fishies"][id].name = info.name;
               end
            end
            local sfh = FB_MergeDatabase["FishingHoles"];
            local dfh = FishingBuddy_Info["FishingHoles"];
            local dft = FishingBuddy_Info["FishTotals"];
            for zone,subzones in pairs(sfh) do
               for subzone,fishies in pairs(sfh[zone]) do
                  local sidm = FishingBuddy.AddZoneIndex(zone, subzone, true);
                  local zidx,_ = zmex(sidm);
                  local zidm = zmto(zidx,0);
                  for id,quantity in pairs(sfh[zone][subzone]) do
                     if ( not dfh[sidm] ) then
                        dfh[sidm] = {};
                     end
                     if ( not dfh[sidm][id] ) then
                        dfh[sidm][id] = quantity;
                     else
                        dfh[sidm][id] = dfh[sidm][id] + quantity;
                     end
                     if ( not dft[zidm] ) then
                        dft[zidm] = quantity;
                     else
                        dft[zidm] = dft[zidm] + quantity;
                     end
                     if ( not dft[sidm] ) then
                        dft[sidm] = quantity;
                     else
                        dft[sidm] = dft[sidm] + quantity;
                    end
                  end
               end
            end
         end

         if ( FB_MergeDatabase["FishSchools"] ) then
            local addschool = FishingBuddy.Schools.AddFishingSchool;
            for zone,info in pairs(FB_MergeDatabase["FishSchools"]) do
               local zidx = FishingBuddy.GetZoneIndex(zone);
               for _,entry in pairs(info) do
                  if ( entry.fish ) then
                     for i=1,table.getn(entry.fish) do
                        local fishid = entry.fish[i];
                        addschool(entry.kind, fishid, zidx, entry.x, entry.y);
                     end
                  end
               end
            end
         end

         if ( not FishingBuddy.ByFishie ) then
            local fh = FishingBuddy_Info["FishingHoles"];
            local ff = FishingBuddy_Info["Fishies"];
            FishingBuddy.ByFishie = { };
            FishingBuddy.SortedFishies = { };
            for idx,info in pairs(fh) do
               for id,quantity in pairs(info) do
                  if ( not FishingBuddy.ByFishie[id] ) then
                     FishingBuddy.ByFishie[id] = { };
                     tinsert(FishingBuddy.SortedFishies,
                             { text = ff[id].name, id = id });
                  end
                  if ( not FishingBuddy.ByFishie[id][idx] ) then
                     FishingBuddy.ByFishie[id][idx] = quantity;
                  else
                     FishingBuddy.ByFishie[id][idx] = FishingBuddy.ByFishie[id][idx] + quantity;
                  end
               end
            end
            FishingBuddy.FishSort(FishingBuddy.SortedFishies, true);
         end

         CheckForeignKey(FB_MergeDatabase.key, FB_MergeDatabase.Timestamp);
         
         FishingBuddy.Print(FB_MDConstants.IMPORTEDDATA);
      end
      ResetMerger();
      DoingMerge = false;
   end
end

MergeEvents[FBConstants.ADD_FISHIE_EVT] = function(id, name, zone, subzone, texture, quantity, quality, level, idx)
   if ( id and not DoingMerge ) then
      if ( not FB_MergeDatabase ) then
         ResetMerger();
      end
      if ( not FB_MergeDatabase.Timestamp ) then
         FB_MergeDatabase.Timestamp = GetTimestamp();
      end
      FB_MergeDatabase["Fishies"][id] = FL:copytable(FishingBuddy_Info["Fishies"][id], 0);

      local fh = FB_MergeDatabase["FishingHoles"];
      if ( not fh[zone] ) then
         fh[zone] = {};
      end
      if ( not fh[zone][subzone] ) then
         fh[zone][subzone] = {};
      end
      if ( not fh[zone][subzone][id] ) then
         fh[zone][subzone][id] = quantity;
      else
         fh[zone][subzone][id] = fh[zone][subzone][id] + quantity;
      end
   end
end

local CLOSEENOUGH = 0.000001;
local function distance(x1, y1, x2, y2)
   local x = (x1 - x2);
   local y = (y1 - y2);
   return sqrt( (x * x) + (y * y) );
end

MergeEvents[FBConstants.ADD_SCHOOL_EVT] = function(kind, fishid, zidx, sidx, x, y)
   if ( DoingMerge ) then
      return;
   end
   if ( not FB_MergeDatabase["FishSchools"] ) then
      FB_MergeDatabase["FishSchools"] = {};
   end
   if ( not FB_MergeDatabase["FishSchools"][zidx] ) then
      FB_MergeDatabase["FishSchools"][zidx] = {};
   else
      -- how do we find the same pool?
      for _,hole in pairs(FB_MergeDatabase["FishSchools"][zidx]) do
         local d = distance(hole.x or x or 0, hole.y or y or 0, x or 0, y or 0);
         if ( d < CLOSEENOUGH ) then
         	hole.sidx = hole.sidx or sidx;
            if ( fishid ) then
               if ( hole.fish ) then
                  for f,count in pairs(hole.fish) do
                     if ( f == fishid ) then
                        hole.fish[f] = count + 1;
                        return;
                     end
                  end
               else
                  hole.fish = {};
               end
               hole.fish[fishid] = 1;
            end
            if ( hole.count ) then
               hole.count = hole.count + 1;
            else
               hole.count = 1;
            end
            return;
         end
      end
   end
   local entry = {};
   entry.kind = kind;
   entry.x = x;
   entry.y = y;
   entry.sidx = sidx;
   entry.count = 1;
   if ( fishid ) then
      entry.fish = {};
      entry.fish[fishid] = 1;
   end
   tinsert(FB_MergeDatabase["FishSchools"][zidx], entry);
   return true;

end

local zmto = FishingBuddy.ZoneMarkerTo;
local zmex = FishingBuddy.ZoneMarkerEx;

local function CopyFishingHoles()
   local sorted = FishingBuddy.SortedZones;
   local line = 1;
   local zonecount = table.getn(sorted);
   
   FB_MergeDatabase["FishingHoles"] = {};

   local fbfh = FishingBuddy.FishingHoles or FishingBuddy_Info["FishingHoles"];
   local fh = FB_MergeDatabase["FishingHoles"];
   for i=1,zonecount,1 do
      local zone = sorted[i];
      local subsorted = FishingBuddy.SortedByZone[zone];
      if ( subsorted ) then
         local subcount = table.getn(subsorted);
         for s=1,subcount,1 do
            local subzone = subsorted[s];
            local where = FishingBuddy.GetZoneIndex(zone, subzone, true);
            local _, total = FishingBuddy.FishCount(where);
            if ( fbfh[where] and total > 0) then
               if ( not fh[zone] ) then
                  fh[zone] = {};
               end
               if ( not fh[zone][subzone] ) then
                  fh[zone][subzone] = {};
               end
               for fishid,count in pairs(fbfh[where]) do
                  fh[zone][subzone][fishid] = count;
               end
            end
         end
      end
   end
end

local function CopyFishSchools()
   FB_MergeDatabase["FishSchools"] = {};
   if ( FishingBuddy_Info["FishSchools"] ) then
      for zidx,holes in pairs(FishingBuddy_Info["FishSchools"]) do
         local zone = FishingBuddy_Info["ZoneIndex"][zidx];
         if ( zone ) then
             FB_MergeDatabase["FishSchools"][zone] = FL:copytable(holes, 0);
          else
             print("Could not find zone for %d", zidx);
          end
      end
   end
end

-- set up
RegisterHandlers(MergeEvents);

local FL = LibStub("LibFishing-1.0");
FL:Translate("FB_MergeDatabase", FB_MDTranslations, FB_MDConstants);
-- free up the space
FB_MDTranslations = nil;

FishingBuddy.Commands[FB_MDConstants.MERGE] = {};
FishingBuddy.Commands[FB_MDConstants.MERGE].help = FB_MDConstants.MERGE_HELP;
FishingBuddy.Commands[FB_MDConstants.MERGE].func =
   function(what)
      if ( what and what == FBConstants.FORCE ) then
         CopyFishingHoles();
         CopyFishSchools();
         FB_MergeDatabase["Fishies"] = FL:copytable(FishingBuddy_Info["Fishies"], 0);
         FB_MergeDatabase.Timestamp = GetTimestamp();
         local loc = GetLocale();
         if ( FishingBuddy_Info["Locales"][loc] ) then
            FB_MergeDatabase.locale = loc;
         end
         FishingBuddy.Print(FB_MDConstants.FORCEMERGE);
         return 1;
      end
   end;
