local L = BigWigs:NewBossLocale("Kargath Bladefist", "deDE")
if not L then return end
if L then
	L.blade_dance_bar = "Tanzen"
end

L = BigWigs:NewBossLocale("The Butcher", "deDE")
if L then
	--L.adds_multiple = "Adds x%d"
end

L = BigWigs:NewBossLocale("Tectus", "deDE")
if L then
	--L.earthwarper_trigger1 = "Yjj'rmr" -- Yjj'rmr... Xzzolos...
	L.earthwarper_trigger2 = "Ja, Tectus" -- Yes, Tectus. Bend to... our master's... will....
	L.earthwarper_trigger3 = "Ihr versteht nicht!" -- You do not understand! This one must not....
	L.berserker_trigger1 = "MEISTER!" -- MASTER! I COME FOR YOU!
	--L.berserker_trigger2 = "Kral'ach" --Kral'ach.... The darkness speaks.... A VOICE!
	--L.berserker_trigger3 = "Graaagh!" --Graaagh! KAHL...  AHK... RAAHHHH!

	--L.tectus = "Tectus"
	L.shard = "Splitter"
	L.motes = "Partikel"

	L.custom_off_barrage_marker = "Kristallbeschuss markieren"
	L.custom_off_barrage_marker_desc = "Markiert die Ziele von Kristallbeschuss mit {rt1}{rt2}{rt3}{rt4}{rt5}, ben�tigt Leiter oder Assistent."

	L.adds_desc = "Timer f�r das Erscheinen von Adds."
end

L = BigWigs:NewBossLocale("Brackenspore", "deDE")
if L then
	L.creeping_moss_boss_heal = "Moos unter dem BOSS (Heilung)"
	L.creeping_moss_add_heal = "Moos unter GROSSEM ADD (Heilung)"
end

L = BigWigs:NewBossLocale("Twin Ogron", "deDE")
if L then
	L.custom_off_volatility_marker = "Arkane Fl�chtigkeit markieren"
	L.custom_off_volatility_marker_desc = "Markiert die Ziele von Arkane Fl�chtigkeit mit {rt1}{rt2}{rt3}{rt4}, ben�tigt Leiter oder Assistent."
end

L = BigWigs:NewBossLocale("Ko'ragh", "deDE")
if L then
	L.suppression_field_trigger1 = "Ruhe!"
	L.suppression_field_trigger2 = "Ich rei�e Euch in St�cke!"
	L.suppression_field_trigger3 = "Ich werde Euch zermalmen!"
	L.suppression_field_trigger4 = "Schweigt!"

	L.fire_bar = "Alle explodieren!"

	L.custom_off_fel_marker = "Magie aussto�en: Teufelsenergie markieren"
	L.custom_off_fel_marker_desc = "Markiert die Ziele von Magie aussto�en: Teufelsenergie mit {rt1}{rt2}{rt3}, ben�tigt Leiter oder Assistent.\n|cFFFF0000Um Konflikte beim Markieren zu vermeiden, sollte lediglich 1 Person im Raid diese Option aktivieren.|r"
end

L = BigWigs:NewBossLocale("Imperator Mar'gok", "deDE")
if L then
	L.custom_off_fixate_marker = "Fixieren markieren"
	L.custom_off_fixate_marker_desc = "Markiert die Ziele von Fixieren mit {rt1}{rt2}, ben�tigt Leiter oder Assistent.\n|cFFFF0000Um Konflikte beim Markieren zu vermeiden, sollte lediglich 1 Person im Raid diese Option aktivieren.|r"
end

