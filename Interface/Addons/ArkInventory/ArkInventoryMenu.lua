﻿local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


function ArkInventory.MenuMainOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		
		ArkInventory.Lib.Dewdrop:Close( )
		
	else

		local loc_id = frame:GetParent( ):GetParent( ).ARK_Data.loc_id
		
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
		local anchorpoints = {
			[ArkInventory.Const.Anchor.TopRight] = ArkInventory.Localise["TOPRIGHT"],
			[ArkInventory.Const.Anchor.BottomRight] = ArkInventory.Localise["BOTTOMRIGHT"],
			[ArkInventory.Const.Anchor.BottomLeft] = ArkInventory.Localise["BOTTOMLEFT"],
			[ArkInventory.Const.Anchor.TopLeft] = ArkInventory.Localise["TOPLEFT"],
		}
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Const.Program.Name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)

					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CONFIG"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Config_Show( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", ArkInventory.Const.Actions[24].Texture,
						"text", ArkInventory.Localise["MENU_ACTION_REFRESH"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
						end
					)
					
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["RELOAD"],
						"tooltipTitle", ArkInventory.Localise["RELOAD"],
						"tooltipText", ArkInventory.Localise["MENU_ACTION_RELOAD_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.ItemCacheClear( )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", ArkInventory.Const.Actions[22].Texture,
						"text", ArkInventory.Localise["RESTACK"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Restack( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", ArkInventory.Const.Actions[13].Texture,
						"text", ArkInventory.Localise["SEARCH"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Search_Toggle( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", ArkInventory.Const.Actions[12].Texture,
						"text", ArkInventory.Localise["CONFIG_RULES"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Rules_Toggle( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_ACTION_EDITMODE"],
						"closeWhenClicked", true,
						"checked", ArkInventory.Global.Mode.Edit,
						"func", function( )
							ArkInventory.ToggleEditMode( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CONFIG_SETTINGS_ITEMS_HIDDEN"],
						"tooltipTitle", ArkInventory.Localise["CONFIG_SETTINGS_ITEMS_HIDDEN"],
						"tooltipText", ArkInventory.Localise["CONFIG_SETTINGS_ITEMS_HIDDEN_TEXT"],
						"checked", ArkInventory.LocationOptionGetReal( loc_id, "slot", "ignorehidden" ),
						"func", function( )
							ArkInventory.LocationOptionSetReal( loc_id, "slot", "ignorehidden", not ArkInventory.LocationOptionGetReal( loc_id, "slot", "ignorehidden" ) )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					if ( loc_id == ArkInventory.Const.Location.Mount ) or ( loc_id == ArkInventory.Const.Location.Pet ) then
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Global.Location[loc_id].Name,
							"hasArrow", true,
							"value", "INSERT_LOCATION_MENU"
						)
						
					end
					
				end
				
				
				if level == 2 and value then
				
			
				end
				
				
				if ( loc_id == ArkInventory.Const.Location.Mount ) then
					ArkInventory.MenuMounts( frame, level, value, 1 )
				end
				
				if ( loc_id == ArkInventory.Const.Location.Pet ) then
					ArkInventory.MenuPets( frame, level, value, 1 )
				end
				
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuBarOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then

		ArkInventory.Lib.Dewdrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bar_id = frame.ARK_Data.bar_id
		local bar_name = ArkInventory.LocationOptionGet( loc_id, "bar", "data", bar_id, "label" ) or ""
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		
		local sid_def = ArkInventory.LocationOptionGet( loc_id, "sort", "method" ) or 9999
		local sid = ArkInventory.LocationOptionGet( loc_id, "bar", "data", bar_id, "sortorder" ) or sid_def
		
		if not ArkInventory.db.global.option.sort.method.data[sid].used then
			--ArkInventory.OutputWarning( "bar ", bar_id, " in location ", loc_id, " is using an invalid sort method.  resetting it to default" )
			ArkInventory.LocationOptionSet( loc_id, "bar", "data", bar_id, "sortorder", nil )
			sid = sid_def
		end
		
		--ArkInventory.Output( "sid=[", sid, "] default=[", sid_def, "]" )
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		local category = {
			["type"] = { "SYSTEM", "CONSUMABLE", "TRADEGOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", "RULE", },
		}
		
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( ArkInventory.Localise["MENU_BAR_TITLE"], bar_id ),
						"isTitle", true,
						"textHeight", 12
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s%s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, bar_name, FONT_COLOR_CODE_CLOSE ),
						"tooltipTitle", ArkInventory.Localise["NAME"],
						"tooltipText", ArkInventory.Localise["CONFIG_SETTINGS_BARS_NAME_TEXT"],
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", bar_name,
						"editBoxFunc", function( v )
							bar_name = string.trim( v )
							ArkInventory.LocationOptionSet( loc_id, "bar", "data", bar_id, "label", bar_name )
							ArkInventory.Frame_Bar_Paint_All( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["SORT_METHOD"] ),
						"isTitle", true
					)
					
					if sid ~= sid_def then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["CURRENT"], GREEN_FONT_COLOR_CODE, ArkInventory.db.global.option.sort.method.data[sid].name, FONT_COLOR_CODE_CLOSE ),
							"hasArrow", true,
							"value", "SORT_METHOD"
						)
						
						--ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.db.global.option.sort.method.data[sid_def].name, FONT_COLOR_CODE_CLOSE ),
							"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEFAULT_RESET"],
							"tooltipText", ArkInventory.Localise["MENU_BAR_SORTKEY_DEFAULT_RESET_TEXT"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.LocationOptionSet( loc_id, "bar", "data", bar_id, "sortorder", nil )
								ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Resort )
							end
						)
						
					else
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.db.global.option.sort.method.data[sid_def].name, FONT_COLOR_CODE_CLOSE ),
							"hasArrow", true,
							"value", "SORT_METHOD"
						)
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["MENU_BAR_CATEGORY_CURRENT"] ),
						"isTitle", true
					)
					
					local has_entries = false
					for _, v in ipairs( category.type ) do
						if ArkInventory.CategoryBarHasEntries( loc_id, bar_id, v ) then
							has_entries = true
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise[string.format( "CATEGORY_%s", v )],
								"hasArrow", true,
								"value", string.format( "CATEGORY_CURRENT_%s", v )
							)
						end
					end
					
					for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
						if ArkInventory.db.profile.option.location[loc_id].bag[bag_id].bar == bar_id then
							has_entries = true
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["LOCATION_BAG"],
								"hasArrow", true,
								"value", "BAG_CURRENT"
							)
						end
					end
					
					if not has_entries then
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["NONE"],
							"disabled", true
						)
					end

					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["MENU_BAR_CATEGORY_ASSIGN"] ),
						"isTitle", true
					)
					for _, v in ipairs( category.type ) do
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise[string.format( "CATEGORY_%s", v )],
							"hasArrow", true,
							"value", string.format( "CATEGORY_ASSIGN_%s", v )
						)
					end
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LOCATION_BAG"],
						"hasArrow", true,
						"value", "BAG_ASSIGN"
					)
					
					if ArkInventory.Global.Options.CategoryMoveLocation == loc_id and ArkInventory.Global.Options.CategoryMoveSource ~= bar_id then
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						local cat = ArkInventory.Global.Category[ArkInventory.Global.Options.CategoryMoveCategory]
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipTitle", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_COMPLETE_TEXT"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), ArkInventory.Global.Options.CategoryMoveSource, bar_id ),
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
								ArkInventory.Global.Options.CategoryMoveLocation = nil
								ArkInventory.Global.Options.CategoryMoveSource = nil
								ArkInventory.Global.Options.CategoryMoveCategory = nil
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["MENU_BAR_OPTIONS"] ),
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLEAR"],
						"tooltipTitle", ArkInventory.Localise["CLEAR"],
						"tooltipText", ArkInventory.Localise["MENU_BAR_CLEAR_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Clear( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["INSERT"],
						"tooltipTitle", ArkInventory.Localise["INSERT"],
						"tooltipText", ArkInventory.Localise["MENU_BAR_INSERT_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Insert( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["REMOVE"],
						"tooltipTitle", ArkInventory.Localise["REMOVE"],
						"tooltipText", ArkInventory.Localise["MENU_BAR_REMOVE_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Remove( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MOVE"],
						"tooltipTitle", ArkInventory.Localise["MOVE"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_MOVE_START_TEXT"], bar_id ),
						"disabled", ArkInventory.Global.Options.BarMoveLocation == loc_id and ArkInventory.Global.Options.BarMoveSource == bar_id,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Global.Options.BarMoveLocation = loc_id
							ArkInventory.Global.Options.BarMoveSource = bar_id
						end
					)
					
					if ArkInventory.Global.Options.BarMoveLocation == loc_id and ArkInventory.Global.Options.BarMoveSource ~= bar_id then
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipTitle", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_MOVE_COMPLETE_TEXT"], ArkInventory.Global.Options.BarMoveSource ),
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.Frame_Bar_Move( loc_id, ArkInventory.Global.Options.BarMoveSource, bar_id )
								ArkInventory.Global.Options.BarMoveLocation = nil
								ArkInventory.Global.Options.BarMoveSource = nil
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
					
					if value == "SORT_METHOD" then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["SORT_METHOD"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						local x = ArkInventory.db.global.option.sort.method.data
						for k, v in ArkInventory.spairs( x, function(a,b) return x[a].name < x[b].name end ) do
							
							if v.used then
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", v.name,
									"tooltipTitle", ArkInventory.Localise["SORT_METHOD"],
									"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_SORTKEY_TEXT"], v.name ),
									"isRadio", true,
									"checked", k == sid,
									"disabled", k == sid,
									"closeWhenClicked", true,
									"func", function( )
										if k == sid_def then
											ArkInventory.LocationOptionSet( loc_id, "bar", "data", bar_id, "sortorder", nil )
										else
											ArkInventory.LocationOptionSet( loc_id, "bar", "data", bar_id, "sortorder", k )
										end
										ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Resort )
									end
								)
							end
							
						end
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["CONFIG"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.Frame_Config_Show( "sorting" )
							end
						)
					
					end
					
					
					if strsub( value, 1, 17 ) == "CATEGORY_CURRENT_" then

						local cat_type = string.match( value, "^CATEGORY_CURRENT_(.+)" )
						
						if cat_type ~= nil then
					
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise[string.format( "CATEGORY_%s", cat_type )],
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.Dewdrop:AddLine( )
							local has_entries = false
							for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do

								local t = cat.type_code
								local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
								
								if abs( cat_bar ) == bar_id and not def_bar then
							
									if t == "RULE" then
										local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
										if not ArkInventory.db.profile.option.rule[cat_code] then
											t = "DO_NOT_USE" -- don't display disabled rules
										end
									end
						
									if cat_type == t then
		
										local tag_colour = GREEN_FONT_COLOR_CODE
										if cat_bar < 0 then
											tag_colour = RED_FONT_COLOR_CODE
										end
		
										has_entries = true
										ArkInventory.Lib.Dewdrop:AddLine(
											"text", string.format( "%s%s", tag_colour, cat.name ),
											"tooltipTitle", cat.fullname,
											"hasArrow", true,
											"value", string.format( "CATEGORY_CURRENT_OPTION_%s", cat.id )
										)
										
									end
						
								end
	
							end
							
							if not has_entries then
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", ArkInventory.Localise["NONE"],
									"disabled", true
								)
							end
							
						end

					end

					
					if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
						local cat_type = string.match( value, "^CATEGORY_ASSIGN_(.+)" )
				
						if cat_type ~= nil then
					
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise[string.format( "CATEGORY_%s", cat_type )],
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.Dewdrop:AddLine( )
							for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do

								local t = cat.type_code
								local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
							
								if abs( cat_bar ) == bar_id and not def_bar then
									t = "DO_NOT_USE" -- change the category so it doesn't display
								end

								if t == "RULE" then
									local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
									if not ArkInventory.db.profile.option.rule[cat_code] then
										t = "DO_NOT_USE" -- don't display disabled rules
									end
								end
								
								if cat_type == t then
	
									--local n = string.format( "[%s] %s", cat.id, cat.name )
									local n = cat.name
	
									if not def_bar then
										-- category is assigned to a bar - show the user where
										n = string.format( "%s%s%s [%s]%s", LIGHTYELLOW_FONT_COLOR_CODE, n, GREEN_FONT_COLOR_CODE, cat_bar, FONT_COLOR_CODE_CLOSE )
									end
	
									ArkInventory.Lib.Dewdrop:AddLine(
										"text", n,
										"tooltipTitle", ArkInventory.Localise["CATEGORY"],
										"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_TEXT"], cat.fullname ),
										"func", function( )
											ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									)
									
								end
	
							end
							
						end
						
					end

					
					if value == "BAG_CURRENT" then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["LOCATION_BAG"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
							
							local cat_bar = ArkInventory.db.profile.option.location[loc_id].bag[bag_id].bar
							
							if bar_id == cat_bar then
								
								local n = string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, bag_id, FONT_COLOR_CODE_CLOSE )
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", n,
									"tooltipTitle", string.format( "%s > %s", ArkInventory.Localise["LOCATION_BAG"], bag_id ),
									"hasArrow", true,
									"value", string.format( "BAG_CURRENT_OPTION_%s", bag_id )
								)
								
							end
							
						end
						
					end
					
					
					if value == "BAG_ASSIGN" then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["LOCATION_BAG"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
							
							local cat_bar = ArkInventory.db.profile.option.location[loc_id].bag[bag_id].bar
							
							if bar_id ~= cat_bar then
								
								local n = string.format( "%s", bag_id )
								
								if cat_bar then
									n = string.format( "%s%s%s [%s]%s", LIGHTYELLOW_FONT_COLOR_CODE, n, GREEN_FONT_COLOR_CODE, cat_bar, FONT_COLOR_CODE_CLOSE )
								end
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", n,
									"tooltipTitle", ArkInventory.Localise["LOCATION_BAG"],
									"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_BAG_ASSIGN_TEXT"], bag_id ),
									"func", function( )
										ArkInventory.db.profile.option.location[loc_id].bag[bag_id].bar = bar_id
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								)
								
							end
							
						end
						
					end
					
				end

				
				if level == 3 and value then
				
					if strsub( value, 1, 24 ) == "CATEGORY_CURRENT_OPTION_" then
					
						local cat_id = string.match( value, "^CATEGORY_CURRENT_OPTION_(.+)" )
				
						if cat_id ~= nil then
					
							local cat = ArkInventory.Global.Category[cat_id]
						
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", cat.fullname,
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.Dewdrop:AddLine( )
							
							local cv = ArkInventory.CategoryLocationGet( loc_id, cat_id )
							local ch = false
							
							if cv < 0 then
								ch = true
								cv = abs( cv )
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["MOVE"],
								"tooltipTitle", ArkInventory.Localise["MOVE"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_START_TEXT"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ) ),
								"disabled", ArkInventory.Global.Options.CategoryMoveLocation == loc_id and ArkInventory.Global.Options.CategoryMoveSource ==  bar_id,
								"closeWhenClicked", true,
								"func", function( )
									ArkInventory.Global.Options.CategoryMoveLocation = loc_id
									ArkInventory.Global.Options.CategoryMoveSource = bar_id
									ArkInventory.Global.Options.CategoryMoveCategory = cat.id
								end
							)
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["REMOVE"],
								"tooltipTitle", ArkInventory.Localise["REMOVE"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_REMOVE_TEXT"], cat.fullname, bar_id ),
								"func", function( )
									ArkInventory.CategoryLocationSet( loc_id, cat_id, nil )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)

							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["HIDE"],
								"tooltipTitle", ArkInventory.Localise["HIDE"],
								"tooltipText", ArkInventory.Localise["MENU_BAR_CATEGORY_HIDDEN_TEXT"],
								"checked", ArkInventory.CategoryHiddenCheck( loc_id, cat_id ),
								"func", function( )
									ArkInventory.CategoryHiddenToggle( loc_id, cat_id )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
					
						end
						
					end

					if strsub( value, 1, 19 ) == "BAG_CURRENT_OPTION_" then
					
						local bag_id = tonumber( string.match( value, "^BAG_CURRENT_OPTION_(.+)" ) )
						
						if bag_id ~= nil then
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", string.format( "%s > %s", ArkInventory.Localise["LOCATION_BAG"], bag_id ),
								"isTitle", true,
								"textHeight", 12
							)
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							local cv = ArkInventory.db.profile.option.location[loc_id].bag[bag_id].bar
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["REMOVE"],
								"tooltipTitle", ArkInventory.Localise["REMOVE"],
