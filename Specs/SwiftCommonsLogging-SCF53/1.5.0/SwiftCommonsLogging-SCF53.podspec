# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsLogging'
  s.summary               = 'Provides simple abstraction layer over an existing logging frameworks.'
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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Logging/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'SwiftCommonsConcurrent', s.version.to_s
  s.dependency 'SwiftCommonsLang', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftCommonsLogging-#{s.version}-SCF53.zip",
    sha256: 'd5231b2d1adcdf80191a87f9b2ec6421740192e6bfef69862a76b3e64d3f46ce'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsLogging.framework/*'
    sc.source_files = 'SwiftCommonsLogging.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsLogging.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsLogging.framework'

    # Dependencies
    sc.dependency 'SwiftCommonsConcurrent-SCF53', s.version.to_s
    sc.dependency 'SwiftCommonsLang-SCF53', s.version.to_s
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
