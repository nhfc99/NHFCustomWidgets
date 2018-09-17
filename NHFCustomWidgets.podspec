Pod::Spec.new do |s|
    s.name         = "NHFCustomWidgets"
    s.version      = "1.0.6"
    s.summary      = "常用组件集合"
    s.homepage     = "https://github.com/nhfc99/NHFCustomWidgets.git"
    s.license      = "MIT"
    s.author       = {"nhfc99"=>"nhfc99@163.com"}
    s.platform     = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.source       = {:git => "https://github.com/nhfc99/NHFCustomWidgets.git",:tag => s.version.to_s}
    s.requires_arc = true

    s.public_header_files = 'Classes/NHFCustomWidgetsSetting.h'
    s.source_files = 'Classes/NHFCustomWidgetsSetting.h'

    s.frameworks = 'QuartzCore','CoreData','Foundation','UIKit'
    s.subspec 'UIButton' do |ss|
        ss.source_files = 'Classes/UIButton/UIButton+NHFBlock/UIButton+NHFBlock.{h,m}'
        ss.public_header_files = 'Classes/UIButton/UIButton+NHFBlock/UIButton+NHFBlock.h'
    end

    s.dependency "SDWebImage"
    s.dependency "NHFFontUnit"
    s.dependency "NHFFileUtils"
    s.dependency "NHFDevice"
    s.dependency "NhfUIColorUnit"
    s.dependency "NhfCacheDeal"
    s.dependency "NHFUIImage"
    s.dependency "NHFRadioButton"
    s.dependency "NHFDateUtils"
    s.dependency "NHFNumberUnit"
    s.dependency "Masonry"
    s.dependency "IQKeyboardManager"
    s.dependency "NHFPay"
    s.dependency "NHFNavigationBar"
    s.dependency "NHFDispatchQueue"
end
