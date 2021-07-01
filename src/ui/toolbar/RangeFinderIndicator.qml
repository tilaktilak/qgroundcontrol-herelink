/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick          2.11
import QtQuick.Layouts  1.11

import QGroundControl                       1.0
import QGroundControl.Controls              1.0
import QGroundControl.MultiVehicleManager   1.0
import QGroundControl.ScreenTools           1.0
import QGroundControl.Palette               1.0
import MAVLink								1.0


Item {
    id:             _root
    width:          height
    anchors.top:    parent.top
    anchors.bottom: parent.bottom

    property bool showIndicator: true
    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    QGCColoredImage {
        anchors.fill:       parent
        source:             "/qmlimages/rangefinder.svg"
        sourceSize.height:  height
        fillMode:           Image.PreserveAspectFit
        color:              (_activeVehicle.sensorsEnabledBits&0x100)?'green':'red'
        visible:            true

    }

    QGCLabel {
        text:                   getBatteryPercentageText()
        font.pointSize:         ScreenTools.mediumFontPointSize
        color:                  qgcPal.colorRed()
        anchors.verticalCenter: parent.verticalCenter
    }

}
