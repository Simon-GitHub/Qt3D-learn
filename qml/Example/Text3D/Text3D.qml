import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import ".."
DefaultScene {
    OrbitRootEntity{
        Entity {
            components: [
                ExtrudedTextMesh {
                    text: "涛哥威武"
                    depth: 0.45
                },
                Transform {
                },
                PhongMaterial {
                    diffuse: Qt.rgba(111, 150, 255, 255)
                }
            ]
        }
    }
}