--								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_REMOVE_TEXT"], cat.fullname, bar_id ),
								"func", function( )
									ArkInventory.db.profile.option.location[loc_id].bag[bag_id].bar = nil
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
							
						end
						
					end
					
				end
				
			end
			
		)
		
	end
	
end

function ArkInventory.MenuItemOpen( frame )

	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Global.Mode.Edit == false then
		return
	end
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local blizzard_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
		local slot_id = frame.ARK_Data.slot_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local i = ArkInventory.Frame_Item_GetDB( frame )
		
		local isEmpty = false
		if not i or i.h == nil then
			isEmpty = true
		end
	
	
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
		
		local ic = select( 5, ArkInventory.GetItemQualityColor( i.q ) )
		local cat0, cat1, cat2 = ArkInventory.ItemCategoryGet( i )
		local bar_id = abs( ArkInventory.CategoryLocationGet( loc_id, cat0 ) )
		
		local categories = { "SYSTEM", "CONSUMABLE", "TRADEGOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", }
		
		cat0 = ArkInventory.Global.Category[cat0] or cat0
		if type( cat0 ) ~= "table" then
			cat0 = { id = cat0, fullname = string.format( ArkInventory.Localise["CONFIG_CATEGORY_DELETED"], cat0 ) }
		end
		
		if cat1 then
			cat1 = ArkInventory.Global.Category[cat1] or cat1
			if type( cat1 ) ~= "table" then
				cat1 = { id = cat1, fullname = string.format( ArkInventory.Localise["CONFIG_CATEGORY_DELETED"], cat1 ) }
			end
		end
		
		cat2 = ArkInventory.Global.Category[cat2] or cat2
		if type( cat2 ) ~= "table" then
			cat2 = { id = cat2, fullname = string.format( ArkInventory.Localise["CONFIG_CATEGORY_DELETED"], cat2 ) }
		end
		
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then

					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["MENU_ITEM_TITLE"] ),
						"isTitle", true,
						"textHeight", 12
					)
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						-- ic
						"text", string.format( "%s: %s%s%s", ArkInventory.Localise["MENU_ITEM_ITEM"], ic, select( 3, ArkInventory.ObjectInfo( i.h ) ) or "", FONT_COLOR_CODE_CLOSE )
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					if cat1 then
					
						-- item has a category, that means it's been specifically assigned away from the default
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["CURRENT"], GREEN_FONT_COLOR_CODE, cat1.fullname, FONT_COLOR_CODE_CLOSE ),
							"notClickable", true
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, cat2.fullname, FONT_COLOR_CODE_CLOSE ),
							"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEFAULT_RESET"],
							"tooltipText", ArkInventory.Localise["MENU_ITEM_DEFAULT_RESET_TEXT"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.ItemCategorySet( i, nil )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					
					else
					
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, cat2.fullname, FONT_COLOR_CODE_CLOSE ),
							"notClickable", true
						)
					
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["MENU_ITEM_ASSIGN_CHOICES"] ),
						"isTitle", true
					)
					for _, v in ipairs( categories ) do
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise[string.format( "CATEGORY_%s", v )],
							"disabled", isEmpty,
							"hasArrow", true,
							"tooltipTitle", ArkInventory.Localise["MENU_ITEM_ASSIGN_THIS"],
							"tooltipText", ArkInventory.Localise["MENU_ITEM_ASSIGN_THIS_TEXT"],
							"value", string.format( "CATEGORY_ASSIGN_%s", v )
						)
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MOVE"],
						"tooltipTitle", ArkInventory.Localise["MOVE"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_START_TEXT"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat0.fullname, FONT_COLOR_CODE_CLOSE ) ),
						"disabled", ArkInventory.Global.Options.CategoryMoveLocation == loc_id and ArkInventory.Global.Options.CategoryMoveSource ==  bar_id,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Global.Options.CategoryMoveLocation = loc_id
							ArkInventory.Global.Options.CategoryMoveSource = bar_id
							ArkInventory.Global.Options.CategoryMoveCategory = cat0.id
						end
					)
					
					if ArkInventory.Global.Options.CategoryMoveLocation == loc_id and ArkInventory.Global.Options.CategoryMoveSource ~= bar_id then
						
						local cat = ArkInventory.Global.Category[ArkInventory.Global.Options.CategoryMoveCategory]
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipTitle", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_COMPLETE_TEXT"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), ArkInventory.Global.Options.CategoryMoveSource, bar_id ),
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
								ArkInventory.Global.Options.CategoryMoveLocation = nil
								ArkInventory.Global.Options.CategoryMoveSource = nil
								ArkInventory.Global.Options.CategoryMoveCategory = nil
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_ITEM_DEBUG"],
						"hasArrow", true,
						"value", "DEBUG_INFO"
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
				
					if value == "DEBUG_INFO" then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MENU_ITEM_DEBUG"],
							"isTitle", true,
							"textHeight", 12
						)
						
						local class, id = ArkInventory.ObjectStringDecode( i.h )
						local bagtype = ArkInventory.Const.Slot.Data[ArkInventory.BagType( blizzard_id )].type
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["LOCATION"], LIGHTYELLOW_FONT_COLOR_CODE, loc_id, ArkInventory.Global.Location[loc_id].Name ) )
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_BAG"], LIGHTYELLOW_FONT_COLOR_CODE, bag_id, blizzard_id ) )
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_SLOT"], LIGHTYELLOW_FONT_COLOR_CODE, slot_id, bagtype ) )
						--ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s", "sort key", ArkInventory.ItemSortKeyGenerate( i, bar_id ) ) )
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["CATEGORY_CLASS"], LIGHTYELLOW_FONT_COLOR_CODE, class ) )
						
						if i.h then
							
							local class, ilnk, inam, itxt, irar, ilvl, imin, ityp, isub, icount, iloc = ArkInventory.ObjectInfo( i.h )
							
							iloc = _G[iloc]
							if not iloc then
								iloc = ""
							end

							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, inam ) )
							
							if ( class == "item" ) then
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ITEM_ACCOUNTBOUND, LIGHTYELLOW_FONT_COLOR_CODE, ( i.ab and YES ) or NO ) )
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ITEM_SOULBOUND, LIGHTYELLOW_FONT_COLOR_CODE, ( i.sb and YES ) or NO ) )
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", QUALITY, LIGHTYELLOW_FONT_COLOR_CODE, irar, _G[string.format( "ITEM_QUALITY%s_DESC", irar )] ) )
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_ITEM"], LIGHTYELLOW_FONT_COLOR_CODE, ilvl ) )
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_USE"], LIGHTYELLOW_FONT_COLOR_CODE, imin ) )
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, ityp ),
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", ityp
								)
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_SUBTYPE"], LIGHTYELLOW_FONT_COLOR_CODE, isub ),
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", isub
								)
								
								if iloc ~= "" then
									ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_EQUIP"], LIGHTYELLOW_FONT_COLOR_CODE, iloc ) )
								end
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", AUCTION_STACK_SIZE, LIGHTYELLOW_FONT_COLOR_CODE, icount ) )
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, itxt ) )
								
								local ifam = GetItemFamily( i.h )
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_FAMILY"], LIGHTYELLOW_FONT_COLOR_CODE, ifam ) )
							
							elseif ( class == "battlepet" ) then
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", QUALITY, LIGHTYELLOW_FONT_COLOR_CODE, i.q, _G[string.format( "ITEM_QUALITY%s_DESC", i.q )] ) )
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_ITEM"], LIGHTYELLOW_FONT_COLOR_CODE, ilvl ) )
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, ityp, ArkInventory.PetJournal.PetTypeName( ityp ) or ArkInventory.Localise["UNKNOWN"] ) )
								
								if i.guid then
									
									ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_PET_ID"], LIGHTYELLOW_FONT_COLOR_CODE, i.guid ) )
									
									local pd = ArkInventory.PetJournal.GetPet( i.guid )
									if pd then
										ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_PET_SPECIES"], LIGHTYELLOW_FONT_COLOR_CODE, pd.sd.speciesID ) )
										ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", "IsRevoked", LIGHTYELLOW_FONT_COLOR_CODE, pd.IsRevoked and "true" or "false" ) )
										ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", "isLockedForConvert", LIGHTYELLOW_FONT_COLOR_CODE, pd.isLockedForConvert and "true" or "false" ) )
									end
									
								end
								
							elseif ( class == "spell" ) then
							
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, string.lower( i.type ) ) )
								
								ArkInventory.Lib.Dewdrop:AddLine( )
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, itxt ) )
								
							end
							
						end
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_SHORT"], LIGHTYELLOW_FONT_COLOR_CODE, id ),
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", id
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["CATEGORY"], LIGHTYELLOW_FONT_COLOR_CODE, cat0.id ) )
						
						local cid = ArkInventory.ObjectIDCacheCategory( i.loc_id, i.bag_id, i.sb, i.h )
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s (%s): %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_CACHE"], ArkInventory.Localise["CATEGORY"], LIGHTYELLOW_FONT_COLOR_CODE, cid ) )
						
						cid = ArkInventory.ObjectIDCacheRule( i.loc_id, i.bag_id, i.sb, i.h )
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s (%s): %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_CACHE"], ArkInventory.Localise["RULE"], LIGHTYELLOW_FONT_COLOR_CODE, cid ) )
						
						
						if i.h then
							
							if class == "item" then
								local rid = ArkInventory.ObjectIDInternal( i.h )
								rid = string.match( rid, "^.-%:(.+)" )
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_RULE"], LIGHTYELLOW_FONT_COLOR_CODE, rid ),
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", rid
								)
							end
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["MENU_ITEM_DEBUG_PT"],
								"hasArrow", true,
								"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEBUG_PT"],
								"tooltipText", ArkInventory.Localise["MENU_ITEM_DEBUG_PT_TEXT"],
								"value", "DEBUG_INFO_PT"
							)
							
						end
						
					end
					
					if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
						local k = string.match( value, "CATEGORY_ASSIGN_(.+)" )
					
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise[string.format( "CATEGORY_%s", k )],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
					
						for _, v in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do
					
							local t = v.type_code
							if v.id == cat0.id then
								t = "DO_NOT_USE"
							end
							
							--ArkInventory.Output( "id=", cat.id, ", type=[", cat.type, "], value=[", value, "]" )
							if k == t then
								--~~~~
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", v.name,
									"tooltipTitle", "Assign to Category",
									"tooltipText", string.format( "assign this item to %s", v.fullname ), --~~~~ check this
									"closeWhenClicked", true,
									"func", function( )
										ArkInventory.ItemCategorySet( i, v.id )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								)
							
							end
							
						end
						
						if k == "CUSTOM" then
						
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["MENU_ITEM_CUSTOM_NEW"],
								"closeWhenClicked", true,
								"func", function( )
									ArkInventory.Frame_Config_Show( "categories", "custom" )
								end
							)
							
						end
						
					end
					
				end
				
				
				if level == 3 and value then
					
					if value == "DEBUG_INFO_PT" then
					
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: ", ArkInventory.Localise["MENU_ITEM_DEBUG_PT_TITLE"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						--local pt_set = ArkInventory.Lib.PeriodicTable:ItemSearch( i.h )
						local pt_set = ArkInventory.PTItemSearch( i.h )
						
						if not pt_set then
						
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise["MENU_ITEM_DEBUG_PT_NONE"] ) )
						
						else
						
							for k, v in pairs( pt_set ) do
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", v,
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", v
								)
							end
							
						end
						
					end
				
				end
				
			end
			
		)
		
	end
	
