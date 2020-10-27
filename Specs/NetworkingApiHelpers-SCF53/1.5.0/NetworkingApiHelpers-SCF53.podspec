# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiHelpers'
  s.summary               = 'A collection of utility classes used by other modules of this library.'
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

  base_dir = 'Modules/RoxieMobile.NetworkingApi/Sources/Helpers/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'Alamofire', '~> 4.9.1'
  s.dependency 'NetworkingApiHttp', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/NetworkingApiHelpers-#{s.version}-SCF53.zip",
    sha256: 'e36429b2e81dad52321d40b208eab58139ad8558f59a848a4e912d17609899ca'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiHelpers.framework/*'
    sc.source_files = 'NetworkingApiHelpers.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiHelpers.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiHelpers.framework'

    # Dependencies
    sc.dependency 'Alamofire-SCF53', '~> 4.9.1'
    sc.dependency 'NetworkingApiHttp-SCF53', s.version.to_s
  end
end
