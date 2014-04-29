## Nginx 实时图片处理服务 ##

### 参数说明 ###

原图地址：http://down1.apps.uc.cn/group1/M01/79/A4/Cg2DPlMxUyywry5qAABCrW_JIqw773.jpg
需要请求的地址：http://down1.apps.uc.cn/group1/M01/79/A4/Cg2DPlMxUyywry5qAABCrW_JIqw773**---ge320x222_ro90_qu0_rt0_gt0**.jpg

其中加粗部分是需要单独配置的参数

- **---**：用来分割原图片和目前处理参数的分隔符，不可配置。

- **ge**：Geometry, 目标图片分辨率，格式为`widthkuaxheight`，如：`200x333`. 组件约束可缩放的范围，详见 [common.lua](http://git.ucweb.local/adp/nginx-gm/blob/master/lua/app/common.lua) 中的 legalGeometryTable 配置。如果没有分辨率参数，则和原图的分辨率保持一致。 

-  **ro**：Rotate，目标图片旋转度数，格式为`度数`,如：`90`,组件约束可旋转的范围，详见 [common.lua](http://git.ucweb.local/adp/nginx-gm/blob/master/lua/app/common.lua) 中的 legalRotateTable  配置。如果没有旋转度数，则和原图的转向保持一致。

- **qu**：Quality，目标图片品质，格式为`品质百分比`,如：`95`,组件约束品质的范围，详见 [common.lua](http://git.ucweb.local/adp/nginx-gm/blob/master/lua/app/common.lua) 中的 legalQualityTable   配置。如果没有品质参数，则默认为95。

-  **rt**：RotateType，旋转类型，格式为`旋转类型参数`,如：`0`,组件约束旋转类型的范围，详见 [common.lua](http://git.ucweb.local/adp/nginx-gm/blob/master/lua/app/common.lua) 中的 legalRotateTypeTable    配置。如果没有旋律转类型，则默认为0。其中 0 表示如果原图中的 width > height ,则根据 **ro** 参数进行旋转，反之，则不旋转；1 表示无论原图尺寸如何，强制旋转 **ro** 传递的度数。
-  **gt**：Geometry，缩放类型，格式为`缩放类型参数`,如：`0`,组件约束缩放类型的范围，详见 [common.lua](http://git.ucweb.local/adp/nginx-gm/blob/master/lua/app/common.lua) 中的 legalGeometryTypeTable     配置。如果没有缩放类型参数，则默认为0。其中 0 表示 按照最大边缩放，1表示按照最小边缩放，2表示按照指定的宽和高缩放，不等比，3标识如果原尺寸大于指定的宽和/或高，则等比缩小，4 表示如果原尺寸小于指定的宽和/或高，则等比放大，5表示 按指定的宽来等比缩放，6表示按指定的高来等比缩放。


### 示例 ###

-  [按照高等比缩放，品质为95](http://down1.apps.uc.cn/group1/M00/59/4A/Cg2DP1NE9uzxkaYAAABkvcapEsw853---ge200x333_ro0_qu95_rt0_gt6.jpg)
-  [强制旋转90度](http://down1.apps.uc.cn/group1/M00/59/4A/Cg2DP1NE9uzxkaYAAABkvcapEsw853---ge0_ro90_qu0_rt1_gt1.jpg)

### 依赖 ###

-  [GM](http://www.graphicsmagick.org/)
-  [LuaGit](http://luajit.org/)
-  [HttpLuaModule](https://github.com/chaoslawful/lua-nginx-module)

### 联系 ###

-   MarkSnoopy<marksnoopy@gmail.com>
