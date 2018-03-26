# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiConverters'
  s.summary               = 'A collection of useful converters for the asynchronous REST API client.'
  s.version               = '1.2.0'

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
  s.dependency 'SwiftCommons/Data', '~> 1.2.5'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/NetworkingApiConverters-1.2.0-SCF.zip',
    sha256: '8bcb722841b0212454bdb9350a1488a2535206bb0dd36951d2f7933f09f98e49'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiConverters.framework/*'
    sc.source_files = 'NetworkingApiConverters.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiConverters.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiConverters.framework'

    # Dependencies
    sc.dependency 'NetworkingApiRest-SCF', s.version.to_s
    sc.dependency 'SwiftCommons-SCF/Data', '~> 1.2.5'
  end
end
