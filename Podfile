install! 'cocoapods', :warn_for_unused_master_specs_repo => false
platform :ios, '13.0'

target 'Demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Demo
  pod 'Masonry', '1.1.0', :inhibit_warnings => true
  
  target 'DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DemoUITests' do
    # Pods for testing
  end
  
end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['CODE_SIGN_IDENTITY'] = ''
    end
  end
end
