Pod::Spec.new do |s|
    s.name         = "NHFCustomWidgets"
    s.version      = "1.3.4.4"
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

    s.dependency "Masonry"
    s.dependency "NHFDevice"
    s.dependency "NhfUIColorUnit"
    s.dependency "NHFNavigationBar"
    s.dependency "IQKeyboardManager"
    s.dependency "MJRefresh"
    s.dependency "AFNetworking"

    s.frameworks = 'QuartzCore','CoreData','Foundation','UIKit','Security'

    s.subspec 'UIButton' do |ss|
        ss.source_files = 'Classes/UIButton/*.{h,m}'
        ss.public_header_files = 'Classes/UIButton/*.h'
    end

    s.subspec 'NHFSearchView' do |ss|
        ss.source_files = 'Classes/SearchView/NHFSearchView.{h,m}'
        ss.public_header_files = 'Classes/SearchView/NHFSearchView.h'
    end

    s.subspec 'NHFSynService' do |ss|
        ss.source_files = 'Classes/NHFSynService/NHFSynService.{h,m}'
        ss.public_header_files = 'Classes/NHFSynService/NHFSynService.h'
    end

    s.subspec 'NHFWindowView' do |ss|
        ss.source_files = 'Classes/NHFWindowView/NHFWindowView.{h,m}'
        ss.public_header_files = 'Classes/NHFWindowView/NHFWindowView.h'
    end

    s.subspec 'NHFImageTableViewCell' do |ss|
        ss.source_files = 'Classes/NHFImageTableViewCell/NHFImageTableViewCell.{h,m}'
        ss.public_header_files = 'Classes/NHFImageTableViewCell/NHFImageTableViewCell.h'
    end

    s.subspec 'UITableViewCell+Custom' do |ss|
        ss.source_files = 'Classes/UITableViewCell+Custom/UITableViewCell+Custom.{h,m}'
        ss.public_header_files = 'Classes/UITableViewCell+Custom/UITableViewCell+Custom.h'
    end

    s.subspec 'NHFELCycleVerticalView' do |ss|
        ss.source_files = 'Classes/NHFELCycleVerticalView/NHFELCycleVerticalView.{h,m}'
        ss.public_header_files = 'Classes/NHFELCycleVerticalView/NHFELCycleVerticalView.h'
    end

    s.subspec 'NHFMacroDefinition' do |ss|
        ss.source_files = 'Classes/NHFMacroDefinition/NHFMacroDefinition.{h}'
        ss.public_header_files = 'Classes/NHFMacroDefinition/NHFMacroDefinition.h'
    end

    s.subspec 'NHFTimer' do |ss|
        ss.source_files = 'Classes/NHFTimer/NHFTimer.{h,m}'
        ss.public_header_files = 'Classes/NHFTimer/NHFTimer.h'
    end

    s.subspec 'NHFCycleView' do |ss|
        ss.dependency 'NHFCustomWidgets/NHFTimer'
        ss.source_files = 'Classes/NHFCycleView/NHFCycleView.{h,m}'
        ss.public_header_files = 'Classes/NHFCycleView/NHFCycleView.h'
    end

    s.subspec 'NHFKeychainTool' do |ss|
        ss.source_files = 'Classes/NHFKeychainTool/NHFKeychainTool.{h,m}'
        ss.public_header_files = 'Classes/NHFKeychainTool/NHFKeychainTool.h'
    end

    s.subspec 'NHFMemoryObjectCache' do |ss|
        ss.source_files = 'Classes/NHFMemoryObjectCache/NHFMemoryObjectCache.{h,m}'
        ss.public_header_files = 'Classes/NHFMemoryObjectCache/NHFMemoryObjectCache.h'
    end

    s.subspec 'UITextField+Attribute' do |ss|
        ss.source_files = 'Classes/UITextField+Attribute/UITextField+Attribute.{h,m}'
        ss.public_header_files = 'Classes/UITextField+Attribute/UITextField+Attribute.h'
    end

    s.subspec 'Base' do |ss|
        ss.dependency 'NHFCustomWidgets/NHFMacroDefinition'
        ss.source_files = 'Classes/Base/**/*.{h,m}'
        ss.public_header_files = 'Classes/Base/**/*.h'
    end

    s.subspec 'NHFUpLoadAndDownImages' do |ss|
        ss.source_files = 'Classes/NHFUpLoadAndDownImages/*.{h,m}'
        ss.public_header_files = 'Classes/NHFUpLoadAndDownImages/*.h'
    end

    s.subspec 'ZFBadgeNumber' do |ss|
        ss.source_files = 'Classes/ZFBadgeNumber/*.{h,m}'
        ss.public_header_files = 'Classes/ZFBadgeNumber/*.h'
    end

    s.subspec 'JsonDeal' do |ss|
        ss.source_files = 'Classes/JsonDeal/*.{h,m}'
        ss.public_header_files = 'Classes/JsonDeal/*.h'
    end

    s.subspec 'NSString' do |ss|
        ss.source_files = 'Classes/NSString/*.{h,m}'
        ss.public_header_files = 'Classes/NSString/*.h'
    end

    s.subspec 'UILabel' do |ss|
        ss.source_files = 'Classes/UILabel/*.{h,m}'
        ss.public_header_files = 'Classes/UILabel/*.h'
    end

    s.subspec 'UIView' do |ss|
        ss.source_files = 'Classes/UIView/*.{h,m}'
        ss.public_header_files = 'Classes/UIView/*.h'
    end

    s.subspec 'Other' do |ss|
        ss.source_files = 'Classes/Other/*.{h,m}'
        ss.public_header_files = 'Classes/Other/*.h'
    end
end
