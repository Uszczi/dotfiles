hl.bind(MainMod .. " + D", hl.dsp.workspace.toggle_special("discord"))
hl.bind(MainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:discord" }))

hl.window_rule({
	name = "discord-to-special",
	match = { class = "discord" },
	workspace = "special:discord",
})
