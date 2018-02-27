import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Input 2.0

Entity {
    id: rotationGizmoRoot
    property real beamRadius: 0.05
    property real beamLength: 1
    //property real tipRadius: 0.15
    //property real tipLength: 0.3
    property int slices: 10
    property int rings: 20
    property color colorX: "red"
    property color colorY: "green"
    property color colorZ: "blue"
    property Transform transform: Transform {}

    property var cameraController
    property Transform targetTransform
    property real sensitivity: 0.25

    Entity {
        id: origin
        components: [SphereMesh { radius: beamRadius * 1.25 }, PhongMaterial { ambient: "black" }]
    }

    Entity {
        components: [
            TorusMesh {
                radius: rotationGizmoRoot.beamLength
                minorRadius: rotationGizmoRoot.beamRadius
                slices: rotationGizmoRoot.slices
                rings: rotationGizmoRoot.rings
            },
            PhongMaterial {
                id: matX
                ambient: colorX
            },
            Transform {
                rotationY: 90
            },
            DragController {
                function updateColor() {
                    matX.ambient = dragging ? Qt.lighter(colorX, 1.5) : hovering ? Qt.lighter(colorX, 1.25) : colorX
                }
                onHoveringChanged: updateColor()
                onDraggingChanged: updateColor()
                cameraController: rotationGizmoRoot.cameraController
                getValueCallback: targetTransform ? function() {return targetTransform.rotationX} : false
                setValueCallback: targetTransform ? function(v) {targetTransform.rotationX = v} : false
                sensitivity: rotationGizmoRoot.sensitivity
            }
        ]
    }

    Entity {
        components: [
            TorusMesh {
                radius: rotationGizmoRoot.beamLength
                minorRadius: rotationGizmoRoot.beamRadius
                slices: rotationGizmoRoot.slices
                rings: rotationGizmoRoot.rings
            },
            PhongMaterial {
                id: matY
                ambient: colorY
            },
            Transform {
                rotationX: 90
            },
            DragController {
                function updateColor() {
                    matY.ambient = dragging ? Qt.lighter(colorY, 1.5) : hovering ? Qt.lighter(colorY, 1.25) : colorY
                }
                onHoveringChanged: updateColor()
                onDraggingChanged: updateColor()
                cameraController: rotationGizmoRoot.cameraController
                getValueCallback: targetTransform ? function() {return targetTransform.rotationY} : false
                setValueCallback: targetTransform ? function(v) {targetTransform.rotationY = v} : false
                sensitivity: rotationGizmoRoot.sensitivity
            }
        ]
    }

    Entity {
        components: [
            TorusMesh {
                radius: rotationGizmoRoot.beamLength
                minorRadius: rotationGizmoRoot.beamRadius
                slices: rotationGizmoRoot.slices
                rings: rotationGizmoRoot.rings
            },
            PhongMaterial {
                id: matZ
                ambient: colorZ
            },
            Transform {
                rotationY: 0
            },
            DragController {
                function updateColor() {
                    matZ.ambient = dragging ? Qt.lighter(colorZ, 1.5) : hovering ? Qt.lighter(colorZ, 1.25) : colorZ
                }
                onHoveringChanged: updateColor()
                onDraggingChanged: updateColor()
                cameraController: rotationGizmoRoot.cameraController
                getValueCallback: targetTransform ? function() {return targetTransform.rotationZ} : false
                setValueCallback: targetTransform ? function(v) {targetTransform.rotationZ = v} : false
                sensitivity: rotationGizmoRoot.sensitivity
            }
        ]
    }

    components: [transform]
}
