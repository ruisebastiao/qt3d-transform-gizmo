import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Input 2.0

Entity {
    id: orbitRoot
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

    Entity {
        id: origin
        components: [SphereMesh { radius: beamRadius * 1.25 }, PhongMaterial { ambient: "black" }]
    }

    Entity {
        components: [
            TorusMesh {
                radius: orbitRoot.beamLength
                minorRadius: orbitRoot.beamRadius
                slices: orbitRoot.slices
                rings: orbitRoot.rings
            },
            PhongMaterial {
                ambient: colorX
            },
            Transform {
                rotationY: 90
            }
        ]
    }

    Entity {
        components: [
            TorusMesh {
                radius: orbitRoot.beamLength
                minorRadius: orbitRoot.beamRadius
                slices: orbitRoot.slices
                rings: orbitRoot.rings
            },
            PhongMaterial {
                ambient: colorY
            },
            Transform {
                rotationX: 90
            }
        ]
    }

    Entity {
        components: [
            TorusMesh {
                radius: orbitRoot.beamLength
                minorRadius: orbitRoot.beamRadius
                slices: orbitRoot.slices
                rings: orbitRoot.rings
            },
            PhongMaterial {
                ambient: colorZ
            },
            Transform {
                rotationY: 0
            }
        ]
    }

    components: [transform]
}
