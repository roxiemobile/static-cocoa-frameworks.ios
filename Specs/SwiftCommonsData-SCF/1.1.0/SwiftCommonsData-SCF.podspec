# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsData'
  s.summary               = 'A collection of reusable components used to simplify serialization, deserialization and validation operations on data objects.'
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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Data/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'SWIFT_VERSION' => '4.0'
  }

# MARK: - Dependencies

=begin
  s.dependency 'CryptoSwift', '~> 0.8.0'
  s.dependency 'SwiftCommonsDiagnostics', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftCommonsData-1.1.0-SCF.zip',
    sha256: '675d9a07bfbd4c3e51f0feb0dda78dabd0d8c7c4e24d75a58814fc0426b6ffb6'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsData.framework/*'
    sc.source_files = 'SwiftCommonsData.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsData.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsData.framework'

    # Dependencies
    sc.dependency 'CryptoSwift-SCF', '~> 0.8.0'
    sc.dependency 'SwiftCommonsDiagnostics-SCF', s.version.to_s
  end
end
