import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Input 2.0

Entity {
    id: translationGizmoRoot
    property real beamRadius: 0.05
    property real beamLength: 1
    property real tipRadius: 0.15
    property real tipLength: 0.3
    property int slices: 10
    property color colorX: "red"
    property color colorY: "green"
    property color colorZ: "blue"
    property Transform transform: Transform {}

    property var cameraController
    property Transform targetTransform
    property real sensitivity: 0.025

    Entity {
        id: origin
        components: [SphereMesh { radius: beamRadius * 1.25 }, PhongMaterial { ambient: "black" }]
    }

    Arrow {
        id: arrowX
        beamRadius: parent.beamRadius
        beamLength: parent.beamLength
        tipRadius: parent.tipRadius
        tipLength: parent.tipLength
        slices: parent.slices
        color: colorX
        transform: Transform { rotationZ: -90 }
        dragController: DragController {
            function updateColor() {
                arrowX.color = dragging ? Qt.lighter(colorX, 1.5) : hovering ? Qt.lighter(colorX, 1.25) : colorX
            }
            onHoveringChanged: updateColor()
            onDraggingChanged: updateColor()
            cameraController: translationGizmoRoot.cameraController
            getValueCallback: targetTransform ? function() {return targetTransform.translation.x} : false
            setValueCallback: targetTransform ? function(v) {targetTransform.translation.x = v} : false
            sensitivity: translationGizmoRoot.sensitivity
        }
    }

    Arrow {
        id: arrowY
        beamRadius: parent.beamRadius
        beamLength: parent.beamLength
        tipRadius: parent.tipRadius
        tipLength: parent.tipLength
        slices: parent.slices
        color: colorY
        dragController: DragController {
            function updateColor() {
                arrowY.color = dragging ? Qt.lighter(colorY, 1.5) : hovering ? Qt.lighter(colorY, 1.25) : colorY
            }
            onHoveringChanged: updateColor()
            onDraggingChanged: updateColor()
            cameraController: translationGizmoRoot.cameraController
            getValueCallback: targetTransform ? function() {return targetTransform.translation.y} : false
            setValueCallback: targetTransform ? function(v) {targetTransform.translation.y = v} : false
            sensitivity: translationGizmoRoot.sensitivity
        }
    }

    Arrow {
        id: arrowZ
        beamRadius: parent.beamRadius
        beamLength: parent.beamLength
        tipRadius: parent.tipRadius
        tipLength: parent.tipLength
        slices: parent.slices
        color: colorZ
        transform: Transform { rotationX: 90 }
        dragController: DragController {
            function updateColor() {
                arrowZ.color = dragging ? Qt.lighter(colorZ, 1.5) : hovering ? Qt.lighter(colorZ, 1.25) : colorZ
            }
            onHoveringChanged: updateColor()
            onDraggingChanged: updateColor()
            cameraController: translationGizmoRoot.cameraController
            getValueCallback: targetTransform ? function() {return targetTransform.translation.z} : false
            setValueCallback: targetTransform ? function(v) {targetTransform.translation.z = v} : false
            sensitivity: translationGizmoRoot.sensitivity
        }
    }

    components: [transform]
}
