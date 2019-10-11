# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsConcurrent'
  s.summary               = 'A collection of reusable components used to simplify the work of writing concurrent and asynchronous code.'
  s.version               = '1.4.0'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.2'

  s.cocoapods_version     = '>= 1.7.5'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Concurrent/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'Dispatch', '~> 2.0.4'
  s.dependency 'SwiftCommonsObjC', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftCommonsConcurrent-#{s.version}-SCF42.zip",
    sha256: '0eb59e94056158748a8c93a1a09fc0b26569e2bfc761e1d850eae92e6c574746'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsConcurrent.framework/*'
    sc.source_files = 'SwiftCommonsConcurrent.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsConcurrent.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsConcurrent.framework'

    # Dependencies
    sc.dependency 'Dispatch-SCF42', '~> 2.0.4'
    sc.dependency 'SwiftCommonsObjC-SCF42', s.version.to_s
  end
end