end


function ArkInventory.MenuBagOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local blizzard_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local player_id = cp.info.player_id
		
		local i = ArkInventory.Frame_Item_GetDB( frame )
		
		local isEmpty = false
		if not i or i.h == nil then
			isEmpty = true
		end

		local bag = cp.location[loc_id].bag[bag_id]
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "BOTTOMRIGHT" -- TOPRIGHT
			rp = "TOPLEFT" -- BOTTOMLEFT
		else
			p = "BOTTOMLEFT" -- TOPLEFT
			rp = "TOPRIGHT" -- BOTTOMRIGHT
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["OPTIONS"],
						"isTitle", true,
						"icon", ArkInventory.Const.Actions[11].Texture,
						"textHeight", 12
					)
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAG_SHOW"],
						"tooltipTitle", ArkInventory.Localise["MENU_BAG_SHOW"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_SHOW_TEXT"],
						"checked", ArkInventory.db.global.player.data[player_id].bagoptions[loc_id][bag_id].display,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.db.global.player.data[player_id].bagoptions[loc_id][bag_id].display = not ArkInventory.db.global.player.data[player_id].bagoptions[loc_id][bag_id].display
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAG_ISOLATE"],
						"tooltipTitle", ArkInventory.Localise["MENU_BAG_ISOLATE"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_ISOLATE_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
								if x == bag_id then
									ArkInventory.db.global.player.data[player_id].bagoptions[loc_id][x].display = true
								else
									ArkInventory.db.global.player.data[player_id].bagoptions[loc_id][x].display = false
								end
							end
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAG_SHOWALL"],
						"tooltipTitle", ArkInventory.Localise["MENU_BAG_SHOWALL"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_SHOWALL_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
								ArkInventory.db.global.player.data[player_id].bagoptions[loc_id][x].display = true
							end
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					if not isEmpty then
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MENU_BAG_EMPTY"],
							"tooltipTitle", ArkInventory.Localise["MENU_BAG_EMPTY"],
							"tooltipText", ArkInventory.Localise["MENU_BAG_EMPTY_TEXT"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.EmptyBag( loc_id, bag_id )
							end
						)
						
					end
					
					
					if not ArkInventory.Global.Mode.Edit and loc_id == ArkInventory.Const.Location.Bank and bag.status == ArkInventory.Const.Bag.Status.Purchase then
						
						if bag_id == ArkInventory.Global.Location[loc_id].tabReagent then
							
							local cost = GetReagentBankCost( )
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", BANKSLOTPURCHASE,
								"tooltipTitle", ArkInventory.Localise["REAGENTBANK"],
								"tooltipText", string.format( "%s\n\n%s %s", REAGENTBANK_PURCHASE_TEXT, COSTS_LABEL, ArkInventory.MoneyText( cost, true ) ),
								"closeWhenClicked", true,
								"func", function( )
									PlaySound( "igMainMenuOption" )
									StaticPopup_Show( "CONFIRM_BUY_REAGENTBANK_TAB" )
								end
							)
							
						else
							
							local numSlots = GetNumBankSlots( )
							local cost = GetBankSlotCost( numSlots )
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", BANKSLOTPURCHASE,
								"tooltipTitle", BANK_BAG,
								"tooltipText", string.format( "%s\n\n%s %s", BANKSLOTPURCHASE_LABEL, COSTS_LABEL, ArkInventory.MoneyText( cost, true ) ),
								"closeWhenClicked", true,
								"func", function( )
									PlaySound( "igMainMenuOption" )
									StaticPopup_Show( "CONFIRM_BUY_BANK_SLOT" )
								end
							)
							
						end
						
					elseif not ArkInventory.Global.Mode.Edit and loc_id == ArkInventory.Const.Location.Bank and bag_id == ArkInventory.Global.Location[loc_id].tabReagent then
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", REAGENTBANK_DEPOSIT,
							"tooltipTitle", REAGENTBANK_DEPOSIT,
							"closeWhenClicked", true,
							"func", function( )
								PlaySound( "igMainMenuOption" )
								DepositReagentBank( )
							end
						)
						
					end
					
					if ArkInventory.Global.Mode.Edit and not isEmpty then
					
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MENU_ITEM_DEBUG"],
							"hasArrow", true,
							"value", "DEBUG_INFO"
						)
						
					end
					
					
					if loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank then
						
						if blizzard_id > 0 then
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", BAG_FILTER_ASSIGN_TO,
								"isTitle", true,
								"textHeight", 12
							)
							
							for i = LE_BAG_FILTER_FLAG_EQUIPMENT, NUM_LE_BAG_FILTER_FLAGS do
								
								if ( i ~= LE_BAG_FILTER_FLAG_JUNK ) then
									
									local checked = false
									
									if loc_id == ArkInventory.Const.Location.Bag then
										
										checked = GetBagSlotFlag( blizzard_id, i )
										
									elseif loc_id == ArkInventory.Const.Location.Bank then
										
										if bag_id == 1 then
											checked = GetBankBagSlotFlag( blizzard_id - NUM_BAG_SLOTS, i )
										else
											checked = GetBagSlotFlag( blizzard_id, i )
										end
										
									end
									
									
									ArkInventory.Lib.Dewdrop:AddLine(
										"text", BAG_FILTER_LABELS[i],
										"tooltipTitle", BAG_FILTER_ASSIGN_TO,
										"tooltipText", BAG_FILTER_LABELS[i],
										"checked", checked,
										"closeWhenClicked", true,
										"func", function( )
											
											if loc_id == ArkInventory.Const.Location.Bag then
												
												SetBagSlotFlag( blizzard_id, i, not checked )
												
											elseif loc_id == ArkInventory.Const.Location.Bank then
												
												if bag_id == 1 then
													SetBankBagSlotFlag( blizzard_id - NUM_BAG_SLOTS, i, not checked )
												else
													SetBagSlotFlag( blizzard_id, i, not checked )
												end
												
											end
											
										end
									)
							
								end
								
							end
						
						end
						
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["RESTACK"],
							"isTitle", true,
							"icon", ArkInventory.Const.Actions[22].Texture,
							"textHeight", 12
						)
						
						
						local checked = false
						
						if loc_id == ArkInventory.Const.Location.Bag then
							
							if bag_id == 1 then
								checked = GetBackpackAutosortDisabled( )
							else
								checked = GetBagSlotFlag( blizzard_id, LE_BAG_FILTER_FLAG_IGNORE_CLEANUP )
							end
							
						elseif loc_id == ArkInventory.Const.Location.Bank then
							
							if bag_id == 1 then
								checked = GetBankAutosortDisabled( )
							elseif bag_id == ArkInventory.Global.Location[loc_id].tabReagent then
								checked = ArkInventory.Global.Me.bagoptions[loc_id][bag_id].cleanup.ignore
							else
								checked = GetBankBagSlotFlag( blizzard_id - NUM_BAG_SLOTS, LE_BAG_FILTER_FLAG_IGNORE_CLEANUP )
							end
							
						end
						
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", BAG_FILTER_IGNORE,
							"tooltipTitle", ArkInventory.Localise["RESTACK"],
							"tooltipText", BAG_FILTER_IGNORE,
							"checked", checked,
							"closeWhenClicked", true,
							"func", function( )
								
								if loc_id == ArkInventory.Const.Location.Bag then
									
									if bag_id == 1 then
										SetBackpackAutosortDisabled( not checked )
									else
										SetBagSlotFlag( blizzard_id, LE_BAG_FILTER_FLAG_IGNORE_CLEANUP, not checked )
									end
									
								elseif loc_id == ArkInventory.Const.Location.Bank then
									
									if bag_id == 1 then
										SetBankAutosortDisabled( not checked )
									elseif bag_id == ArkInventory.Global.Location[loc_id].tabReagent then
										ArkInventory.Global.Me.bagoptions[loc_id][bag_id].cleanup.ignore = not checked
									else
										SetBankBagSlotFlag( blizzard_id - NUM_BAG_SLOTS, LE_BAG_FILTER_FLAG_IGNORE_CLEANUP, not checked )
									end
									
								end
								
							end
						)
						
						if loc_id == ArkInventory.Const.Location.Bank and bag_id == ArkInventory.Global.Location[loc_id].tabReagent then
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", REAGENTBANK_DEPOSIT,
								"checked", ArkInventory.Global.Me.bagoptions[loc_id][bag_id].cleanup.deposit,
								"closeWhenClicked", true,
								"func", function( )
									ArkInventory.Global.Me.bagoptions[loc_id][bag_id].cleanup.deposit = not ArkInventory.Global.Me.bagoptions[loc_id][bag_id].cleanup.deposit
								end
							)
						
						end
						
						if loc_id == ArkInventory.Const.Location.Bag then
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", REVERSE_CLEAN_UP_BAGS_TEXT,
								"tooltipTitle", REVERSE_CLEAN_UP_BAGS_TEXT,
								"tooltipText", OPTION_TOOLTIP_REVERSE_CLEAN_UP_BAGS,
								"checked", GetSortBagsRightToLeft( ),
								"closeWhenClicked", true,
								"func", function( )
									SetSortBagsRightToLeft( not GetSortBagsRightToLeft( ) )
								end
							)
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", REVERSE_NEW_LOOT_TEXT,
								"tooltipTitle", REVERSE_NEW_LOOT_TEXT,
								"tooltipText", OPTION_TOOLTIP_REVERSE_NEW_LOOT,
								"checked", GetInsertItemsLeftToRight( ),
								"closeWhenClicked", true,
								"func", function( value )
									SetInsertItemsLeftToRight( not GetInsertItemsLeftToRight( ) )
								end
							)
							
						end
						
					end
					
				end
				
				if level == 2 and value then
					
					if value == "DEBUG_INFO" then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MENU_ITEM_DEBUG"],
							"isTitle", true,
							"textHeight", 12
						)
							
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						local class, ilnk, inam, itxt, irar, ilvl, imin, ityp, isub, icount, iloc = ArkInventory.ObjectInfo( i.h )
						local _, id = ArkInventory.ObjectStringDecode( i.h )
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, inam ) )
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["LOCATION"], LIGHTYELLOW_FONT_COLOR_CODE, loc_id, ArkInventory.Global.Location[loc_id].Name ) )
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["CATEGORY_CLASS"], LIGHTYELLOW_FONT_COLOR_CODE, class ) )

						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", QUALITY, LIGHTYELLOW_FONT_COLOR_CODE, irar, _G[string.format( "ITEM_QUALITY%s_DESC", irar )] ) )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_SHORT"], LIGHTYELLOW_FONT_COLOR_CODE, id ),
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", id
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, ityp ),
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", ityp
						)
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_SUBTYPE"], LIGHTYELLOW_FONT_COLOR_CODE, isub ),
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", isub
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, itxt ) )
						
					end

				end

			end
			
		)
		
	end
	
