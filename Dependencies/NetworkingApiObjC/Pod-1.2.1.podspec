# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'NetworkingApiObjC'
  s.summary               = 'A collection of Objective-C frameworks, utility classes and 3rd party libraries used by other modules of this library.'
  s.version               = '1.2.1'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.2'

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

  base_dir = 'Modules/RoxieMobile.NetworkingApi/Sources/ObjC/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.{h,m,c}'

  s.public_header_files = [
    base_dir + 'Sources/DefaultUserAgent.h'
  ]

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) NETWORKINGAPI_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

  s.dependency 'Alamofire', '~> 4.7.0'

# MARK: - iOS Static Framework

  s.license = {}

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.public_header_files = cn.public_header_files.map { |pt| "#{cn.version}/#{pt}" }
end
