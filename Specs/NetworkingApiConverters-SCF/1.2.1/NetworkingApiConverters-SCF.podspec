# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiConverters'
  s.summary               = 'A collection of useful converters for the asynchronous REST API client.'
  s.version               = '1.2.1'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.0'

  s.cocoapods_version     = '>= 1.4.0'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/networking-api.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com', 'Denis Kolyasev' => 'kolyasevda@ekassir.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/networking-api.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.NetworkingApi/Sources/Converters/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'NetworkingApiRest', s.version.to_s
  s.dependency 'SwiftCommons/Data', '~> 1.2.6'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/NetworkingApiConverters-1.2.1-SCF.zip',
    sha256: 'f0fbe6554c1714902b2df12e617dd29f98622d8419557dfcb7feaba6100f7498'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiConverters.framework/*'
    sc.source_files = 'NetworkingApiConverters.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiConverters.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiConverters.framework'

    # Dependencies
    sc.dependency 'NetworkingApiRest-SCF', s.version.to_s
    sc.dependency 'SwiftCommons-SCF/Data', '~> 1.2.6'
  end
end
