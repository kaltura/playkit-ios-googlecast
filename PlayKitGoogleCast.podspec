# suffix = '-dev'   # Dev mode
suffix = ''       # Release

Pod::Spec.new do |s|
  
  s.name             = 'PlayKitGoogleCast'
  s.version          = '1.3.1' + suffix
  s.summary          = 'PlayKitGoogleCast -- Google cast framework for iOS'
  s.homepage         = 'https://github.com/kaltura/playkit-ios-googlecast'
  s.license          = { :type => 'AGPLv3', :file => 'LICENSE' }
  s.author           = { 'Kaltura' => 'community@kaltura.com' }
  s.source           = { :git => 'https://github.com/kaltura/playkit-ios-googlecast.git', :tag => 'v' + s.version.to_s }  
  s.source_files = 'Sources/**/*'
  
  s.swift_version     = '5.0'
  s.static_framework = true

  s.ios.deployment_target = '9.0'

  s.xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -framework "GoogleCast"',
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}"/**',
    'LIBRARY_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}"/**'
  }

  s.dependency 'google-cast-sdk', '4.4.4'
  s.dependency 'XCGLogger', '7.0.0'
end

