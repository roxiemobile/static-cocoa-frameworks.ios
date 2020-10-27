# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsObjC'
  s.summary               = 'A collection of Objective-C frameworks, utility classes and 3rd party libraries used by other modules of this library.'
  s.version               = '1.5.0'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '5.3'

  s.cocoapods_version     = '~> 1.10.0'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/ObjC/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.{h,m,c}'

  s.public_header_files = [
    # SSZipArchive
    base_dir + 'Sources/SSZipArchive/SSZipArchive.h',
    base_dir + 'Sources/SSZipArchive/SSZipArchiveDelegate.h',
    base_dir + 'Sources/SSZipArchive/minizip/unzip.h',
    base_dir + 'Sources/SSZipArchive/minizip/ioapi.h',
    # TryCatchFinally
    base_dir + 'Sources/TryCatchFinally/TryCatchFinally.h'
  ]

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftCommonsObjC-#{s.version}-SCF53.zip",
    sha256: 'bce8a265924432ca5ea110d09b5457f5093911baf6ab78ce6f9d14fbd7358be9'
  }

  s.source_files = nil
  s.public_header_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsObjC.framework/*'
    sc.source_files = 'SwiftCommonsObjC.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsObjC.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsObjC.framework'
  end

# MARK: - Validation

  # Why linker link static libraries with errors? iOS
  # @link https://stackoverflow.com/a/57126566

  # Xcode 12, building for iOS Simulator, but linking in object file built for iOS, for architecture arm64
  # @link https://stackoverflow.com/a/63955114

  s.user_target_xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift-5.0/$(PLATFORM_NAME) $(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  }
end
