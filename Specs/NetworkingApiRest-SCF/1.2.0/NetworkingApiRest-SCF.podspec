# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiRest'
  s.summary               = 'An asynchronous REST API client that makes an access to a RESTful Web Services easier.'
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

  base_dir = 'Modules/RoxieMobile.NetworkingApi/Sources/Rest/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'Alamofire', '~> 4.7.0'
  s.dependency 'NetworkingApiHelpers', s.version.to_s
  s.dependency 'NetworkingApiObjC', s.version.to_s
  s.dependency 'SwiftCommons/Data', '~> 1.2.5'
  s.dependency 'SwiftyJSON', '~> 4.0.0'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/NetworkingApiRest-1.2.0-SCF.zip',
    sha256: '76c2117da3d5e96ac2bf711dee62d3ffa01f6e90eae4666672620a339bbc7d33'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiRest.framework/*'
    sc.source_files = 'NetworkingApiRest.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiRest.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiRest.framework'

    # Dependencies
    sc.dependency 'Alamofire-SCF', '~> 4.7.0'
    sc.dependency 'NetworkingApiHelpers-SCF', s.version.to_s
    sc.dependency 'NetworkingApiObjC-SCF', s.version.to_s
    sc.dependency 'SwiftCommons-SCF/Data', '~> 1.2.5'
    sc.dependency 'SwiftyJSON-SCF', '~> 4.0.0'
  end
end