end

function ArkInventory.MenuChangerVaultTabOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local bag = cp.location[loc_id].bag[bag_id]
		local button = _G[string.format( "%s%s%sWindowBag%s", ArkInventory.Const.Frame.Main.Name, loc_id, ArkInventory.Const.Frame.Changer.Name, bag_id )]

		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", ArkInventory.Localise["GUILDBANK"], string.format( GUILDBANK_TAB_NUMBER, bag_id ) ),
						"isTitle", true,
						"icon", bag.texture,
						"textHeight", 12
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", bag.name,
						"isTitle", true,
						"textHeight", 12
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					if not ArkInventory.Global.Location[loc_id].isOffline then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", "request tab data",
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.ScanVault( )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "mode: %s", ArkInventory.Localise["GUILDBANK"] ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "bank",
						"func", function( )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "bank" )
							GuildBankFrameTab_OnClick( bag_id, 1 )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					if not ArkInventory.Global.Location[loc_id].isOffline then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "mode: %s", GUILD_BANK_LOG ),
							"closeWhenClicked", true,
							"disabled", GuildBankFrame.mode == "log",
							"func", function( )
								ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
								--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "log" )
								GuildBankFrameTab_OnClick( bag_id, 2 )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "mode: %s", GUILD_BANK_MONEY_LOG ),
							"closeWhenClicked", true,
							"disabled", GuildBankFrame.mode == "moneylog",
							"func", function( )
								ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
								--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "moneylog" )
								GuildBankFrameTab_OnClick( bag_id, 3 )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "mode: %s", GUILD_BANK_TAB_INFO ),
							"closeWhenClicked", true,
							"disabled", GuildBankFrame.mode == "tabinfo",
							"func", function( )
								ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
								--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "tabinfo" )
								GuildBankFrameTab_OnClick( bag_id, 4 )
							end
						)
						
						if IsGuildLeader( ) then
						
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", "change name or icon",
								"closeWhenClicked", true,
								"func", function( )
									SetCurrentGuildBankTab( bag_id )
									GuildBankPopupFrame:Show( )
									GuildBankPopupFrame_Update( bag_id )
								end
							)
							
						end
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
			
			end
			
		)
		
	end
	
