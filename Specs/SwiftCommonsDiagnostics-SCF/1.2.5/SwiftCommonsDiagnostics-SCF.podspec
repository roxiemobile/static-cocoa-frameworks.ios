# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsDiagnostics'
  s.summary               = 'A collection of static classes for debugging and diagnostics of program contracts such as preconditions, postconditions, and invariants.'
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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Diagnostics/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'SwiftCommonsConcurrent', s.version.to_s
  s.dependency 'SwiftCommonsExtensions', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftCommonsDiagnostics-1.2.5-SCF.zip',
    sha256: '07c193d16a0fb5139322c615919be97c2dc3ab8685697526318e77c4c8dfd734'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsDiagnostics.framework/*'
    sc.source_files = 'SwiftCommonsDiagnostics.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsDiagnostics.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsDiagnostics.framework'

    # Dependencies
    sc.dependency 'SwiftCommonsConcurrent-SCF', s.version.to_s
    sc.dependency 'SwiftCommonsExtensions-SCF', s.version.to_s
  end
end
