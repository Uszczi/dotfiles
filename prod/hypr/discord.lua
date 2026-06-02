local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:discord" }))

hl.window_rule({
	name = "discord-to-special",
	match = { class = "discord" },
	workspace = "special:discord",
})
