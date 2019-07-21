import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import QtQuick 2.12
import ".."

DefaultScene {
    id: scene
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
    Entity {
        id: orbitRoot
        //        position: Qt.vector3d(0.0, 30, 30)
        Camera {
            id: oCamera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            nearPlane: 0.1
            farPlane: 100.0
            position: Qt.vector3d(0.0, 30.0, 30.0)
            upVector: Qt.vector3d(0.0, 1.0, 0.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        }
        OrbitCameraController {
            camera: oCamera
        }
        RenderSettings {
//            activeFrameGraph: ForwardRenderer {
//                camera: oCamera
//                clearColor: Qt.rgba(0.2, 0.3, 0.4, 1.0)
//                frustumCulling: false
//            }
            activeFrameGraph: RenderSurfaceSelector {
                ClearBuffers {
                    buffers: ClearBuffers.ColorDepthBuffer
                    clearColor: Qt.rgba(0.2, 0.3, 0.4, 1.0)
                }
                RenderStateSet {
                    id: renderStateSet
//                    renderStates: DepthTest {
//                        depthFunction: DepthTest.Less
//                    }
                }
                CameraSelector {
                    camera: oCamera
                }
            }
        }
        InputSettings {
            id: inputtingSettings
        }
        FrameAction {
            onTriggered: {
                gConfig.frame++
            }
        }

        Entity {
            PlaneMesh {
                id: groundMesh
                width: 50
                height: width
                meshResolution: Qt.size(2, 2)
            }

            Transform {
                id: groundTransform
                translation: Qt.vector3d(0, 0, 0)
            }
            PhongMaterial {
                id: material
            }
            components: [
                groundMesh,
                groundTransform,
                material
            ]
        }
        Entity {
            id: cube
            CubeMapGeometryRenderer2 {
                id: cubeGeo
            }
            Transform {
                id: cubeTransform
                matrix: {
                    let m = Qt.matrix4x4()
                    m.rotate(time.value % 360 * 50, Qt.vector3d(0.5, 1.0, 0.0))
                    return m
                }
                Time {
                    id: time
                }
            }
            Material {
                id: cuebMaterial
                effect: Effect {
                    techniques: AutoTechnique {
                        renderPasses: RenderPass {
                            renderStates: [
                                CullFace { mode: CullFace.NoCulling},
                                DepthTest{ depthFunction: DepthTest.Less}
                            ]
                            shaderProgram: ShaderProgram {
                                vertexShaderCode:gConfig.shaderVersionString + '
    layout (location = 0) in vec3 position;
    layout (location = 1) in vec2 texCoord;
    uniform mat4 model;
    uniform mat4 view;
    uniform mat4 projection;
    out vec2 vTexCoord;
    void main()
    {
        gl_Position = projection * view * model * vec4(position, 1.0f);
        vTexCoord = texCoord;
    }
    '
                                fragmentShaderCode: gConfig.shaderVersionString + '
    in vec2 vTexCoord;
    out vec4 fragColor;
    uniform sampler2D outTexture;
    void main()
    {
        fragColor = texture(outTexture, vTexCoord);
    }
    '
                            }
                            parameters: [
                                Parameter {
                                    name: "outTexture"
                                    value: Texture2D {
                                        generateMipMaps: true
                                        minificationFilter: Texture.Linear
                                        magnificationFilter: Texture.Linear
                                        wrapMode {
                                            x: WrapMode.Repeat
                                            y: WrapMode.Repeat
                                        }
                                        TextureImage {
                                            mipLevel: 0
                                            source: gConfig.resPrefix + "Assets/Cube/cube.png"
                                        }
                                    }
                                },
                                Parameter {
                                    name: "model"
                                    value: cubeTransform.matrix
                                },
                                Parameter {
                                    name: "view"
                                    value: {
                                        let m = Qt.matrix4x4()
                                        m.translate(0, 0, -5);
                                        return m
                                    }
                                },
                                Parameter {
                                    name: "projection"
                                    value: oCamera.projectionMatrix
                                }
                            ]
                        }
                    }
                }
            }
            components: [cubeGeo, cuebMaterial]
        }
    }
}
