#
# Be sure to run `pod lib lint MikuKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MikuKit'
  s.version          = '0.1.0'
  s.summary          = 'iOS Development Quick Start Guide.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MikuKit encapsulates some commonly used APIs in iOS development.
                       DESC
  
  # 库主页
  s.homepage         = 'https://github.com/ypfdev/MikuKit'

  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  
  # 协议
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  # 作者
  s.author           = { 'ypfdev' => 'ypfdev@gmail.com' }

  # GitHub路径、tag值（tag实际就是上面的版本）
  s.source           = { :git => 'https://github.com/ypfdev/MikuKit.git', :tag => s.version.to_s }
  
  # 社交主页
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # 指定支持的平台和版本，不写则默认支持所有的平台
  # 如果支持多个平台，则使用下面的deployment_target定义
  # spec.platform = :ios
  s.platform = :ios
  # spec.platform = :osx

  # 支持的最低系统版本
  # s.ios.deployment_target = '9.0'
  # s.osx.deployment_target  = '10.10'

  # 是否支持ARC
  s.requires_arc = true

  # 资源文件
  s.source_files = 'MikuKit/Classes/**/*'

  # 资源文件
  # s.resource = 'XXX/XXXX/**/*.bundle'

  # 资源文件
  # s.resource_bundles = {
  #   'MikuKit' => ['MikuKit/Assets/*.png']
  # }

  # 公开头文件
  s.public_header_files = 'MikuKit/Classes/MikuKit.h'

  # 依赖的系统库
  # s.frameworks = 'UIKit', 'MapKit'

  # 依赖的系统静态库
  #s.library = 'sqlite3', 'xml2'

  # 依赖的第三方库
  # s.dependency 'AFNetworking', '~> 2.3'

  # 依赖第三方的framework
  # s.vendored_frameworks = 'XXXX/XXXX/**/*.framework'

  # 静态库.a
  # s.vendored_library = 'XXXX/XXX/XXX.a', 'YYY/YYY/Y.a'

  # 是否打包为静态库（同时支持Swift和Objective-C）
  # s.static_framework = true

end
