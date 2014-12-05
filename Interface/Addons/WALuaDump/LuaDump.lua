LuaDump = {}

function LuaDump.unitColor(unitId)
	local r, g, b = 0, 0, 0
    local isEnemy = UnitIsEnemy("player", unitId)
    local isPlayer = UnitIsPlayer(unitId)
    local isFriend = UnitIsFriend("player", unitId)
    local isTapped = UnitIsTapped(unitId)
    local isTappedBySelf = UnitIsTappedByPlayer(unitId)
    
    if(isEnemy) then
        r, g, b = 1, 0, 0
    elseif(isPlayer) then
        r, g, b = 0, 0, 1
    elseif(isFriend) then
        return  0, 1, 0, 1
    else
        r, g, b = 1, 1, 0
    end
    
    if(isTapped) then
        if(isTappedBySelf) then
            r, g, b = 0, 1, 1
        else
            r, g, b = 0.5, 0.5, 0.5
        end
    end
    
    return r, g, b
end

function LuaDump.abbreviateName(name, maxLength)
	maxLength = maxLength or 12

	local abbr = name
	if abbr:len() > maxLength and abbr:find(" ") then
		abbr = abbr:gsub("([^ ]+) +",
		function(text)
			return text:sub(1,1) .. ". "
		end)
	end
	return abbr;
end