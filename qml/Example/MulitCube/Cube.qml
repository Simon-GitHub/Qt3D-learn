import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Extras 2.12

Entity {
    property matrix4x4 transform
    components: [
        PhongMaterial {
            id: phoneMaterial
        },
        CuboidMesh {
            id: cube
            xExtent: Math.random() * 10
            yExtent: Math.random() * 10
            zExtent: Math.random() * 10
        },
        Transform {
            matrix: transform
        }
    ]
}
