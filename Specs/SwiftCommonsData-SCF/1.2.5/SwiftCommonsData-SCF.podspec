# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsData'
  s.summary               = 'A collection of reusable components used to simplify serialization, deserialization and validation operations on data objects.'
  s.version               = '1.2.5'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.0'

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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Data/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'CryptoSwift', '~> 0.8.3'
  s.dependency 'SwiftCommonsDiagnostics', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftCommonsData-1.2.5-SCF.zip',
    sha256: 'bb9ed083737cf1d825dccb6e793c3801fd15be3af7a66f54fc234514f1430291'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsData.framework/*'
    sc.source_files = 'SwiftCommonsData.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsData.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsData.framework'

    # Dependencies
    sc.dependency 'CryptoSwift-SCF', '~> 0.8.3'
    sc.dependency 'SwiftCommonsDiagnostics-SCF', s.version.to_s
  end
end
