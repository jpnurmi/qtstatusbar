/*
 * Copyright (c) 2016 J-P Nurmi
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
*/

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import StatusBar 0.1

ApplicationWindow {
    id: window
    width: 360
    height: 360
    visible: true

    header: ToolBar {
        id: toolBar
        Material.primary: colorBox.currentIndex
        Label {
            anchors.centerIn: parent
            text: colorBox.currentText
        }
    }

    Material.theme: themeBox.currentIndex

    StatusBar {
        theme: themeBox.currentIndex
        color: Material.color(colorBox.currentIndex, Material.Shade700)
    }

    Column {
        spacing: 20
        anchors.centerIn: parent

        ComboBox {
            id: colorBox

            displayText: "Color"
            currentIndex: Material.Indigo
            popup.width: 160

            model: ListModel {
                ListElement { name: "Red" }
                ListElement { name: "Pink" }
                ListElement { name: "Purple" }
                ListElement { name: "DeepPurple" }
                ListElement { name: "Indigo" }
                ListElement { name: "Blue" }
                ListElement { name: "LightBlue" }
                ListElement { name: "Cyan" }
                ListElement { name: "Teal" }
                ListElement { name: "Green" }
                ListElement { name: "LightGreen" }
                ListElement { name: "Lime" }
                ListElement { name: "Yellow" }
                ListElement { name: "Amber" }
                ListElement { name: "Orange" }
                ListElement { name: "DeepOrange" }
                ListElement { name: "Brown" }
                ListElement { name: "Grey" }
                ListElement { name: "BlueGrey" }
            }

            delegate: ItemDelegate {
                id: colorDelegate
                text: modelData
                width: colorBox.popup.width
                Rectangle {
                    z: -1
                    anchors.fill: parent
                    parent: colorDelegate.background
                    color: Material.color(index)
                }
            }
        }

        ComboBox {
            id: themeBox

            displayText: "Theme"
            currentIndex: Material.Dark

            model: ListModel {
                ListElement { name: "Light" }
                ListElement { name: "Dark" }
            }

            delegate: ItemDelegate {
                id: themeDelegate
                text: modelData
                width: themeBox.popup.width
            }
        }
    }

    footer: Pane {
        Label {
            width: parent.width
            font.bold: true
            font.pixelSize: 18
            minimumPixelSize: 6
            fontSizeMode: Label.Fit
            visible: !StatusBar.available
            horizontalAlignment: Qt.AlignHCenter
            text: "Android 5.0 Lollipop (API level 21) or later is required."
            color: Material.color(Material.Red)
        }
    }
}
