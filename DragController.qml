import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0

ObjectPicker {
    id: picker

    property bool hovering: false
    property bool dragging: false
    property real sensitivity: 0.025
    property var getValueCallback // set this to function() { ... }
    property var setValueCallback // set this to function(x) { ... }
    property real dragStart
    property real valueStart
    property var cameraController

    MouseDevice {
        id: mouseDev
    }

    MouseHandler {
        id: mouseHandler
        sourceDevice: mouseDev
        onPressed: {
            dragStart = mouse.y
            valueStart = getValueCallback()
        }
        onPositionChanged: {
            if(dragging) setValueCallback(valueStart + sensitivity * (mouse.y - dragStart))
        }
    }

    hoverEnabled: true

    onEntered: {
        if(!setValueCallback) return
        hovering = true
    }

    onExited: {
        if(!setValueCallback) return
        hovering = false
    }

    onPressed: {
        if(!setValueCallback) return
        dragging = true
        if(cameraController)
            cameraController.setEnabled(false)
    }

    onReleased: {
        if(!setValueCallback) return
        dragging = false
        if(cameraController)
            cameraController.setEnabled(true)
    }
}