end

function ArkInventory.MenuChangerVaultActionOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		
		ArkInventory.Lib.Dewdrop:Close( )
		
	else
		
		local loc_id = ArkInventory.Const.Location.Vault
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local bag_id = GetCurrentGuildBankTab( )
		local bag = cp.location[loc_id].bag[bag_id]
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				local ok = false
				local amount = 0
				local tt = ""
				
				if level == 1 then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["GUILDBANK"],
						"icon", ArkInventory.Global.Location[loc_id].Texture,
						"isTitle", true,
						"textHeight", 12
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", DEPOSIT,
						"closeWhenClicked", true,
						"func", function( )
							PlaySound( "igMainMenuOption" )
							StaticPopup_Hide( "GUILDBANK_WITHDRAW" )
							if StaticPopup_Visible( "GUILDBANK_DEPOSIT") then
								StaticPopup_Hide( "GUILDBANK_DEPOSIT" )
							else
								StaticPopup_Show( "GUILDBANK_DEPOSIT" )
							end
						end
					)
					
					
					ok = false
					amount = 0
					tt = ""
					
					amount = GetGuildBankWithdrawMoney( )
					if amount >= 0 then
						
						if ( ( not CanGuildBankRepair( ) and not CanWithdrawGuildBankMoney( ) ) or ( CanGuildBankRepair( ) and not CanWithdrawGuildBankMoney( ) ) ) then
							amount = 0
						else
							amount = min( amount, GetGuildBankMoney( ) )
						end
						
						if amount > 0 then
							ok = true
						end
						
					else
						
						amount = 0
						
					end
					
					if amount > 0 then
						tt = string.format( "%s %s", GUILDBANK_AVAILABLE_MONEY, ArkInventory.MoneyText( amount, true ) )
					end
					
					if ok and ( not CanWithdrawGuildBankMoney( ) ) then
						tt = string.format( "%s%s (%s)", tt, REPAIR_ITEMS )
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", WITHDRAW,
						"tooltipTitle", WITHDRAW,
						"tooltipText", tt,
						"closeWhenClicked", true,
						"disabled", not ok,
						"func", function( )
							PlaySound( "igMainMenuOption" )
							StaticPopup_Hide( "GUILDBANK_DEPOSIT" )
							if StaticPopup_Visible( "GUILDBANK_WITHDRAW" ) then
								StaticPopup_Hide( "GUILDBANK_WITHDRAW" )
							else
								StaticPopup_Show( "GUILDBANK_WITHDRAW" )
							end
						end
					)
					
					
					ok = nil
					amount = 0
					tt = ""
					
					if IsGuildLeader( ) then
						
						local numSlots = GetNumGuildBankTabs( )
						amount = GetGuildBankTabCost( )
						
						if not amount or numSlots >= 6 then
							
							amount = 0
							ok = false
							
						else
							
							if GetMoney( ) >= amount then
								ok = true
							else
								ok = false
							end
							
						end
						
						if amount > 0 then
							tt = string.format( "%s %s", COSTS_LABEL, ArkInventory.MoneyText( amount, true ) )
						end
						
					end
					
					if ok ~= nil then
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", BANKSLOTPURCHASE,
							"tooltipTitle", BANKSLOTPURCHASE,
							"tooltipText", tt,
							"closeWhenClicked", true,
							"disabled", not ok,
							"func", function( )
								PlaySound( "igMainMenuOption" )
								StaticPopup_Show( "CONFIRM_BUY_GUILDBANK_TAB" )
							end
						)
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					
					
					
					
					
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", string.format( GUILDBANK_TAB_NUMBER, bag_id ), bag.name or "" ),
						"isTitle", true,
						"icon", bag.texture,
						"textHeight", 12
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", DISPLAY, ArkInventory.Localise["GUILDBANK"] ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "bank",
						"func", function( )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "bank" )
							GuildBankFrameTab_OnClick( bag_id, 1 )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", DISPLAY, GUILD_BANK_LOG ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "log",
						"func", function( )
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "log" )
							GuildBankFrameTab_OnClick( bag_id, 2 )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", DISPLAY, GUILD_BANK_MONEY_LOG ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "moneylog",
						"func", function( )
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "moneylog" )
							GuildBankFrameTab_OnClick( bag_id, 3 )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", DISPLAY, GUILD_BANK_TAB_INFO ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "tabinfo",
						"func", function( )
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "tabinfo" )
							GuildBankFrameTab_OnClick( bag_id, 4 )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					if IsGuildLeader( ) then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", "change name or icon",
							"closeWhenClicked", true,
							"func", function( )
								SetCurrentGuildBankTab( bag_id )
								GuildBankPopupFrame:Show( )
								GuildBankPopupFrame_Update( bag_id )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", "rescan data",
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.ScanVault( )
						end
					)
						
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
			
			end
			
		)
		
	end
	
end


function ArkInventory.MenuSwitchLocation( frame, level, value, offset )
	
	assert( frame, "code error: frame argument is missing" )
	
	ArkInventory.Lib.Dewdrop:AddLine(
		"text", ArkInventory.Localise["MENU_LOCATION_SWITCH"],
		"isTitle", true,
		"textHeight", 12
	)
	
	if level == offset + 1 then
	
		for set_id, loc in ArkInventory.spairs( ArkInventory.Global.Location ) do
			if ArkInventory.Global.Location[set_id].canView then
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", loc.Name,
					"tooltipTitle", loc.Name,
					"tooltipText", string.format( ArkInventory.Localise["MENU_LOCATION_SWITCH_TEXT"], loc.Name ),
					"icon", loc.Texture,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Toggle( set_id )
					end
				)
			end
		end
		
	end
	
end

function ArkInventory.MenuSwitchLocationOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else

		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				ArkInventory.MenuSwitchLocation( frame, level, value, 0 )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
		)

	end
	
end

