# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiRest'
  s.summary               = 'An asynchronous REST API client that makes an access to a RESTful Web Services easier.'
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

  base_dir = 'Modules/RoxieMobile.NetworkingApi/Sources/Rest/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'Alamofire', '~> 4.9.1'
  s.dependency 'NetworkingApiHelpers', s.version.to_s
  s.dependency 'NetworkingApiObjC', s.version.to_s
  s.dependency 'SwiftCommons/Data', '~> 1.5.0'
  s.dependency 'SwiftyJSON', '~> 5.0.0'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/NetworkingApiRest-#{s.version}-SCF53.zip",
    sha256: '5e1a56b7682aac13050a2bddaae0088f72d0d077e2362b414bdb48feca239012'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiRest.framework/*'
    sc.source_files = 'NetworkingApiRest.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiRest.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiRest.framework'

    # Dependencies
    sc.dependency 'Alamofire-SCF53', '~> 4.9.1'
    sc.dependency 'NetworkingApiHelpers-SCF53', s.version.to_s
    sc.dependency 'NetworkingApiObjC-SCF53', s.version.to_s
    sc.dependency 'SwiftCommons-SCF53/Data', '~> 1.5.0'
    sc.dependency 'SwiftyJSON-SCF53', '~> 5.0.0'
  end
end
