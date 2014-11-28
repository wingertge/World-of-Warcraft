local Locale = GetLocale()

-- Russian Locale
if (Locale ~= "ruRU") then
	return
end

-- Some postfix's for certain controls.
local Performance = "\n|cffFF0000Выключение этоой опции может повысить производительность|r" -- For high CPU options
local PerformanceSlight = "\n|cffFF0000Выключение этой опции может немного повысить производительность|r" -- For semi-high CPU options
local RestoreDefault = "\n|cffFFFF00Правый клик для воостановления значений по-умолчанию|r" -- For color pickers

TukuiConfig["ruRU"] = {
	["General"] = {
		["AutoScale"] = {
			["Name"] = "Автоматический масштаб",
			["Desc"] = "Автоматически определять лучший масштаб интерфейса для вашего разрешения",
		},
		
		["UIScale"] = {
			["Name"] = "Масштаб интерфейса",
			["Desc"] = "Установить масштаб вручную",
		},
		
		["BackdropColor"] = {
			["Name"] = "Цвет фона",
			["Desc"] = "Установить цвет фона для всех элементов Tukui"..RestoreDefault,
		},
		
		["BorderColor"] = {
			["Name"] = "Цвет границ",
			["Desc"] = "Установить цвет границы для всех элементов Tukui"..RestoreDefault,
		},
		
		["HideShadows"] = {
			["Name"] = "Скрыть тени",
			["Desc"] = "Отобразить или скрыть тени для некоторых элементов Tukui",
		},
	},
	
	["ActionBars"] = {
		["Enable"] = {
			["Name"] = "Включить панели команд",
			["Desc"] = "Использовать панели команд в стиле Tukui",
		},
		
		["HotKey"] = {
			["Name"] = "Горячие клавиши",
			["Desc"] = "Отображать текст назначнных клавиш на кнопках ",
		},
		
		["Macro"] = {
			["Name"] = "Названия макросов",
			["Desc"] = "Отображать на кнопках названия макросов",
		},
		
		["ShapeShift"] = {
			["Name"] = "Панель стоек/тотемы",
			["Desc"] = "Использовать панель стоек/тотемов в стиле Tukui",
		},

		["SwitchBarOnStance"] = {
			["Name"] = "Swap main bar on new stance",
			["Desc"] = "Enable main action bar swap when you change stance.",
		},
		
		["Pet"] = {
			["Name"] = "Панель питомца",
			["Desc"] = "Использовать панель питомца в стиле Tukui",
		},
		
		["NormalButtonSize"] = {
			["Name"] = "Размер Кнопок",
			["Desc"] = "Установить размер кнопок на панели команд",
		},
		
		["PetButtonSize"] = {
			["Name"] = "Размер кнопок панели питомца",
			["Desc"] = "Установить размер кнопок на панели питомца",
		},
		
		["ButtonSpacing"] = {
			["Name"] = "Отступ кнопок",
			["Desc"] = "Установить расстояние между кнопками на панели команд",
		},
		
		["OwnShadowDanceBar"] = {
			["Name"] = "Панель для Танца теней",
			["Desc"] = "Использовать для Танца теней отдельную панель команд",
		},
		
		["OwnMetamorphosisBar"] = {
			["Name"] = "Панель для Метаморфозы",
			["Desc"] = "Использовать для Метаморфозы чернокнижника отдельную панель команд",
		},
		
		["OwnWarriorStanceBar"] = {
			["Name"] = "Панели для стоек воина",
			["Desc"] = "Использовать отдельную панель команд для каждой стойки воина",
		},
		
		["HideBackdrop"] = {
			["Name"] = "Скрыть фон",
			["Desc"] = "Выключает фон панелей команд",
		},
		
		["Font"] = {
			["Name"] = "Шрифт панели команд",
			["Desc"] = "Установить шрифт для панели команд",
		},
	},
	
	["Auras"] = {
		["Enable"] = {
			["Name"] = "Включить Ауры",
			["Desc"] = "Стилизовать ауры под Tukui",
		},
		
		["Consolidate"] = {
			["Name"] = "Объединять положительные эффекты",
			["Desc"] = "Включить объединение положительных (обычно рейдовых) эффектов",
		},
		
		["Flash"] = {
			["Name"] = "Мигание аур",
			["Desc"] = "Иконки ару будут мигать незадолго до окончания "..PerformanceSlight,
		},
		
		["ClassicTimer"] = {
			["Name"] = "Класические таймеры",
			["Desc"] = "Использовать текстовые таймеры на аурах",
		},
		
		["HideBuffs"] = {
			["Name"] = "Скрыть баффы",
			["Desc"] = "Выключить отображение баффов",
		},
		
		["HideDebuffs"] = {
			["Name"] = "Скрыть дебаффы",
			["Desc"] = "Выключить отображение дебаффов",
		},
		
		["Animation"] = {
			["Name"] = "Анимация",
			["Desc"] = "Показывать анимацию 'выскакивающих' аур "..PerformanceSlight,
		},
		
		["BuffsPerRow"] = {
			["Name"] = "Баффов в ряду",
			["Desc"] = "Установить количество баффов, отображаемых в одном ряду",
		},
		
		["Font"] = {
			["Name"] = "Шрифт аур",
			["Desc"] = "Установить шрифт для аур",
		},
	},
	
	["Bags"] = {
		["Enable"] = {
			["Name"] = "Включить Сумки",
			["Desc"] = "Использовать сумку все-в-одной",
		},
		
		["ButtonSize"] = {
			["Name"] = "Размер слотов",
			["Desc"] = "Устанить размер для ячеек в сумках",
		},
		
		["Spacing"] = {
			["Name"] = "Отступ",
			["Desc"] = "Установить отступ между ячейками в сумках",
		},
		
		["ItemsPerRow"] = {
			["Name"] = "Предметов в ряду",
			["Desc"] = "Установить сколько ячеек будет в каждом ряду сумки",
		},
		
		["PulseNewItem"] = {
			["Name"] = "Анимация мигания новых предметов",
			["Desc"] = "Новые предметы в вашей сумке будут мигать",
		},
		
		["Font"] = {
			["Name"] = "Шрифт сумки",
			["Desc"] = "Установить шрифт для сумок",
		},
		
		["BagFilter"] = {
			["Name"] = "Включить фильтр сумок",
			["Desc"] = "Автоматически удалять серые предметы когда они попадают в вашу сумку",
			["Default"] = "Автоматически удалять серые предметы когда они попадают в вашу сумку",
		},
	},
	
	["Chat"] = {
		["Enable"] = {
			["Name"] = "Включить чат",
			["Desc"] = "Позволить Tukui заниматься позиционированием и стилизацией чата.",
		},
		
		["WhisperSound"] = {
			["Name"] = "Звук шёпота",
			["Desc"] = "Проигрывать звук при получении личного сообщения",
		},
		
		["LinkColor"] = {
			["Name"] = "Цвет ссылок",
			["Desc"] = "Установить цвет, которым будуо окрашиваться ссылки "..RestoreDefault,
		},
		
		["LinkBrackets"] = {
			["Name"] = "Скобки у ссылок",
			["Desc"] = "Обрамлять ссылки скобками",
		},
		
		["LootFrame"] = {
			["Name"] = "Вкладка чата для добычи",
			["Desc"] = "Создать отдельный чат 'Добыча' справа",
		},
		
		["Background"] = {
			["Name"] = "Фон чата",
			["Desc"] = "Создать фон для левого и правого окна чата",
		},
		
		["ChatFont"] = {
			["Name"] = "Шрифт чата",
			["Desc"] = "Установить шрифт используемый в чате",
		},
		
		["TabFont"] = {
			["Name"] = "Шрифт Вкладок Чата",
			["Desc"] = "Установить шрифт используемый для названий вкладок чата",
		},
		
		["ScrollByX"] = {
			["Name"] = "Прокрутка мышью",
			["Desc"] = "Количество линий на которое прокручивается чат при использовании колеса мыши",
		},
	},
	
	["Cooldowns"] = {
		["Font"] = {
			["Name"] = "Шрифт таймеров",
			["Desc"] = "Установить шрифт используемый таймерами",
		},
	},
	
	["DataTexts"] = {
		["Battleground"] = {
			["Name"] = "Включить информацию полей боя",
			["Desc"] = "Включить статистику на полях боя",
		},
		
		["LocalTime"] = {
			["Name"] = "Местное время",
			["Desc"] = "Показывать местное время вместо серверного",
		},
		
		["Time24HrFormat"] = {
			["Name"] = "24-Часовой Формат Времени",
			["Desc"] = "Включить 24-часовой формат.",
		},
		
		["NameColor"] = {
			["Name"] = "Цвет Названий",
			["Desc"] = "Установить цвет для названий, например имен"..RestoreDefault,
		},
		
		["ValueColor"] = {
			["Name"] = "Цвет Значений",
			["Desc"] = "Установить цвет для значений, например цифр"..RestoreDefault,
		},
		
		["Font"] = {
			["Name"] = "Шрифт",
			["Desc"] = "Установить используемый шрифт",
		},
	},
	
	["Merchant"] = {
		["AutoSellGrays"] = {
			["Name"] = "Автоматически продавать серые вещи",
			["Desc"] = "Во время посещения торговца автоматически продавать вещи серого качества",
		},
		
		["SellMisc"] = {
			["Name"] = "Продавать хлам",
			["Desc"] = "Автоматически продавать бесполезные вещи не серого качетсва",
		},
		
		["AutoRepair"] = {
			["Name"] = "Автоматический ремонт",
			["Desc"] = "Во время посещения торговца, автоматически ремонтирует экипировку",
		},
		
		["UseGuildRepair"] = {
			["Name"] = "Ремонт за счет гильдии",
			["Desc"] = "Когда используется 'Автоматический ремонт', использовать деньги из банка гильдии",
		},
	},
	
	["Misc"] = {
		["ThreatBarEnable"] = {
			["Name"] = "Включить полосу угрозы",
			["Desc"] = "Отобразить полосу угрозы",
		},
		
		["AltPowerBarEnable"] = {
			["Name"] = "Включить полосу альт.энергии",
			["Desc"] = "Отображать полосу альтернативной энергии на боссах, где она используется",
		},
		
		["ExperienceEnable"] = {
			["Name"] = "Включить полосы опыта",
			["Desc"] = "Включить две полосы опыта на левом и правом чатах.",
		},
		
		["ReputationEnable"] = {
			["Name"] = "Включить полосы репутации",
			["Desc"] = "Включить две полосы репутации на левом и правом чатах.",
		},
		
		["ErrorFilterEnable"] = {
			["Name"] = "Включить фильтр ошибок",
			["Desc"] = "Фильтровать сообщения об ошибках (красный текст вверху экрана).",
		},
	},
	
	["NamePlates"] = {
		["Enable"] = {
			["Name"] = "Включить индикаторы идоровья",
			["Desc"] = "Использовать индикаторы здоровья в стиле Tukui "..PerformanceSlight,
		},
		
		["Width"] = {
			["Name"] = "Ширина",
			["Desc"] = "Установить ширину индикаторов здоровья",
		},
		
		["Height"] = {
			["Name"] = "Высота",
			["Desc"] = "Установить высоту индикаторов здоровья",
		},
		
		["CastHeight"] = {
			["Name"] = "Высота полосы заклинаний",
			["Desc"] = "Установить высоту полосы заклинаний на индикаторах здоровья",
		},
		
		["Spacing"] = {
			["Name"] = "Отступ",
			["Desc"] = "Установить расстояние между индикатором здоровья и полосой заклинаний",
		},
		
		["NonTargetAlpha"] = {
			["Name"] = "Прозначность не целей",
			["Desc"] = "Степень видимости индикаторов здоровья, не принадлижащих текущей цели",
		},
		
		["Texture"] = {
			["Name"] = "Текстура индикаторов здоровья",
			["Desc"] = "Установить текстуру для индикаторов здоровья",
		},
		
		["Font"] = {
			["Name"] = "Шрифт индикатора здоровья",
			["Desc"] = "Установить шрифт для индикаторов здоровья",
		},
		
		["HealthText"] = {
			["Name"] = "Show Health Text",
			["Desc"] = "Add a text in the nameplate which show current health",
		},
	},
	
	["Party"] = {
		["Enable"] = {
			["Name"] = "Рамки группы",
			["Desc"] = "Использовать рамки группы Tukui",
		},
		
		["Portrait"] = {
			["Name"] = "Портрет",
			["Desc"] = "Отображать портрет игрока в группе",
		},
		
		["HealBar"] = {
			["Name"] = "Входящее исцеление",
			["Desc"] = "Отображать входящее исцеления и поглощения в виде полосы",
		},
		
		["ShowPlayer"] = {
			["Name"] = "Показывать игрока",
			["Desc"] = "Показывать себя в группе",
		},
		
		["ShowHealthText"] = {
			["Name"] = "Текст здоровья",
			["Desc"] = "Показывать количество потерянного здоровья.",
		},
		
		["Font"] = {
			["Name"] = "Шрифт имен в группе",
			["Desc"] = "Установить шрифт имен на рамках группы",
		},
		
		["HealthFont"] = {
			["Name"] = "Шрифт здоровья в группе",
			["Desc"] = "Установить шрифт текста здоровья на рамках группы",
		},
		
		["PowerTexture"] = {
			["Name"] = "Текстура полосы ресурса",
			["Desc"] = "Установить текстуру полосы ресурса",
		},
		
		["HealthTexture"] = {
			["Name"] = "Текстура полосы здоровья",
			["Desc"] = "Установить текстуру полосы здоровья",
		},
		
		["RangeAlpha"] = {
			["Name"] = "Прозрачность юнитов вне радиуса",
			["Desc"] = "Установить прозрачность рамок юнитов вне досягаемости ваших заклинаний",
		},
	},
	
	["Raid"] = {
		["Enable"] = {
			["Name"] = "Рамки рейда",
			["Desc"] = "Использовать рамки рейда Tukui",
		},
		
		["ShowPets"] = {
			["Name"] = "Show Pets",
			["Desc"] = "Derp",
		},
		
		["MaxUnitPerColumn"] = {
			["Name"] = "Raid members per column",
			["Desc"] = "Change the max number of raid members per column",
		},
		
		["HealBar"] = {
			["Name"] = "Входящее исцеление",
			["Desc"] = "Отображать входящее исцеления и поглощения в виде полосы",
		},
		
		["AuraWatch"] = {
			["Name"] = "Отслеживание аур",
			["Desc"] = "Отображать таймеры для специфических заклинаний каждого класса на рамках рейда",
		},
		
		["AuraWatchTimers"] = {
			["Name"] = "Таймеры отслеживания аур",
			["Desc"] = "Отображать таймеры дебафов созданных отслеживанием дебаффов",
		},
		
		["DebuffWatch"] = {
			["Name"] = "Отслеживание дебаффов",
			["Desc"] = "Отображать большую иконку на рамках рейда когда игрок получает критический дебафф",
		},
		
		["RangeAlpha"] = {
			["Name"] = "Прозрачность юнитов вне радиуса",
			["Desc"] = "Установить прозрачность рамок юнитов вне досягаемости ваших заклинаний",
		},
		
		["ShowRessurection"] = {
			["Name"] = "Показать иконку воскрешения",
			["Desc"] = "Показывать входящее воскрешение от игроков",
		},
		
		["ShowHealthText"] = {
			["Name"] = "Текст здоровья",
			["Desc"] = "Показывать количество недостающего здоровья.",
		},
		
		["VerticalHealth"] = {
			["Name"] = "Vertical Health",
			["Desc"] = "Display health lost vertically",
		},
		
		["Font"] = {
			["Name"] = "Шрифт имен на рамках рейда",
			["Desc"] = "Установить шрифт для имен на рамках рейда",
		},
		
		["HealthFont"] = {
			["Name"] = "Шрифт здоровья рейда",
			["Desc"] = "Установить шрифт текста здоровья на рамках рейда",
		},
		
		["PowerTexture"] = {
			["Name"] = "Текстура полосы реусрса",
			["Desc"] = "Установить текстуру для полосы ресурса",
		},
		
		["HealthTexture"] = {
			["Name"] = "Текстура полосы здоровья",
			["Desc"] = "Установить текстуру для полосы здоровья",
		},
		
		["GroupBy"] = {
			["Name"] = "Группировать по",
			["Desc"] = "Определяет как будут отсоритрованы группы в рейде",
		},
	},
	
	["Tooltips"] = {
		["Enable"] = {
			["Name"] = "Включить Подсказки",
			["Desc"] = "Использовать подсказки в стиле Tukui",
		},
		
		["MouseOver"] = {
			["Name"] = "Mouseover",
			["Desc"] = "Enable mouseover tooltip",
		},
		
		["HideOnUnitFrames"] = {
			["Name"] = "Скрыть для рамок юнитов",
			["Desc"] = "Не отображать подсказки на рамках юнитов",
		},
		
		["UnitHealthText"] = {
			["Name"] = "Отображать текст здоровья",
			["Desc"] = "Отображать текст здоровья на полосе здоровья в подсказках",
		},
		
		["ShowSpec"] = {
			["Name"] = "Специализация и уровень предметов",
			["Desc"] = "Отображать специализацию игрока и уровень предметов в подсказке",
		},
		
		["HealthFont"] = {
			["Name"] = "Шрифт полосы здоровья",
			["Desc"] = "Установить шрифт используемный для текста на полосе здоровья",
		},
		
		["HealthTexture"] = {
			["Name"] = "Текстура полосы здоровья",
			["Desc"] = "Установить текстуру используемую на полосе здоровья подсказки",
		},
	},
	
	["UnitFrames"] = {
		["Enable"] = {
			["Name"] = "Включить рамки юнитов",
			["Desc"] = "Использовать рамки юнитов Tukui",
		},
		
		["TargetEnemyHostileColor"] = {
			["Name"] = "Enemy Target Hostile Color",
			["Desc"] = "Enemy target health bar will be colored by hostility instead of by class color",
		},
		
		["Portrait"] = {
			["Name"] = "Enable Player & Target Portrait",
			["Desc"] = "Enable Player & Target Portrait",
		},
		
		["CastBar"] = {
			["Name"] = "Полоса заклинаний",
			["Desc"] = "Включить полосу заклинаний на рамках юнитов",
		},
		
		["UnlinkCastBar"] = {
			["Name"] = "Отвязать полосы заклинаний",
			["Desc"] = "Выносит полосы заклинаний игрока и цели за пределы рамок юнитов и позволяет перемещать их по экрану",
		},
		
		["CastBarIcon"] = {
			["Name"] = "Иконка на полосе заклинаний",
			["Desc"] = "Создаёт иконку на полосе заклинаний",
		},
		
		["CastBarLatency"] = {
			["Name"] = "Задержка",
			["Desc"] = "Отображает задержку на полосе заклинаний",
		},
		
		["Smooth"] = {
			["Name"] = "Плавное здоровь",
			["Desc"] = "Плавное изменение полосы здоровья"..PerformanceSlight,
		},
		
		["CombatLog"] = {
			["Name"] = "Статус боя",
			["Desc"] = "Отображает входящие исцеление и урон на рамке игрока",
		},
		
		["WeakBar"] = {
			["Name"] = "Полоса Ослабленной Души",
			["Desc"] = "Отображает полосу статуса для отображения дебаффа Ослабленной Души",
		},
		
		["HealBar"] = {
			["Name"] = "Входящее исцеление",
			["Desc"] = "Отображает входящее исцеления и поглощения в виде полосы",
		},
		
		["TotemBar"] = {
			["Name"] = "Панель тотемов",
			["Desc"] = "Создаёт панель тотемов в стиле tukui",
		},
		
		["ComboBar"] = {
			["Name"] = "Combo Points",
			["Desc"] = "Enable the combo points bar",
		},
		
		["AnticipationBar"] = {
			["Name"] = "Пполоса Предчувствия для разбойников",
			["Desc"] = "Отображает панель Предчувствия разбойника с дополнительными комбо-поинтами",
		},
		
		["SerendipityBar"] = {
			["Name"] = "Панель Прозорливости",
			["Desc"] = "Отображает панель со стаками Прозорливости",
		},
		
		["OnlySelfDebuffs"] = {
			["Name"] = "Показывать только мои дебаффы",
			["Desc"] = "Отображать на рамке цели только дебаффы, налоденные вами",
		},
		
		["DarkTheme"] = {
			["Name"] = "Тёмное оформление",
			["Desc"] = "Если включено, рамки юнитов окрасятся в тёмный цвет, а полоса ресурса в цвет класса",
		},
		
		["Threat"] = {
			["Name"] = "Enable threat display",
			["Desc"] = "Health Bar on party and raid members will turn if they have aggro",
		},
		
		["Arena"] = {
			["Name"] = "Arena Frames",
			["Desc"] = "Display arena opponents when inside a battleground or arena",
		},
		
		["Boss"] = {
			["Name"] = "Boss Frames",
			["Desc"] = "Display boss frames while doing pve",
		},
		
		["TargetAuras"] = {
			["Name"] = "Target Auras",
			["Desc"] = "Display buffs and debuffs on target",
		},
		
		["FocusAuras"] = {
			["Name"] = "Focus Auras",
			["Desc"] = "Display buffs and debuffs on focus",
		},
		
		["FocusTargetAuras"] = {
			["Name"] = "Focus Target Auras",
			["Desc"] = "Display buffs and debuffs on focus target",
		},
		
		["ArenaAuras"] = {
			["Name"] = "Arena Frames Auras",
			["Desc"] = "Display debuffs on arena frames",
		},
		
		["BossAuras"] = {
			["Name"] = "Boss Frames Auras",
			["Desc"] = "Display debuffs on boss frames",
		},
		
		["Font"] = {
			["Name"] = "Шрифт рамок юнитов",
			["Desc"] = "Установить шрифт рамок юнитов",
		},
		
		["PowerTexture"] = {
			["Name"] = "Текстура полосы ресурса",
			["Desc"] = "Установить текстуру для полосы ресурса",
		},
		
		["HealthTexture"] = {
			["Name"] = "Текстура плосы здоровтья",
			["Desc"] = "Установить текстуру для плосы здоровтья",
		},
		
		["CastTexture"] = {
			["Name"] = "Cast Bar Texture",
			["Desc"] = "Set a texture for cast bars",
		},
	},
}