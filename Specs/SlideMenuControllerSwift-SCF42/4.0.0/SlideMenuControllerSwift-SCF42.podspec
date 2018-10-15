Pod::Spec.new do |s|
  s.name         = "SlideMenuControllerSwift"
  s.version      = "4.0.0"
  s.summary      = "iOS Slide View based on iQON, Feedly, Google+, Ameba iPhone app."
  s.homepage     = "https://github.com/dekatotoro/SlideMenuControllerSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Yuji Hato" => "hatoyujidev@gmail.com" }
  s.social_media_url   = "https://twitter.com/dekatotoro"
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/dekatotoro/SlideMenuControllerSwift.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.requires_arc = true

# MARK: - iOS Static Framework

  patch_version = "#{s.version}-patch.2"

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SlideMenuControllerSwift-#{patch_version}-SCF42.zip",
    sha256: '2c68e71ef5871901c560377449c4c617066a424221d5c7dd1e3952ed54c641e8'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SlideMenuControllerSwift.framework/*'
    sc.source_files = 'SlideMenuControllerSwift.framework/Headers/*.h'
    sc.public_header_files = 'SlideMenuControllerSwift.framework/Headers/*.h'
    sc.vendored_frameworks = 'SlideMenuControllerSwift.framework'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
