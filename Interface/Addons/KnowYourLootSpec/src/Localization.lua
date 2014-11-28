-- To update a translation please use the localization utility at:
-- http://wow.curseforge.com/addons/know-your-loot-spec/localization/

local addonName, a = ...
a.Localize = setmetatable({ }, { __index = function(_, key) return key end })
local L = a.Localize
local locale = GetLocale()
if locale == "ptBR" then -- Brazilian Portuguese
-- L["Announce To"] = ""
-- L["Announce When"] = ""
-- L["Bonus Roll Window"] = ""
-- L["Changing Loot Spec"] = ""
-- L["Changing Spec"] = ""
-- L["Current"] = ""
-- L["Entering an Instance"] = ""
-- L["General Chat Log"] = ""
-- L["Left Click"] = ""
-- L["Logging In"] = ""
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
-- L["Right Click"] = ""
-- L["Show Icon On"] = ""
-- L["Targeting a Boss"] = ""
-- L["Toggle This Menu"] = ""
-- L["Toggle Tooltip"] = ""
-- L["Unit Frame"] = ""
-- L["Warning Text"] = ""

elseif locale == "frFR" then -- French
-- L["Announce To"] = ""
-- L["Announce When"] = ""
-- L["Bonus Roll Window"] = ""
-- L["Changing Loot Spec"] = ""
-- L["Changing Spec"] = ""
-- L["Current"] = ""
-- L["Entering an Instance"] = ""
-- L["General Chat Log"] = ""
-- L["Left Click"] = ""
-- L["Logging In"] = ""
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
-- L["Right Click"] = ""
-- L["Show Icon On"] = ""
-- L["Targeting a Boss"] = ""
-- L["Toggle This Menu"] = ""
-- L["Toggle Tooltip"] = ""
-- L["Unit Frame"] = ""
-- L["Warning Text"] = ""

elseif locale == "deDE" then -- German
L["Announce To"] = "Ansageziel" -- Needs review
L["Announce When"] = "Ansagen beim" -- Needs review
L["Bonus Roll Window"] = "Extrawurf-Fenster" -- Needs review
L["Changing Loot Spec"] = "Wechseln der Beutespezialisierung" -- Needs review
L["Changing Spec"] = "Wechseln der Spezialisierung" -- Needs review
L["Current"] = "Aktuell" -- Needs review
L["Entering an Instance"] = "Betreten einer Instanz" -- Needs review
L["General Chat Log"] = "Allgemeines Chatfenster" -- Needs review
L["Left Click"] = "Link-Klick" -- Needs review
L["Logging In"] = "Einloggen" -- Needs review
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
L["Right Click"] = "Rechts-Klick" -- Needs review
L["Show Icon On"] = "Icon anzeigen beim" -- Needs review
L["Targeting a Boss"] = "Anvisieren eines Bosses" -- Needs review
L["Toggle This Menu"] = "Dieses Menü anzeigen" -- Needs review
L["Toggle Tooltip"] = "Tooltip anzeigen" -- Needs review
L["Unit Frame"] = "Einheitenfenster" -- Needs review
L["Warning Text"] = "Warntext" -- Needs review

elseif locale == "itIT" then -- Italian
-- L["Announce To"] = ""
-- L["Announce When"] = ""
-- L["Bonus Roll Window"] = ""
-- L["Changing Loot Spec"] = ""
-- L["Changing Spec"] = ""
-- L["Current"] = ""
-- L["Entering an Instance"] = ""
-- L["General Chat Log"] = ""
-- L["Left Click"] = ""
-- L["Logging In"] = ""
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
-- L["Right Click"] = ""
-- L["Show Icon On"] = ""
-- L["Targeting a Boss"] = ""
-- L["Toggle This Menu"] = ""
-- L["Toggle Tooltip"] = ""
-- L["Unit Frame"] = ""
-- L["Warning Text"] = ""

elseif locale == "koKR" then -- Korean
-- L["Announce To"] = ""
-- L["Announce When"] = ""
-- L["Bonus Roll Window"] = ""
-- L["Changing Loot Spec"] = ""
-- L["Changing Spec"] = ""
-- L["Current"] = ""
-- L["Entering an Instance"] = ""
-- L["General Chat Log"] = ""
-- L["Left Click"] = ""
-- L["Logging In"] = ""
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
-- L["Right Click"] = ""
-- L["Show Icon On"] = ""
-- L["Targeting a Boss"] = ""
-- L["Toggle This Menu"] = ""
-- L["Toggle Tooltip"] = ""
-- L["Unit Frame"] = ""
-- L["Warning Text"] = ""

elseif locale == "esMX" then -- Latin American Spanish
-- L["Announce To"] = ""
-- L["Announce When"] = ""
-- L["Bonus Roll Window"] = ""
-- L["Changing Loot Spec"] = ""
-- L["Changing Spec"] = ""
-- L["Current"] = ""
-- L["Entering an Instance"] = ""
-- L["General Chat Log"] = ""
-- L["Left Click"] = ""
-- L["Logging In"] = ""
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
-- L["Right Click"] = ""
-- L["Show Icon On"] = ""
-- L["Targeting a Boss"] = ""
-- L["Toggle This Menu"] = ""
-- L["Toggle Tooltip"] = ""
-- L["Unit Frame"] = ""
-- L["Warning Text"] = ""

