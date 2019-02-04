# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsExtensions'
  s.summary               = 'A collection of useful type extensions used for iOS application development.'
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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Extensions/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'SwiftCommonsAbstractions', s.version.to_s
  s.dependency 'SwiftCommonsLogging', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftCommonsExtensions-#{s.version}-SCF42.zip",
    sha256: 'ec5fd19d4cf276900885b710e206d3930dd8dfcf9a7391620a5cf35f14886027'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsExtensions.framework/*'
    sc.source_files = 'SwiftCommonsExtensions.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsExtensions.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsExtensions.framework'

    # Dependencies
    sc.dependency 'SwiftCommonsAbstractions-SCF42', s.version.to_s
    sc.dependency 'SwiftCommonsLogging-SCF42', s.version.to_s
  end
end
