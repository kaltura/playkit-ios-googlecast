suffix = '.0000'   # Dev mode
# suffix = ''       # Release

Pod::Spec.new do |s|
  
  s.name             = 'PlayKitGoogleCast'
  s.version          = '1.5.1' + suffix
  s.summary          = 'PlayKitGoogleCast -- Google cast framework for iOS'
  s.homepage         = 'https://github.com/kaltura/playkit-ios-googlecast'
  s.license          = { :type => 'AGPLv3', :file => 'LICENSE' }
  s.author           = { 'Kaltura' => 'community@kaltura.com' }
  s.source           = { :git => 'https://github.com/kaltura/playkit-ios-googlecast.git', :tag => 'v' + s.version.to_s }  
  s.source_files = 'Sources/**/*'
  
  s.swift_version     = '5.0'
  s.static_framework = true

  s.ios.deployment_target = '12.0'

  s.xcconfig = {
### The following is required for Xcode 12 (https://stackoverflow.com/questions/63607158/xcode-12-building-for-ios-simulator-but-linking-in-object-file-built-for-ios)
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.dependency 'google-cast-sdk', '4.7.0'
  s.dependency 'XCGLogger', '7.0.0'
end