elseif locale == "ruRU" then -- Russian
L["Announce To"] = "Сообщать с помощью"
L["Announce When"] = "Сообщать при"
L["Bonus Roll Window"] = "Окне дополнительного броска"
L["Changing Loot Spec"] = "Смене специализации для получаемой добычи"
L["Changing Spec"] = "Смене специализации"
L["Current"] = "Текущий"
L["Entering an Instance"] = "Входе в подземелье"
L["General Chat Log"] = "Чата"
L["Left Click"] = "Левый клик"
L["Logging In"] = "Входе в игровой мир"
L["Receiving a Burden of Eternity"] = "Получении бремени вечности"
L["Receiving a Heroic Cache of Treasures"] = "Получении героического сундука с сокровищами"
L["Receiving a Timeless Armor Piece"] = "Получении вневременной заготовки"
L["Receiving Other Caches of Treasures"] = "Получении прочих сундуков с сокровищами"
L["Right Click"] = "Правый клик"
L["Show Icon On"] = "Иконка на"
L["Targeting a Boss"] = "Выбирании босса в качестве цели"
L["Toggle This Menu"] = "Переключить это меню"
L["Toggle Tooltip"] = "Переключить подсказку"
L["Unit Frame"] = "Портрете персонажа"
L["Warning Text"] = "Предупреждения"

elseif locale == "zhCN" then -- Simplified Chinese
L["Announce To"] = "通告到" -- Needs review
L["Announce When"] = "何时通告" -- Needs review
L["Bonus Roll Window"] = "额外骰点窗口" -- Needs review
L["Changing Loot Spec"] = "切换拾取专精时" -- Needs review
L["Changing Spec"] = "切换专精时" -- Needs review
L["Current"] = "当前" -- Needs review
L["Entering an Instance"] = "进入副本时" -- Needs review
L["General Chat Log"] = "综合聊天记录" -- Needs review
L["Left Click"] = "左键点击" -- Needs review
L["Logging In"] = "登陆时" -- Needs review
L["Receiving a Burden of Eternity"] = "获得不朽之责时" -- Needs review
L["Receiving a Heroic Cache of Treasures"] = "获得英雄宝箱时" -- Needs review
L["Receiving a Timeless Armor Piece"] = "获得一个永恒装备宝箱时" -- Needs review
L["Receiving Other Caches of Treasures"] = "获得其他宝箱时" -- Needs review
L["Right Click"] = "右键点击" -- Needs review
L["Show Icon On"] = "显示图标开启" -- Needs review
L["Targeting a Boss"] = "选中一个首领时" -- Needs review
L["Toggle This Menu"] = "开启此菜单" -- Needs review
L["Toggle Tooltip"] = "开启提示信息" -- Needs review
L["Unit Frame"] = "单位框架" -- Needs review
L["Warning Text"] = "警告文字" -- Needs review

elseif locale == "esES" then -- Spanish
-- L["Announce To"] = ""
-- L["Announce When"] = ""
-- L["Bonus Roll Window"] = ""
-- L["Changing Loot Spec"] = ""
-- L["Changing Spec"] = ""
-- L["Current"] = ""
-- L["Entering an Instance"] = ""
-- L["General Chat Log"] = ""
-- L["Left Click"] = ""
-- L["Logging In"] = ""
-- L["Receiving a Burden of Eternity"] = ""
-- L["Receiving a Heroic Cache of Treasures"] = ""
-- L["Receiving a Timeless Armor Piece"] = ""
-- L["Receiving Other Caches of Treasures"] = ""
-- L["Right Click"] = ""
-- L["Show Icon On"] = ""
-- L["Targeting a Boss"] = ""
-- L["Toggle This Menu"] = ""
-- L["Toggle Tooltip"] = ""
-- L["Unit Frame"] = ""
-- L["Warning Text"] = ""

elseif locale == "zhTW" then -- Traditional Chinese
L["Announce To"] = "通報到" -- Needs review
L["Announce When"] = "何時通報" -- Needs review
L["Bonus Roll Window"] = "額外骰點視窗" -- Needs review
L["Changing Loot Spec"] = "切換拾取專精時" -- Needs review
L["Changing Spec"] = "切換專精時" -- Needs review
L["Current"] = "當前" -- Needs review
L["Entering an Instance"] = "進入副本時" -- Needs review
L["General Chat Log"] = "綜合聊天記錄" -- Needs review
L["Left Click"] = "左鍵點擊" -- Needs review
L["Logging In"] = "登入時" -- Needs review
L["Receiving a Burden of Eternity"] = "獲得永恆之負時" -- Needs review
L["Receiving a Heroic Cache of Treasures"] = "獲得一個英雄藏寶箱時" -- Needs review
L["Receiving a Timeless Armor Piece"] = "獲得永恆裝備儲藏箱時" -- Needs review
L["Receiving Other Caches of Treasures"] = "獲得一個藏寶箱時" -- Needs review
L["Right Click"] = "右鍵點擊" -- Needs review
L["Show Icon On"] = "顯示圖示開啓" -- Needs review
L["Targeting a Boss"] = "選中一個首領時" -- Needs review
L["Toggle This Menu"] = "開啓選單" -- Needs review
L["Toggle Tooltip"] = "開啓提示資訊" -- Needs review
L["Unit Frame"] = "單位框架" -- Needs review
L["Warning Text"] = "警告文字" -- Needs review

end