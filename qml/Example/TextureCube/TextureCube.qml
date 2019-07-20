import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import ".."

DefaultScene {
    id: root
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
    OrbitRootEntity {
        id: orbitEntity
        Entity {
            id: cube
            GeometryRenderer {
                id: cubeGeo
                geometry: Geometry {
                    boundingVolumePositionAttribute: position
                    attributes: [position, texCoord, indices]


                    Attribute {
                        id: position
                        name: "position"
                        attributeType: Attribute.VertexAttribute
                        buffer: vertexBuffer
                        vertexSize: 3
                        count: 24
                        byteOffset: 0 * 4
                        byteStride: 5 * 4
                        vertexBaseType: Attribute.Float
                    }
                    Attribute {
                        id: texCoord
                        name: "texCoord"
                        attributeType: Attribute.VertexAttribute
                        buffer: vertexBuffer
                        vertexSize: 2
                        count: 24
                        byteOffset: 3 * 4
                        byteStride: 5 * 4
                        vertexBaseType: Attribute.Float
                    }
                    Attribute {
                        id: indices
                        attributeType: Attribute.IndexAttribute
                        buffer: indicesBuffer
                        vertexSize: 3
                        count: 12
                        byteOffset: 0 * 2
                        byteStride: 3 * 2
                        vertexBaseType: Attribute.UnsignedShort
                    }
                }
                Buffer {
                    id: vertexBuffer
                    type: Buffer.VertexBuffer
                    data: new Float32Array([
                                               //back
                                               -1.0, -1.0, 1.0, 0.0, 0.0,
                                               1.0, -1.0, 1.0,  1.0, 0.0,
                                               -1.0, 1.0, 1.0,  0, 1.0,
                                               1.0, 1.0, 1.0,   1.0, 1.0,
                                               //front
                                               -1.0, 1.0, -1.0,  0, 1.0,
                                               1.0, 1.0, -1.0,   1.0, 1.0,
                                               1.0, -1.0, -1.0,  1.0, 0.0,
                                               -1.0, -1.0, -1.0, 0.0, 0.0,
                                               //right
                                               1.0, 1.0, -1.0,  0, 1.0,
                                               1.0, 1.0, 1.0,   1.0, 1.0,
                                               1.0, -1.0, 1.0,  1.0, 0.0,
                                               1.0, -1.0, -1.0, 0.0, 0.0,
                                               //left
                                               -1.0, 1.0, -1.0,  0, 1.0,
                                               -1.0, 1.0, 1.0,   1.0, 1.0,
                                               -1.0, -1.0, 1.0,  1.0, 0.0,
                                               -1.0, -1.0, -1.0, 0.0, 0.0,
                                               //bottom
                                               -1.0, -1.0, -1.0,  0, 1.0,
                                               -1.0, -1.0, 1.0,   1.0, 1.0,
                                               1.0, -1.0, -1.0,  1.0, 0.0,
                                               1.0, -1.0, 1.0, 0.0, 0.0,
                                               //top
                                               -1.0, 1.0, -1.0,  0, 1.0,
                                               -1.0, 1.0, 1.0,   1.0, 1.0,
                                               1.0,  1.0, -1.0,  1.0, 0.0,
                                               1.0,  1.0, 1.0, 0.0, 0.0,
                                           ])
                }
                Buffer {
                    id: indicesBuffer
                    type: Buffer.IndexBuffer
                    data: new Uint16Array([
                                              0, 1, 2,
                                              2, 3, 0,
                                              4, 5, 6,
                                              6, 7, 4,
                                              8, 9, 10,
                                              10, 11, 8,
                                              12, 13, 14,
                                              14, 15, 12,
                                              16, 17, 18,
                                              18, 19, 16,
                                              20, 21, 22,
                                              22, 23, 20
                                          ])
                }
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
                            renderStates: CullFace { mode: CullFace.NoCulling}
                            shaderProgram: ShaderProgram {
                                vertexShaderCode: gConfig.shaderVersionString + '
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
uniform sampler2D outTexture;
out vec4 fragColor;
void main()
{
    fragColor = texture(outTexture, vTexCoord);
}
'
                            }
                        }
                    }
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
                                source: gConfig.resPrefix + "Example/TextureCube/1.jpg"
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
                            m.translate(0, 0, -3)
                            return m
                        }
                    },
                    Parameter {
                        name: "projection"
                        value: orbitEntity.camera.projectionMatrix
                    }
                ]
            }
            components: [cubeGeo, cubeTransform, cuebMaterial]
        }
    }
}
