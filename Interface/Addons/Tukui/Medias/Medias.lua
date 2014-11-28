local T, C = unpack(select(2, ...))

C["Medias"] = {
	-- Fonts (ENGLISH)
	["Font"] = [=[Interface\Addons\Tukui\Medias\Fonts\normal_font.ttf]=],
	["AltFont"] = [[Interface\AddOns\Tukui\Medias\Fonts\uf_font.ttf]],
	["DamageFont"] = [[Interface\AddOns\Tukui\Medias\Fonts\combat_font.ttf]],
	["PixelFont"] = [=[Interface\Addons\Tukui\Medias\Fonts\pixel_font.ttf]=],
	["ActionBarFont"] = [=[Interface\Addons\Tukui\Medias\Fonts\actionbar_font.ttf]=],
	
	-- Textures
	["Normal"] = [[Interface\AddOns\Tukui\Medias\Textures\normTex]],
	["Glow"] = [[Interface\AddOns\Tukui\Medias\Textures\glowTex]],
	["Bubble"] = [[Interface\AddOns\Tukui\Medias\Textures\bubbleTex]],
	["Copy"] = [[Interface\AddOns\Tukui\Medias\Textures\copy]],
	["Blank"] = [[Interface\AddOns\Tukui\Medias\Textures\blank]],
	["HoverButton"] = [[Interface\AddOns\Tukui\Medias\Textures\button_hover]],
	["Logo"] = [[Interface\AddOns\Tukui\Medias\Textures\logo]],
	
	-- colors
	["BorderColor"] = C.General.BorderColor or { .5, .5, .5 },
	["BackdropColor"] = C.General.BackdropColor or { .1,.1,.1 },
	
	-- sound
	["Whisper"] = [[Interface\AddOns\Tukui\Medias\Sounds\whisper.mp3]],
	["Warning"] = [[Interface\AddOns\Tukui\Medias\Sounds\warning.mp3]],
}