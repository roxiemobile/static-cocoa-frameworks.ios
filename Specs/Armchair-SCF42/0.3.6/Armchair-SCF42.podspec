Pod::Spec.new do |s|

  s.name                  = "Armchair"
  s.version               = "0.3.6"
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
  s.swift_version         = '4.2'

# MARK: - iOS Static Framework

  patch_version = "#{s.version}-patch.1"

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/Armchair-#{patch_version}-SCF42.zip",
    sha256: '23e76c8a0078e9b8760bc30c6f6db88189e81402ec21f93f16aa99c52f1fd462'
  }

  s.source_files = nil
  s.resources = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Armchair.framework/*'
    sc.source_files = 'Armchair.framework/Headers/*.h'
    sc.public_header_files = 'Armchair.framework/Headers/*.h'
    sc.vendored_frameworks = 'Armchair.framework'
    sc.resources = 'Armchair.framework/*.lproj'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
