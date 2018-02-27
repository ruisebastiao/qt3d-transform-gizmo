import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0

Entity {
    id: arrowRoot

    property real beamRadius: 0.05
    property real beamLength: 1
    property real tipRadius: 0.2
    property real tipLength: 0.3
    property color color: "black"
    property int slices: 4
    property Transform transform: Transform {}

    property DragController dragController

    /*
    property real sensitivity: 0.025
    property var getValueCallback // set this to function() { ... }
    property var setValueCallback // set this to function(x) { ... }
    property OrbitCameraController orbitController

    DragController {
        function updateColor() {
            material.ambient = dragging ? Qt.lighter(color, 1.5) : hovering ? Qt.lighter(color, 1.25) : color
        }
        id: dragController
        onHoveringChanged: parent.updateColor()
        onDraggingChanged: parent.updateColor()
        cameraController: parent.orbitController
        sensitivity: parent.sensitivity
        getValueCallback: parent.getValueCallback
        setValueCallback: parent.setValueCallback
    }
    */

    PhongMaterial {
        id: material
        ambient: color
    }

    Entity {
        Entity {
            id: coneEntity

            ConeMesh {
                id: coneMesh
                length: arrowRoot.tipLength
                topRadius: 0
                hasTopEndcap: true
                bottomRadius: arrowRoot.tipRadius
                hasBottomEndcap: true
                slices: arrowRoot.slices
                rings: 2
            }

            Transform {
                id: coneTransform
                translation: Qt.vector3d(0, arrowRoot.beamLength, 0)
            }

            components: dragController ? [coneMesh, coneTransform, material, dragController] : [coneMesh, coneTransform, material]
        }

        Entity {
            id: cylinderEntity

            CylinderMesh {
                id: cylinderMesh
                length: arrowRoot.beamLength
                radius: arrowRoot.beamRadius
                slices: arrowRoot.slices
                rings: 2
            }

            Transform {
                id: cylinderTransform
                translation: Qt.vector3d(0, 0.5 * arrowRoot.beamLength, 0)
            }

            components: [cylinderMesh, cylinderTransform, material]
        }

        components: [transform]
    }
}
