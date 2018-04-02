# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsObjC'
  s.summary               = 'A collection of Objective-C frameworks, utility classes and 3rd party libraries used by other modules of this library.'
  s.version               = '1.2.6'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.0'

  s.cocoapods_version     = '>= 1.4.0'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/ObjC/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.{h,m,c}'

  s.public_header_files = [
    # SSZipArchive
    base_dir + 'Sources/SSZipArchive/SSZipArchive.h',
    base_dir + 'Sources/SSZipArchive/SSZipArchiveDelegate.h',
    base_dir + 'Sources/SSZipArchive/minizip/unzip.h',
    base_dir + 'Sources/SSZipArchive/minizip/ioapi.h',
    # StreamTypedCoder
    base_dir + 'Sources/StreamTypedCoder/StreamTypedCoder.h',
    # TryCatchFinally
    base_dir + 'Sources/TryCatchFinally/TryCatchFinally.h'
  ]

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftCommonsObjC-1.2.6-SCF.zip',
    sha256: '0eb7365c1adcf8997b76754915ea2f96522bd8e4d5c835679688499badb6dc0f'
  }

  s.source_files = nil
  s.public_header_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftCommonsObjC.framework/*'
    sc.source_files = 'SwiftCommonsObjC.framework/Headers/*.h'
    sc.public_header_files = 'SwiftCommonsObjC.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftCommonsObjC.framework'
  end
end
