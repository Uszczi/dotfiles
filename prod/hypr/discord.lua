hl.bind(MainMod .. " + D", hl.dsp.focus({ workspace = 9 }))
hl.bind(MainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = 9 }))

hl.window_rule({
	name = "discord-to-workspace",
	match = { class = "discord" },
	workspace = 9,
})
