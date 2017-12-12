# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiHelpers'
  s.summary               = 'A collection of utility classes used by other modules of this library.'
  s.version               = '1.1.2'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.cocoapods_version     = '>= 1.4.0.beta.2'
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
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'SWIFT_VERSION' => '4.0'
  }

# MARK: - Dependencies

=begin
  s.dependency 'Alamofire', '~> 4.6.0'
  s.dependency 'NetworkingApiHttp', s.version.to_s
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/NetworkingApiHelpers-1.1.2-SCF.zip',
    sha256: '9582c70870893d089f2f6621e617a75b44045ac3220852e722ccbb631a02aefd'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiHelpers.framework/*'
    sc.source_files = 'NetworkingApiHelpers.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiHelpers.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiHelpers.framework'

    # Dependencies
    sc.dependency 'Alamofire-SCF', '~> 4.6.0'
    sc.dependency 'NetworkingApiHttp-SCF', s.version.to_s
  end
end
