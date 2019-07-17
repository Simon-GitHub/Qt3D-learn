# 目录
- [目录](#%E7%9B%AE%E5%BD%95)
- [Qt3D-learn](#Qt3D-learn)
  - [CI](#CI)
  - [License](#License)
  - [开发环境](#%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
  - [效果预览](#%E6%95%88%E6%9E%9C%E9%A2%84%E8%A7%88)
    - [启动页面](#%E5%90%AF%E5%8A%A8%E9%A1%B5%E9%9D%A2)
    - [HelloScene3D](#HelloScene3D)
    - [HelloScene3D 2](#HelloScene3D-2)
    - [Triangles](#Triangles)
    - [Texture 1](#Texture-1)
    - [Texture 2](#Texture-2)
    - [Texture 3](#Texture-3)
    - [FirstCube](#FirstCube)
    - [MulitCube](#MulitCube)
  - [代码结构](#%E4%BB%A3%E7%A0%81%E7%BB%93%E6%9E%84)
  - [联系方式:](#%E8%81%94%E7%B3%BB%E6%96%B9%E5%BC%8F)
  - [打赏](#%E6%89%93%E8%B5%8F)


# Qt3D-learn

学习Qt3D的使用。在已有资料的基础上，做一些尝试，改进。

参考:
* https://learnopengl-cn.github.io/
* https://github.com/MidoriYakumo/learnopengl-qt3d

## CI
| [Linux][lin-link] | [Windows][win-link] |
| :---------------: | :-----------------: |
| ![lin-badge]      | ![win-badge]        |

[lin-badge]: https://travis-ci.org/jaredtao/Qt3D-learn.svg?branch=master "Travis build status"
[lin-link]: https://travis-ci.org/jaredtao/Qt3D-learn "Travis build status"
[win-badge]: https://ci.appveyor.com/api/projects/status/4stalyomvmeyxpvo?svg=true "AppVeyor build status"
[win-link]: https://ci.appveyor.com/project/jiawentao/qt3d-learn "AppVeyor build status"
## License
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jaredtao/Qt3D-learn/blob/master/LICENSE)

## 开发环境

* Qt 5.12.x Windows
  
## 效果预览

### 启动页面

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/Examples.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/Examples_Android.png"/>
  </div>
</div>

参考Qt官方的例子，做了一个列表，可以点击进入、可以返回。

也方便在Android设备上运行。

### HelloScene3D

<img src="DemoImages/1.png" width="50%" height="50%"/>

最小Demo，在Quick场景中，增加初始的3D场景。

### HelloScene3D 2

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/2.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/2_Android.png"/>
  </div>
</div>

增加背景色，以及必要的渲染设置、渲染设备选择器等。
    
增加FPS

### Triangles

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/3.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/3_Android.png"/>
  </div>
</div>

几何形状的绘制。创建了4个3D场景，放在了一起。

左上角为顶点绘制的三角形，4个点+ TriangleFan的方式绘制。

右上角是 索引+顶点绘制的线框模式两个三角形

左下角为一次绘制两个三角形（顶点数据包含两个三角形）

右下角为绘制彩色的三角形(顶点数据之外，增加色彩数据)

### Texture 1

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/4.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/4_Android.png"/>
  </div>
</div>

基本的纹理贴图

### Texture 2
<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/5.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/5_Android.png"/>
  </div>
</div>

纹理和自定义颜色的混合

### Texture 3

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/6.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/6_Android.png"/>
  </div>
</div>

两张纹理的混合。增加了键盘设备和键盘处理，按下键盘Up和Down可以调节混合比例。

### FirstCube

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/7.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/7_Android.png"/>
  </div>
</div>

一个3D立方体，绕y轴旋转

### MulitCube

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/8.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/8_Android.png"/>
  </div>
</div>

100个立方体，用NodeInstantiator动态创建，坐标随机、大小随机


## 代码结构

<img src="DemoImages/code.png" width="50%" height="50%"/>


## 联系方式:

***

| 作者 | 涛哥                           |
| ---- | -------------------------------- |
|开发理念 | 弘扬鲁班文化，传承工匠精神 |
| 博客 | https://jaredtao.github.io/ |
|知乎专栏| Qt进阶之路https://zhuanlan.zhihu.com/TaoQt |
|微信公众号| Qt进阶之路 |
| 邮箱 | jared2020@163.com                |
| 微信 | xsd2410421                       |
| QQ、TIM | 759378563                      |

***

QQ(TIM)、微信二维码

<img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/qq_connect.jpg?raw=true" width="30%" height="30%" /><img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/weixin_connect.jpg?raw=true" width="30%" height="30%" />


***
## 打赏
<img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/weixin.jpg?raw=true" width="30%" height="30%" /><img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/zhifubao.jpg?raw=true" width="30%" height="30%" />

觉得分享的内容还不错, 就请作者喝杯奶茶吧~~
***

