import Qt3D.Core 2.12
import Qt3D.Render 2.12
GeometryRenderer {
    id: geometry
    geometry: Geometry {
        boundingVolumePositionAttribute: position
        Attribute {
            id: position
            attributeType: Attribute.VertexAttribute
            vertexBaseType: Attribute.Float
            vertexSize: 3
            count: 12
            byteOffset: 0 * 4
            byteStride: 5 * 4
            name: "position"
            buffer: vertexBuffer
        }
        Attribute {
            attributeType: Attribute.VertexAttribute
            vertexBaseType: Attribute.Float
            vertexSize: 2
            count: 24
            byteOffset: 3 * 4
            byteStride: 5 * 4
            name: "texCoord"
            buffer: vertexBuffer
        }
        Attribute {
            attributeType: Attribute.IndexAttribute
            vertexBaseType: Attribute.UnsignedShort
            vertexSize: 3
            count: 12
            byteOffset: 0 * 2
            byteStride: 3 * 2
            buffer: indexBuffer
        }
    }
    Buffer {
        id: vertexBuffer
        type: Buffer.VertexBuffer
        data: new Float32Array([
                                   //front
                                   -1.0, 1.0, 1.0,      0.0, 0.0,
                                   1.0, 1.0, 1.0,       0.32, 0.0,
                                   1.0, -1.0, 1.0,      0.32, 0.48,
                                   -1.0, -1.0,1.0,      0.0, 0.48,
                                   //right
                                   1.0, 1.0, 1.0,       0.34, 0.0,
                                   1.0, 1.0, -1.0,      0.65, 0.0,
                                   1.0, -1.0, -1.0,     0.65, 0.48,
                                   1.0, -1.0, 1.0,      0.34, 0.48,
                                   //back
                                   -1.0, 1.0, -1.0,      0.67, 0.0,
                                   1.0, 1.0, -1.0,       0.99, 0.0,
                                   1.0, -1.0, -1.0,      0.99, 0.48,
                                   -1.0, -1.0,-1.0,      0.67, 0.48,
                                   //left
                                   -1.0, 1.0, 1.0,       0.67, 0.52,
                                   -1.0, 1.0, -1.0,      0.99, 0.52,
                                   -1.0, -1.0, -1.0,     0.99, 0.99,
                                   -1.0, -1.0, 1.0,      0.67, 0.99,

                                   //top
                                   -1.0, 1.0, -1.0,     0.0, 0.52,
                                   1.0, 1.0, -1.0,      0.32, 0.52,
                                   1.0, 1.0, 1.0,       0.32, 0.99,
                                   -1.0, 1.0, 1.0,      0.0, 0.99,

                                   //bottom
                                   -1.0, -1.0, -1.0,     0.34, 0.52,
                                   1.0, -1.0, -1.0,      0.65, 0.52,
                                   1.0, -1.0, 1.0,       0.65, 0.99,
                                   -1.0, -1.0, 1.0,      0.34, 0.99,

                               ])
    }
    Buffer {
        id: indexBuffer
        type: Buffer.IndexBuffer
        data: new Int16Array([
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
