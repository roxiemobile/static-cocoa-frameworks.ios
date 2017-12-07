# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsLogging'
  s.summary               = 'Provides simple abstraction layer over an existing logging frameworks.'
  s.version               = '1.1.0'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.cocoapods_version     = '>= 1.4.0.beta.2'
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
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'SWIFT_VERSION' => '4.0'
  }

# MARK: - Dependencies

=begin
  s.dependency 'SwiftCommonsConcurrent', s.version.to_s
  s.dependency 'SwiftCommonsLang', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftCommonsLogging-1.1.0-SCF.zip',
    sha256: 'a1a3dd07ac391594c8d022bbb0a2bdbcb77f74bbe5da4e9c554314a114776a6e'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsLogging.framework/*'
    sc.source_files = 'SwiftCommonsLogging.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsLogging.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsLogging.framework'

    # Dependencies
    sc.dependency 'SwiftCommonsConcurrent-SCF', s.version.to_s
    sc.dependency 'SwiftCommonsLang-SCF', s.version.to_s
  end
end
