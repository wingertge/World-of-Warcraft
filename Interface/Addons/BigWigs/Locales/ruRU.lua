local L = LibStub("AceLocale-3.0"):NewLocale("Big Wigs", "ruRU")
if not L then return end

-- These localization strings are translated on WoWAce: http://www.wowace.com/addons/big-wigs/localization/
L["about"] = "О Big Wigs"
L["activeBossModules"] = "Активные модули боссов:"
L["advanced"] = "Дополнительные настройки"
L["allRightsReserved"] = "Все права сохранены"
L["alphaOutdated"] = "Ваша альфа-версия Big Wigs устарела (/bwv)."
L["alphaRelease"] = "Вы используете АЛЬФА-ВЕРСИЮ Big Wigs %s (ревизия %d)"
L["already_registered"] = "|cffff0000ВНИМАНИЕ:|r |cff00ff00%s|r (|cffffff00%s|r) уже загружен как модуль Big Wigs, но что-то пытается зарегистрировать его ещё раз. Обычно, это означает, что у вас две копии этого модуля в папке с модификациями (возможно, из-за ошибки программы для обновления модификаций). Мы рекомендуем вам удалить все папки Big Wigs и установить его с нуля."
L["altpower"] = "Отображение альтернативной энергии"
L["ALTPOWER"] = "Отображение альтернативной энергии"
L["altpower_desc"] = "Показывать окно с альтернативной энергией, в котором выводится информация о значениях этой энергии для каждого игрока вашего рейда."
L["ALTPOWER_desc"] = "Некоторые битвы используют механику альтернативной энергии. Отображение альтернативной энергии позволяет увидеть минимальные и максимальные значения энергии, что может пригодится для определенных видов тактик."
L["back"] = "<< Назад"
L["BAR"] = "Полосы"
L["BAR_desc"] = "Полосы отображаются для некоторых способностей, если это необходимо. Если способность сопровождается полоской, которую вы хотите скрыть, отключите эту опцию"
L["berserk"] = "Берсерк"
L["berserk_desc"] = "Предупреждать и отсчитывать время до берсерка."
L["best"] = "Лучшее:"
L["blizzRestrictionsConfig"] = "В связи с ограничениями Blizzard, настройка должна открываться вне боя, прежде чем будет применена."
L["blizzRestrictionsZone"] = "Подождите окончания боя для завершения загрузки, в связи с боевыми ограничениями Blizzard."
L["blockMovies"] = "Блокировать видеоролики"
L["blockMoviesDesc"] = "После того, как вы увидели ролик один раз, Big Wigs не позволит ему играть снова."
L["bosskill"] = "Смерть босса"
L["bosskill_desc"] = "Объявлять о смерти босса."
L["chatMessages"] = "Сообщения в чат"
L["chatMessagesDesc"] = "Выводить все сообщения BigWigs в стандартное окно чата в дополнение к настройкам отображения."
L["colors"] = "Цвета"
L["configure"] = "Настройка"
L["configureBtnDesc"] = [=[Закрывает окно настроек интерфейса и позволяет настроить отображение таких вещей, как полосы и сообщения.

Если вы хотите настроить больше вещей, разверните Big Wigs слева, и найдите подраздел 'Оформление ...'.]=]
L["configureBtnName"] = "Перемещение и настройка элементов..."
L["contact"] = "Связь"
L["coreAddonDisabled"] = "Big Wigs не будет работать правильно, пока аддон %s выключен. Вы можете включить его из панели управления модификациями в окне выбора персонажа."
L["customizeBtn"] = "Оформление ..."
L["dbmFaker"] = "Маскировка под DBM"
L["dbmFakerDesc"] = "Если пользователь DBM делает проверку версий, чтобы увидеть у кого стоит аддон, он обнаружит вас в этом списке. Полезно для гильдий, которые заставляют использовать DBM."
L["dbmUsers"] = "Пользователи DBM:"
L["defeated"] = "%s терпит поражение"
L["developers"] = "Разработчики"
L["DISPEL"] = "Только для рассеивателей"
L["DISPEL_desc"] = "Если вы хотите видеть предупреждения для способности, которую не можете рассеять, отключите опцию."
L["dispeller"] = "|cFFFF0000Только для рассеивателей.|r "
L["EMPHASIZE"] = "Увеличение"
L["EMPHASIZE_desc"] = "Включив это, будет СУПЕР УВЕЛИЧЕНИЕ любого сообщения или полосы, связанных со способностью босса. Сообщения будет больше, полосы будут мигать и иметь различные цвета, будут использоваться звуки для отсчета времени надвигающейся способности. В общем, вы сами всё увидите."
L["extremelyOutdated"] = "|cffff0000WARNING:|r Ваш Big Wigs устарел более чем на 120 ревизий!! Ваша версия может содержать ошибки, отсутствующие возможности, или вообще неправильные таймеры. НАСТОЯТЕЛЬНО рекомендуется обновить."
L["finishedLoading"] = "Бой окончен, Big Wigs окончательно загружен."
L["FLASH"] = "Мигание"
L["FLASH_desc"] = "Некоторые способности могут быть более важными, чем другие. Если вы хотите, чтобы ваш экран мигал, при использовании таких способностей, отметьте эту опцию."
L["flashScreen"] = "Мигание экрана"
L["flashScreenDesc"] = "Некоторые способности настолько важны, что требуют особого внимания. Когда вы попадаете под эффект таких способностей, Big Wigs производит мигание экрана."
L["flex"] = "Гибкий"
L["healer"] = "|cFFFF0000Только для лекарей.|r "
L["HEALER"] = "Только лекари"
L["HEALER_desc"] = "Некоторые способности важны только для лекарей. Если вы хотите видеть предупреждения для таких способностей, несмотря на вашу роль, отключите эту опцию."
L["heroic"] = "Героический"
L["heroic10"] = "10гер."
L["heroic25"] = "25гер."
L["ICON"] = "Иконка"
L["ICON_desc"] = "Big Wigs может отмечать пострадавших от способностей иконкой. Это способствует их легкому обнаружению."
L["introduction"] = "Добро пожаловать в Big Wigs, где бродят боссы. Пожалуйста, пристегните ремни безопасности, запаситесь печеньками и наслаждайтесь поездкой. Он не будет есть ваших детей, зато поможет вам подготовиться к встречи с новыми боссами, словно обед из 7-ми блюд для вашего рейда."
L["ircChannel"] = "irc.freenode.net на канале #bigwigs"
L["kills"] = "Побед:"
L["lfr"] = "LFR"
L["license"] = "Лицензия"
L["listAbilities"] = "Вывести способности в групповой чат"
L["ME_ONLY"] = "Только, когда на мне"
L["ME_ONLY_desc"] = "Когда вы включите данную опцию, сообщения для способности будут показываться, только если затрагивают вас. Например, 'Бомба: Игрок' будет показываться только, когда на вас."
L["MESSAGE"] = "Сообщения"
L["MESSAGE_desc"] = "Большинство способностей сопровождаются одним или несколькими сообщениями, которые Big Wigs будет отображать на экране. Если вы отключите эту опцию, существующие сообщения не будут отображаться."
L["minimapIcon"] = "Иконка у миникарты"
L["minimapToggle"] = "Показать/скрыть иконку у миникарты."
L["missingAddOn"] = "Обратите внимание, что эта зона требует дополнение [|cFF436EEE%s|r] для показа таймеров."
L["modulesDisabled"] = "Все запущенные модули были отключены."
L["modulesReset"] = "Все запущенные модули сброшены."
L["movieBlocked"] = "Вы видели этот ролик, пропускаем его."
L["mythic"] = "Эпохальный"
L["newReleaseAvailable"] = "Доступна новая версия Big Wigs (/bwv). Чтобы загрузить её, зайдите на сайт curse.com, wowinterface.com, wowace.com или воспользуйтесь Curse Updater."
L["noBossMod"] = "Нет аддона:"
L["norm10"] = "10"
L["norm25"] = "25"
L["normal"] = "Обычный"
L["officialRelease"] = "Вы используете официальную версию Big Wigs %s (ревизия %d)"
L["oldVersionsInGroup"] = "В вашей группе есть игроки с устаревшими версиями или без Big Wigs. Для получения более подробной информации введите команду /bwv."
L["outOfDate"] = "Устарело:"
L["profiles"] = "Профили"
L["PROXIMITY"] = "Отображение близости"
L["PROXIMITY_desc"] = "Иногда способности требуют от вас рассредоточиться. Отображение близости будет специально показываться для таких способностей, так что вы сможете понять с одного взгляда, в безопасности вы или нет."
L["PULSE"] = "Импульс"
L["PULSE_desc"] = "В дополнение к мигающему экрану, вы также получите иконку, связанную с конкретной способностью, в центре экрана, для привлечения внимания."
L["raidIcons"] = "Метки рейда"
L["raidIconsDesc"] = [=[Некоторые скрипты событий используют метки рейда, чтобы помечать игроков, которые оказывают особое влияние на вашу группу. Например, такой тип эффектов как 'бомба' и контроль разума.

|cffff4411Применимо, если вы Лидер рейда или помощник!|r]=]
L["removeAddon"] = "Пожалуйста, удалите '|cFF436EEE%s|r', ему на смену пришло '|cFF436EEE%s|r'."
L["resetPositions"] = "Сброс позиции"
L["SAY"] = "Сказать"
L["SAY_desc"] = "Сообщения над головами персонажей легко обнаружить. Big Wigs будет использовать канал 'cказать' для оповещения персонажей поблизости, если на вас враждебный эффект."
L["selectEncounter"] = "Выберите схватку"
L["severelyOutdated"] = "|cffff0000Ваш Big Wigs устарел более чем на 300 ревизий! Мы НАСТОЯТЕЛЬНО рекомендуем вам обновиться, чтобы предотвратить проблемы синхронизации с другими игроками!|r"
L["showBlizzWarnings"] = "Оповещения Blizzard"
L["showBlizzWarningsDesc"] = [=[Blizzard иногда предоставляет свои сообщения для некоторых способностей. По нашему мнению, эти сообщения слишком подробные и длинные. Мы пытаемся предоставить краткие, более уместные сообщения, которые не мешают игровому процессу и не говорят, что конкретно вам делать.

|cffff4411Когда отключено, сообщения Blizzard не будут показываться по центру экрана, но всё ещё будут отображаться в чате.|r]=]
L["slashDescBreak"] = "|cFFFED000/break:|r Отправляет таймер перерыва в рейд."
L["slashDescConfig"] = "|cFFFED000/bw:|r Открывает настройки Big Wigs."
L["slashDescLocalBar"] = "|cFFFED000/localbar:|r Создает таймер, который видите только вы."
L["slashDescPull"] = "|cFFFED000/pull:|r Отправляет отсчет атаки в рейд."
L["slashDescRaidBar"] = "|cFFFED000/raidbar:|r Отправляет свою полосу в рейд."
L["slashDescRange"] = "|cFFFED000/range:|r Открывает индикатор близости."
L["slashDescTitle"] = "|cFFFED000Быстрые команды:|r"
L["slashDescVersion"] = "|cFFFED000/bwv:|r Выполняет проверку версий Big Wigs."
L["sound"] = "Звук"
L["soundDesc"] = [=[Сообщения могут сопровождаться звуком. Некоторым людям проще услышать звук и опознать к какому сообщению он относится, нежели читать сообщения.

|cffff4411Даже когда отключено, стандартный звук объявления рейду будет сопровождать входящие объявления от других игроков. Этот звук отличается от используемых здесь.|r]=]
L["sourceCheckout"] = "Вы используете отладочный Big Wigs %s прямо из репозитория."
L["stages"] = "Фазы"
L["stages_desc"] = "Включение различных функций, связанных с этапами/фазами босса: радар, полосы и прочее"
L["statistics"] = "Статистика"
L["tank"] = "|cFFFF0000Только для танков.|r "
L["TANK"] = "Только танки"
L["TANK_desc"] = "Некоторые способности важны только для танков. Если вы хотите видеть предупреждения для таких способностей, несмотря на вашу роль, отключите эту опцию."
L["tankhealer"] = "|cFFFF0000Только для танков и лекарей.|r "
L["TANK_HEALER"] = "Только танки и лекари"
L["TANK_HEALER_desc"] = "Некоторые способности важны только для танков и лекарей. Если вы хотите видеть предупреждения для таких способностей, несмотря на вашу роль, отключите эту опцию."
L["test"] = "Тест"
L["thanks"] = "Благодарим следующих лиц за их помощь в различных областях разработки"
L["tooltipHint"] = [=[|cffeda55fЩёлкните|r, чтобы сбросить все запущенные модули.
|cffeda55fAlt+Левый клик|r - чтобы отключить их.
|cffeda55fПравый клик|r открыть настройки.]=]
L["upToDate"] = "Текущий:"
L["warmup"] = "Подготовка"
L["warmup_desc"] = "Время, когда начнется схватка с боссом."
L["website"] = "Сайт"
L["wipes"] = "Поражений:"
L["zoneMessages"] = "Показывать сообщения для игровой зоны"
L["zoneMessagesDesc"] = "Отключив, вы перестанете получать сообщения при входе в зону, для которой нет таймеров Big Wigs. Мы рекомендуем оставить включенной, чтобы в случае создания таймеров для новой зоны, вы могли сразу узнать об этом."

