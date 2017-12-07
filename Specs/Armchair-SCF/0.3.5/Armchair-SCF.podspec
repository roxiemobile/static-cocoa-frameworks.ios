Pod::Spec.new do |s|

  s.name                  = "Armchair"
  s.version               = "0.3.5"
  s.summary               = "A simple yet powerful App Review Manager for iOS and OSX in Swift"
  s.description           = <<-DESC
                            A simple yet powerful App Review Manager for iOS and OSX in Swift.
                            * 100% Swift
                            * Both iOS and OS X Support
                            * Fully Configurable at Runtime
                            * Default Localizations for Dozens of Languages
                            * Prevent Rating Prompts on Different Devices
                            * Uses UIApplication/NSApplication Lifecycle Notifications
                            * Easy to Setup
                            * iTunes Affiliate Codes
                            * Ready For Primetime
                            DESC
  s.homepage              = "https://github.com/UrbanApps/Armchair"
  s.screenshots           = "https://raw.githubusercontent.com/UrbanApps/Armchair/assets/armchair-iOS.png", "https://raw.githubusercontent.com/UrbanApps/Armchair/assets/armchair-OSX.png"
  s.social_media_url      = 'https://twitter.com/coneybeare'
  s.authors               = { 'Matt Coneybeare' => 'coneybeare@urbanapps.com' }
  s.source                = { :git => 'https://github.com/UrbanApps/Armchair.git', :tag => s.version }

  s.license               = { :type => "MIT", :file => "LICENSE" }
  
  s.source_files          = "Source/*.{h,swift}"
  s.resources             = "Localization/*.lproj"
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.requires_arc          = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/Armchair-0.3.5-patch.1-SCF.zip',
    sha256: '247653b26392d0ca4c8819f63ecc3884ecbbf144db37f69f9a1206a152a3e238'
  }

  s.source_files = nil
  s.resources = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Armchair.framework/*'
    sc.source_files = 'Armchair.framework/Headers/*.h'
    sc.public_header_files = 'Armchair.framework/Headers/*.h'
    sc.vendored_frameworks = 'Armchair.framework'
    sc.resources = 'Armchair.framework/Resources/Localization/*.lproj'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
