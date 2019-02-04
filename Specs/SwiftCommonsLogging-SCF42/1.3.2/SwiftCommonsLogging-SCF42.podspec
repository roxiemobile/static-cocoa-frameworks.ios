# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsLogging'
  s.summary               = 'Provides simple abstraction layer over an existing logging frameworks.'
  s.version               = '1.3.2'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.2'

  s.cocoapods_version     = '>= 1.4.0'
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
  s.name = "#{s.name}-SCF42"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftCommonsLogging-#{s.version}-SCF42.zip",
    sha256: 'e57e8952a8549c05ff0ad7fc0337fd1299420b0b8bd7b491589db5ba9c3c0c18'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsLogging.framework/*'
    sc.source_files = 'SwiftCommonsLogging.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsLogging.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsLogging.framework'

    # Dependencies
    sc.dependency 'SwiftCommonsConcurrent-SCF42', s.version.to_s
    sc.dependency 'SwiftCommonsLang-SCF42', s.version.to_s
  end
end
