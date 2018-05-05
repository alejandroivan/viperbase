# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'ott' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for ott
  pod 'Alamofire', '~> 4.7'
  pod 'AlamofireImage', '~> 3.3'
  pod 'BmoViewPager', '~> 4.0.0' # https://github.com/tzef/BmoViewPager
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git' # https://github.com/ViccAlexander/Chameleon
#  pod 'Charts' # https://github.com/danielgindi/Charts
#  pod 'CocoaLumberjack/Swift' # https://github.com/CocoaLumberjack/CocoaLumberjack
#  pod 'CryptoSwift' # https://github.com/krzyzanowskim/CryptoSwift
#  pod 'FSCalendar' # https://github.com/WenchaoD/FSCalendar
#  pod 'ImageViewer' # https://github.com/MailOnline/ImageViewer
#  pod 'Moya', '~> 11.0' # https://github.com/Moya/Moya
  pod 'ParallaxHeader', '~> 2.0.0' # https://github.com/romansorochak/ParallaxHeader
#  pod 'PromiseKit', '~> 6.0' # https://github.com/mxcl/PromiseKit
#  pod 'RandomKit', '~> 5.2' # https://github.com/nvzqz/RandomKit
#  pod 'RGPageViewController' # https://github.com/eRGoon/RGPageViewController
  pod 'SideMenu'
#  pod 'Sparrow/Modules/RequestPermission', :git => 'https://github.com/IvanVorobei/Sparrow.git' # https://github.com/IvanVorobei/RequestPermission
  pod 'SwiftyJSON', '~> 4.0'

  target 'ottTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ottUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end


## Post install hook
post_install do |pi|
    pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
#            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