function ArkInventory.MenuSwitchCharacter( frame, level, value, offset )
	
	assert( frame, "code error: frame argument is missing" )
	
	local loc_id = frame:GetParent( ):GetParent( ).ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	if level == offset + 1 then
		
		local count = 0
		local realms = { }
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["MENU_CHARACTER_SWITCH"],
			"isTitle", true,
			"textHeight", 12
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", cp.info.realm,
			"notClickable", true
		)
		
		local show
		
		for n, tp in ArkInventory.spairs( ArkInventory.db.global.player.data, function( a, b ) return ( a < b ) end ) do
			
			show = true
			
			if ( loc_id == ArkInventory.Const.Location.Vault ) and ( tp.info.class ~= "GUILD" ) then
				show = false
			elseif ( loc_id == ArkInventory.Const.Location.Pet ) and ( tp.info.class ~= "ACCOUNT" ) then
				show = false
			elseif ( loc_id == ArkInventory.Const.Location.Mount ) and ( tp.info.class ~= "ACCOUNT" ) then
				show = false
			elseif tp.location[loc_id].slot_count == 0 then
				show = false
			elseif tp.info.realm ~= cp.info.realm then
				show = false
				realms[tp.info.realm] = true
			end
			
			if show then
				
				count = count + 1
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.DisplayName4( tp.info, cp.info.faction ),
					--"tooltipTitle", "",
					--"tooltipText", "",
					"hasArrow", true,
					"isRadio", true,
					"checked", cp.info.player_id == tp.info.player_id,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
					end,
					"value", string.format( "SWITCH_CHARACTER_ERASE_%s", tp.info.player_id )
				)
				
			end
			
		end
		
		if count == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", "no data availale",
				"disabled", true
			)
			
		end

		if not ArkInventory.Table.IsEmpty( realms ) then
			
			table.sort( realms )
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			for k in ArkInventory.spairs( realms, function( a, b ) return ( a < b ) end ) do
			
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", k,
					--"tooltipTitle", "",
					--"tooltipText", "",
					"hasArrow", true,
					--"isRadio", true,
					--"checked", cp.info.player_id == tp.info.player_id,
					--"notClickable", cp.info.player_id == tp.info.player_id,
					--"closeWhenClicked", true,
					"value", string.format( "SWITCH_CHARACTER_REALM_%s", k )
				)
				
			end
			
		end
		
	end
	
	
	if level > offset + 1 and value then
		
		local realm = string.match( value, "^SWITCH_CHARACTER_REALM_(.+)" )
		if realm then
			
			local count = 0
			
			for n, tp in ArkInventory.spairs( ArkInventory.db.global.player.data, function( a, b ) return a < b end ) do
				
				local show = true
				
				if ( loc_id == ArkInventory.Const.Location.Vault ) and ( tp.info.class ~= "GUILD" ) then
					show = false
				end
				
				if ( loc_id == ArkInventory.Const.Location.Pet ) and ( tp.info.class ~= "ACCOUNT" ) then
					show = false
				end
				
				if ( loc_id == ArkInventory.Const.Location.Mount ) and ( tp.info.class ~= "ACCOUNT" ) then
					show = false
				end
				
				if tp.location[loc_id].slot_count == 0 or tp.info.realm ~= realm then
					show = false
				end
				
				if show then
					
					count = count + 1
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.DisplayName4( tp.info, cp.info.faction ),
						--"tooltipTitle", "",
						--"tooltipText", "",
						"hasArrow", true,
						"isRadio", true,
						"checked", cp.info.player_id == tp.info.player_id,
						--"notClickable", cp.info.player_id == tp.info.player_id,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
						end,
						"value", string.format( "SWITCH_CHARACTER_ERASE_%s", tp.info.player_id )
					)
					
				end
				
			end
			
			
			if count == 0 then
			
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", "no data availale",
					"disabled", true
				)
				
			end
			
		end
		
		local player_id = string.match( value, "^SWITCH_CHARACTER_ERASE_(.+)" )
		if player_id then
			
			local tp = ArkInventory.PlayerInfoGet( player_id )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.DisplayName4( tp.info, cp.info.faction ),
				"isTitle", true,
				"textHeight", 12
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			if loc_id ~= ArkInventory.Const.Location.Vault then
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
					"tooltipTitle", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
					"tooltipText", string.format( "%s%s", RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_TEXT"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.DisplayName1( tp.info ) ) ),
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Hide( loc_id )
						ArkInventory.EraseSavedData( tp.info.player_id, loc_id )
					end
				)
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["ALL"] ),
				"tooltipTitle", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["ALL"] ),
				"tooltipText", string.format( "%s%s", RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_TEXT"], ArkInventory.Localise["ALL"], ArkInventory.DisplayName1( tp.info ) ) ),
				"closeWhenClicked", true,
				"func", function( )
					ArkInventory.Frame_Main_Hide( )
					ArkInventory.EraseSavedData( tp.info.player_id )
				end
			)
		
		end
		
	end

end

function ArkInventory.MenuSwitchCharacterOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		
		ArkInventory.Lib.Dewdrop:Close( )
		
	else
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
		
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				ArkInventory.MenuSwitchCharacter( frame, level, value, 0 )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
			
		)
		
	end
	
end

function ArkInventory.MenuLDBBagsOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else

		local x, p, rp
		x = frame:GetBottom( ) + ( frame:GetTop( ) - frame:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Const.Program.Name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CONFIG"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Config_Show( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_ACTION"],
						"hasArrow", true,
						"value", "ACTIONS"
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_LOCATION_SWITCH"],
						"hasArrow", true,
						"value", "LOCATION"
					)
						
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["FONT"],
						"hasArrow", true,
						"value", "FONT"
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LDB"],
						"hasArrow", true,
						"value", "LDB"
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
				
					if value == "LOCATION" then
						ArkInventory.MenuSwitchLocation( frame, level, value, 1 )
					end
					
					if value == "FONT" then
					
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["FONT"],
							"isTitle", true,
							"textHeight", 12
						)
						
						for _, fontName in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", fontName,
								"tooltipTitle", ArkInventory.Localise["FONT"],
								"tooltipText", string.format( ArkInventory.Localise["CONFIG_SYSTEM_FONT_TEXT"], fontName ),
								"checked", fontName == ArkInventory.db.profile.option.font.name,
								"func", function( )
									ArkInventory.MediaSetFontAll( fontName )
								end
							)
						end
						
					end
					
					if value == "ACTIONS" then
					
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MENU_ACTION"],
							"isTitle", true,
							"textHeight", 12
						)
						
						for k, v in pairs( ArkInventory.Const.Actions ) do
							if v.LDB then
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", v.Name,
									"closeWhenClicked", true,
									"icon", v.Texture,
									"func", v.Scripts.OnClick
								)
							end
						end
						
					end
					
					if value == "LDB" then
					
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["LDB"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
							"tooltipTitle", ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
							"tooltipText", ArkInventory.Localise["LDB_BAGS_COLOUR_USE_TEXT"],
							"checked", ArkInventory.Global.Me.ldb.bags.colour,
							"func", function( )
								ArkInventory.Global.Me.ldb.bags.colour = not ArkInventory.Global.Me.ldb.bags.colour
								ArkInventory.LDB.Bags:Update( )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["LDB_BAGS_STYLE"],
							"tooltipTitle", ArkInventory.Localise["LDB_BAGS_STYLE"],
							"tooltipText", ArkInventory.Localise["LDB_BAGS_STYLE_TEXT"],
							"checked", ArkInventory.Global.Me.ldb.bags.full,
							"func", function( )
								ArkInventory.Global.Me.ldb.bags.full = not ArkInventory.Global.Me.ldb.bags.full
								ArkInventory.LDB.Bags:Update( )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
							"tooltipTitle", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
							"tooltipText", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE_TEXT"],
							"checked", ArkInventory.Global.Me.ldb.bags.includetype,
							"func", function( )
								ArkInventory.Global.Me.ldb.bags.includetype = not ArkInventory.Global.Me.ldb.bags.includetype
								ArkInventory.LDB.Bags:Update( )
							end
						)
						
					end
					
					
				end
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuLDBTrackingCurrencyOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else

		local x, p, rp
		x = frame:GetBottom( ) + ( frame:GetTop( ) - frame:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.LDB.Tracking_Currency.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					-- expand all token headers
					local numTokenTypes = GetCurrencyListSize( )
	
					if numTokenTypes > 0 then
						
						for j = numTokenTypes, 1, -1 do
							local name, isHeader, isExpanded = GetCurrencyListInfo( j )
							if isHeader and not isExpanded then
								ExpandCurrencyList( j, 1 )
							end
						end
						
						local numTokenTypes = GetCurrencyListSize( )
						
						for j = 1, numTokenTypes do
							
							local name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
							
							if isHeader then
								
								ArkInventory.Lib.Dewdrop:AddLine( )
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", name,
									"isTitle", true
								)
								
							else
								
								local h = GetCurrencyListLink( j )
								local class, id = ArkInventory.ObjectStringDecode( h )
								
								local checked = ArkInventory.Global.Me.ldb.tracking.currency.tracked[id]
								
								local t1 = name
								local t2 = ArkInventory.Localise["CLICK_TO_SELECT"]
								if checked then
									t1 = string.format( "%s%s", GREEN_FONT_COLOR_CODE, name )
									t2 = ArkInventory.Localise["CLICK_TO_DESELECT"]
								end
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"icon", icon,
									"text", t1,
									"tooltipTitle", name,
									"tooltipText", t2,
									"checked", checked,
									"func", function( )
										ArkInventory.Global.Me.ldb.tracking.currency.tracked[id] = not ArkInventory.Global.Me.ldb.tracking.currency.tracked[id]
										ArkInventory.LDB.Tracking_Currency:Update( )
									end
								)
								
							end
							
						end
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuLDBTrackingItemOpen( frame )

	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else

		local x, p, rp
		x = frame:GetBottom( ) + ( frame:GetTop( ) - frame:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.LDB.Tracking_Item.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local numTokenTypes = 0
					
					for k in ArkInventory.spairs( ArkInventory.db.global.option.tracking.items )  do
						
						numTokenTypes = numTokenTypes + 1
						
						local count = GetItemCount( k )
						local name, _, _, _, _, _, _, _, _, icon = GetItemInfo( k )
						
--[[
						if k == 6265 then
							-- soul shards
							count = UnitPower( "player", 7 ) or 0
						end
]]--
						
						local checked = ArkInventory.Global.Me.ldb.tracking.item.tracked[k]
						local t1 = name
						local t2 = ArkInventory.Localise["CLICK_TO_SELECT"]
						
						if checked then
							t1 = string.format( "%s%s", GREEN_FONT_COLOR_CODE, name )
							t2 = ArkInventory.Localise["CLICK_TO_DESELECT"]
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"icon", icon,
							"text", t1,
							"tooltipTitle", name,
							"tooltipText", t2,
							"checked", checked,
							"hasArrow", true,
							"func", function( )
								ArkInventory.Global.Me.ldb.tracking.item.tracked[k] = not ArkInventory.Global.Me.ldb.tracking.item.tracked[k]
								ArkInventory.LDB.Tracking_Item:Update( )
							end,
							"value", k
						)
						
					end
					
					if numTokenTypes == 0 then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["NONE"],
							"disabled", true
						)
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value and value > 0 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["REMOVE"], FONT_COLOR_CODE_CLOSE ),
						"tooltipTitle", ArkInventory.Localise["REMOVE"],
						--"tooltipText", "",
						"func", function( )
							ArkInventory.db.global.option.tracking.items[value] = nil
							ArkInventory.Global.Me.ldb.tracking.item.tracked[value] = false
							ArkInventory.LDB.Tracking_Item:Update( )
						end
					)

				end
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuMounts( frame, level, value, offset )

	assert( frame, "code error: frame argument is missing" )
	
	local icon = ""
	
	if ( level == 1 + offset ) and ( ( offset == 0 ) or ( value and ( value == "INSERT_LOCATION_MENU" ) ) ) then
		
