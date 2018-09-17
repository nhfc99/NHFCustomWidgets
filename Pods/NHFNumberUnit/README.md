# NHFNumberUnit
<h2>介绍</h2>
<p>对价格等参数进行格式化处理操作</p>
<h2>安装</h2>
<ul>
<li>pod 'NHFNumberUnit'</li>
<li>手动下载然后将文件夹拖至工程中即可</li>
</ul>

<h2>使用方法</h2>

/**
 *  默认保留2位小数
 *
 *  @param data
 *
 *  @return
 */
+ (NSString *)formatFloat:(CGFloat)data;

/**
 *  默认保留3为小数
 *
 *  @param data
 *
 *  @return
 */
+ (NSString *)formatFloatThree:(CGFloat)data;
