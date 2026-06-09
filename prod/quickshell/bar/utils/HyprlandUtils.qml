pragma Singleton

import Quickshell
import Quickshell.Hyprland
import QtQuick

Singleton {
    id: hyprland

    property list<HyprlandWorkspace> workspaces: sortWorkspaces(Hyprland.workspaces.values)
    property list<HyprlandWorkspace> activeWorkspaces: filterActiveWorkspaces()
    property int maxWorkspace: findMaxId()

    function sortWorkspaces(ws) {
        return [...ws].sort((a, b) => a?.id - b?.id);
    }

    function filterActiveWorkspaces() {
        let focusedId = Hyprland.focusedMonitor?.activeWorkspace?.id;

        let filtered = hyprland.workspaces.filter(ws => {
            if (ws.id === focusedId) return true;

            if (ws.toplevels && ws.toplevels.values.length > 0) return true;

            if (ws.id === 1) return true;

            return false;
        });

        if (filtered.length === 0 && hyprland.workspaces.length > 0) {
            return [hyprland.workspaces[0]];
        }

        return filtered;
    }

    function switchWorkspace(w: int): void {
        Hyprland.dispatch(`workspace ${w}`);
    }

    function findMaxId(): int {
        if (hyprland.workspaces.length === 0) {
            console.log("No workspaces found, defaulting to 1");
            return 1; // Return 1 if no workspaces exist
        }
        let num = hyprland.workspaces.length;
        let maxId = hyprland.workspaces[num - 1]?.id || 1;
        console.log("Current max workspace ID:", maxId);
        return maxId;
    }

    // Recompute deferred so Quickshell's Hyprland model (focusedMonitor,
    // activeWorkspace, toplevels) is fully updated before we read it.
    function scheduleUpdate(rebuildList: bool): void {
        Qt.callLater(() => {
            if (rebuildList) {
                hyprland.workspaces = hyprland.sortWorkspaces(Hyprland.workspaces.values);
                hyprland.maxWorkspace = hyprland.findMaxId();
            }
            hyprland.activeWorkspaces = hyprland.filterActiveWorkspaces();
        });
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            let eventName = event.name;
            console.log("Hyprland event received:", eventName);

            switch (eventName) {
            case "createworkspacev2":
            case "destroyworkspacev2":
                console.log("Workspace created/destroyed, updating workspace list");
                hyprland.scheduleUpdate(true);
                break;
            case "workspacev2":
            case "moveworkspacev2":
            case "focusedmonv2":
            case "activespecialv2":
            case "openwindow":
            case "closewindow":
            case "movewindow":
                console.log("Focus/window event, updating active workspaces");
                hyprland.scheduleUpdate(false);
                break;
            }
        }
    }
}
