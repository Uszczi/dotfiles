import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects
import "../utils" as Utils
import "root:/"

RowLayout {
    property HyprlandMonitor monitor: Hyprland.monitorFor(screen)

    Rectangle {
        id: workspaceBar
        Layout.preferredWidth: Math.max(50, Utils.HyprlandUtils.activeWorkspaces.length * 25)
        Layout.preferredHeight: 23
        radius: 7
        color: Theme.get.barBgColor

        Row {
            anchors.centerIn: parent
            spacing: 15

            Repeater {
                model: Utils.HyprlandUtils.activeWorkspaces

                Item {
                    required property var modelData
                    property int workspaceId: modelData.id
                    property bool focused: Hyprland.focusedMonitor?.activeWorkspace?.id === workspaceId

                    width: workspaceText.width
                    height: workspaceText.height

                    Text {
                        id: workspaceText
                        text: workspaceId.toString()
                        color: "white"
                        font.pixelSize: 15
                        font.bold: focused
                    }

                    Rectangle {
                        visible: focused
                        anchors {
                            left: workspaceText.left
                            right: workspaceText.right
                            top: workspaceText.bottom
                            topMargin: -3
                        }
                        height: 2
                        color: "white"
                    }

                    DropShadow {
                        visible: focused
                        anchors.fill: workspaceText
                        horizontalOffset: 2
                        verticalOffset: 2
                        radius: 8.0
                        samples: 20
                        color: "#000000"
                        source: workspaceText
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: Utils.HyprlandUtils.switchWorkspace(workspaceId)
                    }
                }
            }
        }
    }
}
