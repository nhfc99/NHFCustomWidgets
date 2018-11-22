Pod::Spec.new do |s|
    s.name         = "NHFCustomWidgets"
    s.version      = "1.0.27"
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

    s.frameworks = 'QuartzCore','CoreData','Foundation','UIKit'
    s.subspec 'UIButton' do |ss|
        ss.source_files = 'Classes/UIButton/UIButton+NHFBlock/UIButton+NHFBlock.{h,m}'
        ss.public_header_files = 'Classes/UIButton/UIButton+NHFBlock/UIButton+NHFBlock.h'
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
end
