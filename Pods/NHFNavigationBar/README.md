# NHFNavigationBar
<h2>介绍</h2>
<p>IOS布局相关方面的</p>
<h2>安装</h2>
<ul>
<li>pod 'NHFNavigationBar'</li>
<li>手动下载然后将文件夹拖至工程中即可</li>
</ul>

<h2>使用方法</h2>


<ul>
<li>//隐藏导航栏</li>
<li>@property (nonatomic, assign) BOOL nhfHidBar;</li>
</ul>

<ul>
<li>//TintColor</li>
<li>@property (nonatomic, strong) UIColor *nhfTintColor;</li>
</ul>


<ul>
<li>//BarTintColor</li>
<li>@property (nonatomic, strong, readonly) UIColor *nhfBarTintColor;</li>
</ul>


<ul>
<li>//TitleColor</li>
<li>@property (nonatomic, strong) UIColor *nhfTitleColor;</li>
</ul>


<ul>
<li>//控制滑动返回</li>
<li>@property (nonatomic, assign) BOOL popGestureRecognizerEnable;</li>
</ul>


<ul>
<li>//是否隐藏导航栏底部的线条</li>
<li>@property (nonatomic, assign) CGFloat nhfShadowImageAlpha;</li>
</ul>


<ul>
<li>//设置标题属性</li>
<li>@property (nonatomic, strong) NSDictionary *nhfTitleTextAttributes;</li>
</ul>


<ul>
<li>//设置状态栏</li>
<li>@property (nonatomic, assign) UIStatusBarStyle nhfStatusBarStyle;</li>
</ul>


<ul>
<li>//获取导航栏背景透明度</li>
<li>@property (nonatomic, assign, readonly) CGFloat nhfNavBarAlpha;</li>
</ul>


<ul>
<li>//导航栏背景图片</li>
<li>@property (nonatomic, strong, readonly) UIImage *nhfBarBackgroundImage;</li>
</ul>


<ul>
<li>/**</li>
<li>设置导航栏背景颜色（单一色调）以及透明度</li>

<li>@param color --</li>
<li>@param alpha --</li>
<li>*/</li>
<li>- (void)setNhfBarTintColor:(UIColor *)color alpha:(CGFloat)alpha;</li>
</ul>


<ul>
<li>/**</li>
<li>设置导航栏背景图片以及透明度</li>

<li>@param image --</li>
<li>@param alpha --</li>
<li>*/</li>
<li>- (void)setNhfBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha;</li>
</ul>

//左边
<ul>
<li>/**</li>
<li>自定义返回按钮</li>

<li>@param image --</li>
<li>@param action --</li>
<li>*/</li>
<li>- (void)setLeftItemImage:(UIImage *)image action:(SEL)action;</li>
</ul>


<ul>
<li>/**</li>
<li>添加左边文字按钮</li>

<li>@param title --</li>
<li>@param action --</li>
<li>@param color --</li>
<li>@param font --</li>
<li>*/</li>
<li>- (void)addLeftItemTitle:(NSString*)title action:(SEL)action color:(UIColor *)color font:(UIFont *)font;</li>
</ul>

<ul>
<li>/**</li>
<li>添加左边图片按钮</li>

<li>@param image --</li>
<li>@param action --</li>
<li>*/</li>
<li>- (void)addLeftItemImage:(UIImage *)image action:(SEL)action;</li>
</ul>


//右边
<ul>
<li>/**</li>
添加右边的按钮添加文字</li>

<li>@param title --</li>
<li>@param action --</li>
<li>@param color --</li>
<li>@param font --</li>
<li>*/</li>
<li>- (void)addRightItemTitle:(NSString*)title action:(SEL)action color:(UIColor *)color font:(UIFont *)font;</li>
</ul>

<ul>
<li>/**</li>
<li>添加右边的按钮添加图片</li>

<li>@param image --</li>
<li>@param action --</li>
<li>*/</li>
<li>- (void)addRightItemImage:(UIImage *)image action:(SEL)action;</li>
</ul>

<ul>
<li>/**
<li>设置右边的按钮</li>

<li>@param title --</li>
<li>@param action --</li>
<li>@param color --</li>
<li>@param font --</li>
<li>*/</li>
<li>- (void)setRightItemTitle:(NSString *)title  action:(SEL)action color:(UIColor *)color font:(UIFont *)font;</li>
</ul>
