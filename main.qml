import QtQuick 2.0
import QtQuick.Scene3D 2.0

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0
import Qt3D.Animation 2.9

Scene3D {
    id: scene3d
    anchors.fill: parent
    anchors.margins: 10
    focus: true
    aspects: ["input", "logic"]
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
    hoverEnabled: true

    Entity {
        id: sceneRoot

        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            aspectRatio: 16/9
            nearPlane : 0.1
            farPlane : 1000.0
            position: Qt.vector3d(5.0, 10.0, 3.0)
            upVector: Qt.vector3d(0.0, 0.0, 1.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        }

        components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        camera: camera
                        clearColor: "transparent"
                    }
                    pickingSettings.pickMethod: PickingSettings.TrianglePicking
                    pickingSettings.faceOrientationPickingMode: PickingSettings.FrontAndBackFace
                },
                InputSettings { }
            ]

        OrbitCameraController {
            id: orbitController
            camera: camera
            //lookSpeed: 100
        }

        Entity {
            id: cube1
            components: [
                CuboidMesh {
                    xExtent: 1
                    yExtent: 1
                    zExtent: 1
                },
                PhongMaterial {},
                Transform {
                    id: cube1Transform
                    translation: Qt.vector3d(3, 2, 0)
                }
            ]

            TranslationGizmo {
                cameraController: orbitController
                targetTransform: cube1Transform
            }
        }

        Entity {
            id: cube2
            components: [
                CuboidMesh {
                    xExtent: 1
                    yExtent: 1
                    zExtent: 1
                },
                PhongMaterial {},
                Transform {
                    id: cube2Transform
                    translation: Qt.vector3d(-2, 2, 0)
                }
            ]

            RotationGizmo {
                cameraController: orbitController
                targetTransform: cube2Transform
            }
        }

        AxesArrows {
            id: originArrows
        }
    }
}
