# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsAbstractions'
  s.summary               = 'The core abstractions and public protocols used for iOS application development.'
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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Abstractions/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'SWIFT_VERSION' => '4.0'
  }

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftCommonsAbstractions-1.1.0-SCF.zip',
    sha256: 'adc4577b6d25fb3c93a4667d93e47296d8dfc462498de065001c63638d6088eb'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsAbstractions.framework/*'
    sc.source_files = 'SwiftCommonsAbstractions.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsAbstractions.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsAbstractions.framework'
  end
end
