import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Input 2.0

Entity {
    id: axesArrowsRoot
    property real beamRadius: 0.05
    property real beamLength: 1
    property real tipRadius: 0.15
    property real tipLength: 0.3
    property int slices: 10
    property color colorX: "red"
    property color colorY: "green"
    property color colorZ: "blue"
    property Transform transform: Transform {}

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
    }

    Arrow {
        id: arrowY
        beamRadius: parent.beamRadius
        beamLength: parent.beamLength
        tipRadius: parent.tipRadius
        tipLength: parent.tipLength
        slices: parent.slices
        color: colorY
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
    }

    components: [transform]
}
