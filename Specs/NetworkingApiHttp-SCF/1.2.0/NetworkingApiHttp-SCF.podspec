# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiHttp'
  s.summary               = 'A collection of useful type extensions and utility classes used for communication over HTTP protocol.'
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

  base_dir = 'Modules/RoxieMobile.NetworkingApi/Sources/Http/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'SwiftCommons/Diagnostics', '~> 1.2.5'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/NetworkingApiHttp-1.2.0-SCF.zip',
    sha256: 'b49435b6edf9f940667b4f7104f087089e8a60d1f07f242795a403c638a86e20'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'NetworkingApiHttp.framework/*'
    sc.source_files = 'NetworkingApiHttp.framework/Headers/*.h'
    sc.public_header_files = 'NetworkingApiHttp.framework/Headers/*.h'
    sc.vendored_frameworks = 'NetworkingApiHttp.framework'

    # Dependencies
    sc.dependency 'SwiftCommons-SCF/Diagnostics', '~> 1.2.5'
  end
end
