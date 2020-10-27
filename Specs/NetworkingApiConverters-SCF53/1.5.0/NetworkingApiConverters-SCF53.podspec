# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiConverters'
  s.summary               = 'A collection of useful converters for the asynchronous REST API client.'
  s.version               = '1.5.0'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '5.3'

  s.cocoapods_version     = '>= 1.10.0'
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
  s.dependency 'SwiftCommons/Data', '~> 1.5.0'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/NetworkingApiConverters-#{s.version}-SCF53.zip",
    sha256: 'd700cdc40e846c09af2d38bb3163480e7fb46bc276f777c073b5880d4ec32b30'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiConverters.framework/*'
    sc.source_files = 'NetworkingApiConverters.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiConverters.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiConverters.framework'

    # Dependencies
    sc.dependency 'NetworkingApiRest-SCF53', s.version.to_s
    sc.dependency 'SwiftCommons-SCF53/Data', '~> 1.5.0'
  end
end
