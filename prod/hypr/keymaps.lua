local terminal = "kitty"
local lock = "hyprlock"
local fileManager = "dolphin"
local menu = "rofi -show run"
local browser = "firefox"
local quitHyprLand = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
local quickshellToggle = "pkill quickshell || quickshell &"

hl.bind(MainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(MainMod .. " + O", hl.dsp.exec_cmd(lock))
hl.bind(MainMod .. " + C", hl.dsp.window.close())
hl.bind(MainMod .. " + M", hl.dsp.exec_cmd(quitHyprLand))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(MainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(MainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(MainMod .. " + SHIFT + B", hl.dsp.exec_cmd(quickshellToggle))

hl.bind(MainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(MainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(MainMod .. " + K", hl.dsp.window.cycle_next({ next = false }))
hl.bind(MainMod .. " + L", hl.dsp.window.cycle_next())

hl.bind(MainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(MainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