--		ArkInventory.Lib.Dewdrop:AddLine(
--			"text", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name,
--			"isTitle", true,
--			"textHeight", 14
--		)
		
		local tooltiptext = ""
		local skill = ArkInventory.MountJournal.SkillLevel( )
		
		if skill == 0 then
			tooltiptext = string.format( "%s%s", RED_FONT_COLOR_CODE, SPELL_FAILED_LOW_CASTLEVEL )
		else
			tooltiptext = ""
		end
		
		for mountType in pairs( ArkInventory.Const.MountTypes ) do
			if mountType ~= "x" then
			
				local mode = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", mode,
					"tooltipTitle", mode,
					"hasArrow", true,
					"disabled", skill == 0,
					"value", mountType
				)
				
			end
		end
		
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CONFIG"],
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Frame_Config_Show( "ldb", "mounts" )
			end
		)
		
	end
	
	
	if ( level == 2 + offset ) and value then
		
		local mountType = value
		local header = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
		local selected = ArkInventory.Global.Me.ldb.mounts[mountType].selected
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", header,
			"isTitle", true,
			"textHeight", 14
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		local companionCount = 0
		
		for _, md in ArkInventory.MountJournal.Iterate( ) do
			
			if md.owned and md.mt == ArkInventory.Const.MountTypes[mountType] then
				
				companionCount = companionCount + 1
				
				icon = ""
				local text = md.name
				
				if selected[md.spell] == true then
					icon = ArkInventory.Const.Texture.Yes
--					text = string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, md.name, FONT_COLOR_CODE_CLOSE )
				elseif selected[md.spell] == false then
					icon = ArkInventory.Const.Texture.No
--					text = string.format( "%s%s%s", RED_FONT_COLOR_CODE, md.name, FONT_COLOR_CODE_CLOSE )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", icon,
					"text", text,
					"tooltipTitle", md.name,
					"tooltipText", md.desc,
					"hasArrow", true,
					"value", string.format( "%s:%s", mountType, md.index )
				)
				
			end
			
		end
	
		if companionCount > 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			local companionName = ArkInventory.Localise["RANDOM"]
			local tooltipText = ArkInventory.Localise["CLICK_TO_SELECT"]
			local selected = ArkInventory.Global.Me.ldb.mounts[mountType].selected
			
			local allrandom = true
			for k, v in pairs( selected ) do
				if v == true then
					allrandom = false
					break
				end
			end
			
			if allrandom then
				companionName = string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, companionName, FONT_COLOR_CODE_CLOSE )
				tooltipText = nil
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", companionName,
				"tooltipTitle", companionName,
				"tooltipText", tooltipText,
				"checked", allrandom,
				"notClickable", allrandom,
				"func", function( )
					for k, v in pairs( selected ) do
						if v == true then
							selected[k] = nil
						end
					end
					ArkInventory.LDB.Mounts:Update( )
				end
			)
			
		end
		
		if companionCount == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_COMPANION_NONE"],
				"disabled", true
			)
			
		end
		
		if mountType == "a" then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_MOUNTS_FLYING_USEFORLAND"],
				"tooltipTitle", ArkInventory.Localise["LDB_MOUNTS_FLYING_USEFORLAND"],
				"tooltipText", ArkInventory.Localise["LDB_MOUNTS_FLYING_USEFORLAND_TEXT"],
				"checked", ArkInventory.Global.Me.ldb.mounts.l.useflying,
				"func", function( )
					ArkInventory.Global.Me.ldb.mounts.l.useflying = not ArkInventory.Global.Me.ldb.mounts.l.useflying
				end
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
				"tooltipTitle", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
				"tooltipText", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_TEXT"],
				"checked", ArkInventory.Global.Me.ldb.mounts.a.dismount,
				"func", function( )
					ArkInventory.Global.Me.ldb.mounts.a.dismount = not ArkInventory.Global.Me.ldb.mounts.a.dismount
				end
			)
			
		end
		
	end
	
	if ( level == 3 + offset ) and value then
		
		local mountType, index = string.match( value, "^(.-):(.-)$" )
		index = tonumber( index )
		
		local md = ArkInventory.MountJournal.GetMount( index )
		local usable = ArkInventory.MountJournal.IsUsable( md.index )
		local selected = ArkInventory.Global.Me.ldb.mounts[mountType].selected
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", md.icon,
			"text", md.name,
			"isTitle", true,
			"textHeight", 14
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_SELECT"], FONT_COLOR_CODE_CLOSE ),
			"tooltipTitle", md.name,
			"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_SELECT"], md.name ),
			"checked", selected[md.spell] == true,
			"disabled", selected[md.spell] == true,
			"isRadio", true,
			"func", function( )
				selected[md.spell] = true
				ArkInventory.LDB.Mounts:Update( )
			end
		)

		ArkInventory.Lib.Dewdrop:AddLine(
			"text", string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_IGNORE"], FONT_COLOR_CODE_CLOSE ),
			"tooltipTitle", md.name,
			"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_IGNORE"], md.name ),
			"checked", selected[md.spell] == false,
			"disabled", selected[md.spell] == false,
			"isRadio", true,
			"func", function( )
				selected[md.spell] = false
				ArkInventory.LDB.Mounts:Update( )
			end
		)

		if selected[md.spell] ~= nil then
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( "%s%s%s", HIGHLIGHT_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_DESELECT"], FONT_COLOR_CODE_CLOSE ),
				"tooltipTitle", md.name,
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_DESELECT"], md.name ),
				"checked", selected[md.spell] == nil,
				"disabled", selected[md.spell] == nil,
				"isRadio", true,
				"func", function( )
					selected[md.spell] = nil
					ArkInventory.LDB.Mounts:Update( )
				end
			)
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["LDB_MOUNTS_SUMMON"],
			"tooltipTitle", md.name,
			"tooltipText", ArkInventory.Localise["LDB_MOUNTS_SUMMON"],
			"disabled", not usable,
			"func", function( )
				ArkInventory.MountJournal.Summon( index )
			end
		)
		
	end
	
end

function ArkInventory.MenuLDBMountsOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
	
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if ( level == 1 ) then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.LDB.Mounts.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
				
				end
				
				ArkInventory.MenuMounts( frame, level, value, 0 )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
		)

	end
	
end

