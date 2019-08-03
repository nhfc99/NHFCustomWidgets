# NHFDevice
<h2>介绍</h2>
<p>IOS布局相关方面的</p>
<h2>安装</h2>
<ul>
<li>pod 'NHFDevice'</li>
<li>手动下载然后将文件夹拖至工程中即可</li>
</ul>

<h2>使用方法</h2>
/**
 *  获取屏幕的尺寸
 *
 *  @return
 */
+(CGSize)ScreenSize;

/**
 *  设备顶部
 *
 *  @return
 */
+(CGFloat)ScreenTop;

/**
 *  导航栏的高度
 *
 *  @return
 */
+(CGFloat)ScreenNavgationBarHeight;
+(CGFloat)ScreenNavgationBarHeightBy:(UINavigationController *)navigationController;

/**
 *  状态栏和导航栏之和
 *
 *  @return
 */
+ (CGFloat)ScreenTTop;

/**
 *  底部高度
 *
 *  @return
 */
+(CGFloat)TabBarHeight;

/**
 *  除去顶部的高度
 *
 *  @return
 */
+(int)OtherTopHeight;

/**
 *  获取屏幕的缩放率
 *
 *  @return
 */
+(CGFloat)ScreenScale;

/**
 *  系统的名字
 *
 *  @return
 */
+(NSString*)SystemName;

/**
 *  系统的版本
 *
 *  @return
 */
+(NSString*)SystemVersion;

/**
 *  设备的唯一识别码
 *
 *  @return
 */
+(NSString*)DeviceUniqueIdentifier;

/**
 *  设备的名字
 *
 *  @return
 */
+(NSString*)DeviceName;

/**
 *  App的信息
 *
 *  @return
 */
+(NSDictionary*)AppInfo;

/**
 *  获取app的一些路径，document、cache、resource
 *
 *  @param pathtype 路径类型
 *
 *  @return
 */
+(NSString*)AppBasePath:(NSString*)pathtype;

/**
 *  获取app中document路径
 *
 *  @param filename
 *
 *  @return
 */
+(NSString*)AppBaseDocumentPath:(NSString*)filename;

/**
 *  获取app中resource路径
 *
 *  @param filename
 *
 *  @return
 */
+(NSString*)AppBaseResourcePath:(NSString*)filename;

/**
 *  获取缓存目录
 *
 *  @param filename
 *
 *  @return 
 */
+ (NSString*)AppBaseCachePath:(NSString*)filename;

/**
 *  网卡地址
 *
 *  @return 
 */
+ (NSString *)macaddress;

/**
 *  苹果系统下获取全球唯一的标志
 *
 *  @param NSString
 *
 *  @return
 */
+(NSString*)uuid;

/**
 *  获取屏幕中间的高度
 *
 *  @return 
 */
+ (CGFloat)ScreenMiddleHeight;

/**
 *  根据给定的宽度算出等比例的高度
 *
 *  @param width
 *  @param size
 *
 *  @return
 */
+ (CGFloat)scalHeightByWidth:(CGFloat)width
                      BySize:(CGSize)size;

+ (CGFloat)scalWidthByHeight:(CGFloat)height
                      BySize:(CGSize)size;