function ArkInventory.MenuPets( frame, level, value, offset )
	
	assert( frame, "code error: frame argument is missing" )
	
	local selected = ArkInventory.Global.Me.ldb.pets.selected
	
	--ArkInventory.Output( level, " / ", offset, " / ", value )
	
	if ( level == offset + 1 ) and ( ( offset == 0 ) or ( value and ( value == "INSERT_LOCATION_MENU" ) ) ) then
		
		local n = ArkInventory.PetJournal.GetCount( )
		
		if n > 0 then
			
			for i = 1, C_PetJournal.GetNumPetTypes( ) do
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.PetJournal.PetTypeName( i ),
					"hasArrow", true,
					"value", string.format( "PETTYPE_%s", i )
				)
			end
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			local companionName = ArkInventory.Localise["RANDOM"]
			local tooltipText = ArkInventory.Localise["CLICK_TO_SELECT"]
			
			local allrandom = true
			for k, v in pairs( selected ) do
				if v == true then
					allrandom = false
					break
				end
			end
			
			if allrandom then
				companionName = string.format( "%s%s", GREEN_FONT_COLOR_CODE, companionName )
				tooltipText = nil
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", companionName,
				"tooltipTitle", companionName,
				"tooltipText", tooltipText,
				"checked", allrandom,
				"notClickable", allrandom,
				"func", function( )
					for k, v in pairs( selected ) do
						if v == true then
							selected[k] = nil
						end
					end
					ArkInventory.LDB.Pets:Update( )
				end
			)
			
		end
		
		if n == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_COMPANION_NONE"],
				"disabled", true
			)
			
		end
		
	end
	
	if ( level == offset + 2 ) and value then
		
		local petType0 = string.match( value, "^PETTYPE_(.+)$" )
		
		if petType0 then
			
			petType0 = tonumber( petType0 )
			local species = -1
			
			for _, pd in ArkInventory.PetJournal.Iterate( ) do
				
				if ( pd.sd.petType == petType0 ) and ( species ~= pd.sd.speciesID ) then
					
					species = pd.sd.speciesID
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", pd.sd.name,
						"hasArrow", true,
						"value", string.format( "PETSPECIES_%s", pd.sd.speciesID )
					)
				
				end
				
			end
		
		end
		
	end
		
	if ( level == offset + 3 ) and value then
		
		local speciesID = string.match( value, "^PETSPECIES_(.+)$" )
		
		if speciesID then
			
			speciesID = tonumber( speciesID )
			local sd = ArkInventory.PetJournal.GetSpeciesInfo( speciesID )
			
			if sd then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", sd.icon,
					"text", sd.name,
					"isTitle", true,
					"textHeight", 14
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				for _, pd in ArkInventory.PetJournal.Iterate( ) do
					
					if ( pd.sd.speciesID == sd.speciesID ) then
						
						local c = select( 5, ArkInventory.GetItemQualityColor( pd.rarity ) )
						local name = string.format( "%s%s|r", c, sd.name )
						
						if pd.cn and pd.cn ~= "" then
							name = string.format( "%s (%s)", name, pd.cn )
						end
						
						name = string.format( "%s [%s]", name, pd.level )
						
						local icon = ""
						
						if selected[pd.guid] == true then
							icon = ArkInventory.Const.Texture.Yes
						elseif selected[pd.guid] == false then
							icon = ArkInventory.Const.Texture.No
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"icon", icon,
							"text", name,
							"tooltipTitle", name,
							"hasArrow", true,
							"value", string.format( "PETID_%s", pd.guid )
						)
					
					end
					
				end
				
			end
		
		end
		
	end
		
	if ( level == offset + 4 ) and value then
		
		local petID = string.match( value, "^PETID_(.+)$" )
		
		if petID then
			
			local pd = ArkInventory.PetJournal.GetPet( petID )
			
			local selected = ArkInventory.Global.Me.ldb.pets.selected
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", pd.fullName,
				"isTitle", true,
				"textHeight", 14
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_SELECT"], FONT_COLOR_CODE_CLOSE ),
				"tooltipTitle", pd.fullName,
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_SELECT"], pd.fullName ),
				"checked", selected[pd.guid] == true,
				"disabled", selected[pd.guid] == true,
				"isRadio", true,
				"func", function( )
					selected[pd.guid] = true
					ArkInventory.LDB.Pets:Update( )
				end
			)
	
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_IGNORE"], FONT_COLOR_CODE_CLOSE ),
				"tooltipTitle", pd.fullName,
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_IGNORE"], pd.fullName ),
				"checked", selected[pd.guid] == false,
				"disabled", selected[pd.guid] == false,
				"isRadio", true,
				"func", function( )
					selected[pd.guid] = false
					ArkInventory.LDB.Pets:Update( )
				end
			)
			
			if selected[pd.guid] ~= nil then
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s%s%s", HIGHLIGHT_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_DESELECT"], FONT_COLOR_CODE_CLOSE ),
					"tooltipTitle", pd.fullName,
					"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_DESELECT"], pd.fullName ),
					"isRadio", true,
					"func", function( )
						selected[pd.guid] = nil
						ArkInventory.LDB.Pets:Update( )
					end
				)
			end
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			local txt = BATTLE_PET_SUMMON
			local active = ArkInventory.PetJournal.GetCurrent( )
			if active and active == pd.guid then
				txt = PET_ACTION_DISMISS
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", txt,
				"tooltipTitle", pd.fullName,
				"tooltipText", BATTLE_PETS_SUMMON_TOOLTIP,
				"disabled", not ArkInventory.PetJournal.CanSummon( pd.guid ),
				"func", function( )
					ArkInventory.PetJournal.Summon( pd.guid )
				end
			)
			
		end
		
	end
	
end

function ArkInventory.MenuLDBPetsOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		
		ArkInventory.Lib.Dewdrop:Close( )
		
	else
		
		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
		
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if ( level == 1 ) then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.LDB.Pets.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
				
				end
				
				ArkInventory.MenuPets( frame, level, value, 0 )
				
				if level == 1 then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
		)

	end
	
end

function ArkInventory.MenuItemPetJournal( frame, index )
	
	assert( frame, "code error: frame argument is missing" )
	assert( index, "code error: index argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else

		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
		
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				local pd = ArkInventory.PetJournal.GetPet( index )
				
				if pd then
					
					--ArkInventory.Output( pd.fullName, " / ", pd.rarity, " / ", pd.link )

				if ( level == 1 ) then
					
					--name = string.format( "%s%s|r", select( 5, ArkInventory.GetItemQualityColor( pd.rarity ) ), pd.fullName )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", pd.fullName,
						"isTitle", true,
						"icon", pd.sd.icon,
						"textHeight", 14
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local isRevoked = ArkInventory.PetJournal.IsRevoked( pd.guid )
					local isLockedForConvert = ArkInventory.PetJournal.IsLockedForConvert( pd.guid )
					
					if ( not isRevoked ) and ( not isLockedForConvert ) then
						
						local txt = BATTLE_PET_SUMMON
						if ( ArkInventory.PetJournal.GetCurrent( ) == pd.guid ) then
							txt = PET_DISMISS
						end
						
						-- summon / dismiss
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"disabled", not ArkInventory.PetJournal.CanSummon( pd.guid ),
							"closeWhenClicked", true,
							"func", function( info )
								ArkInventory.PetJournal.Summon( pd.guid )
							end
						)
						
						-- rename
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", BATTLE_PET_RENAME,
							"disabled", not ArkInventory.PetJournal.JournalIsUnlocked( ),
							"closeWhenClicked", true,
							"func", function( info )
								ArkInventory.Lib.StaticDialog:Spawn( "BATTLE_PET_RENAME", pd.guid )
							end
						)
						
						-- enable / disable favourite
						if pd.fav then
							txt = BATTLE_PET_UNFAVORITE
						else
							txt = BATTLE_PET_FAVORITE
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"disabled", not ArkInventory.PetJournal.JournalIsUnlocked( ),
							"closeWhenClicked", true,
							"func", function( info )
								if pd.fav then
									ArkInventory.PetJournal.SetFavorite( pd.guid, 0 )
								else
									ArkInventory.PetJournal.SetFavorite( pd.guid, 1 )
								end
							end
						)
						
						-- release
						if ArkInventory.PetJournal.CanRelease( pd.guid ) then
							
							txt = nil
							if ArkInventory.PetJournal.InBattle( ) then
								txt2 = "in battle"
							elseif ArkInventory.PetJournal.IsSlotted( pd.guid ) then
								txt = "slotted"
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", BATTLE_PET_RELEASE,
								"tooltipTitle", BATTLE_PET_RELEASE,
								"tooltipText", txt,
								"disabled", ArkInventory.PetJournal.InBattle( ) or ArkInventory.PetJournal.IsSlotted( pd.guid ),
								"closeWhenClicked", true,
								"func", function( info )
									ArkInventory.Lib.StaticDialog:Spawn( "BATTLE_PET_RELEASE", pd.guid )
								end
							)
						end
						
						-- cage
						if ArkInventory.PetJournal.CanTrade( pd.guid ) then
							
							txt = BATTLE_PET_PUT_IN_CAGE
							
							if ArkInventory.PetJournal.IsSlotted( pd.guid ) then
								txt = BATTLE_PET_PUT_IN_CAGE_SLOTTED
							elseif ArkInventory.PetJournal.IsHurt( pd.guid ) then
								txt = BATTLE_PET_PUT_IN_CAGE_HEALTH
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", txt,
								"disabled", ArkInventory.PetJournal.IsSlotted( pd.guid ) or ArkInventory.PetJournal.IsHurt( pd.guid ),
								"closeWhenClicked", true,
								"func", function( info )
									ArkInventory.Lib.StaticDialog:Spawn( "BATTLE_PET_PUT_IN_CAGE", pd.guid )
								end
							)
						end
						
					end
					
				end
				
				else
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", "pet data not found",
						"tooltipTitle", "error",
						"tooltipText", "pet data not found",
						"disabled", true
					)

				end
				
				if ( level == 1 ) then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
		)

	end
	
end

function ArkInventory.MenuItemMountJournal( frame, index )
	
	assert( frame, "code error: frame argument is missing" )
	assert( index, "code error: index argument is missing" )

	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
	
		ArkInventory.Lib.Dewdrop:Close( )
	
	else

		local x, p, rp
		x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
		
		ArkInventory.Lib.Dewdrop:Open( frame,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				local md = ArkInventory.MountJournal.GetMount( index )
				
				if md then
					
					if ( level == 1 ) then
						
						--name = string.format( "%s%s|r", select( 5, ArkInventory.GetItemQualityColor( pd.rarity ) ), pd.fullName )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", md.name,
							"isTitle", true,
							"icon", md.icon,
							"textHeight", 14
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						-- enable / disable favourite
						if md.fav then
							txt = BATTLE_PET_UNFAVORITE
						else
							txt = BATTLE_PET_FAVORITE
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"disabled", not ArkInventory.PetJournal.JournalIsUnlocked( ),
							"closeWhenClicked", true,
							"func", function( info )
								if md.fav then
									ArkInventory.MountJournal.SetFavorite( index, false )
								else
									ArkInventory.MountJournal.SetFavorite( index, true )
								end
							end
						)
						
					end
					
				else
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", "mount data not found",
						"tooltipTitle", "error",
						"tooltipText", "mount data not found",
						"disabled", true
					)

				end
				
				if ( level == 1 ) then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
		)

	end
	
end
