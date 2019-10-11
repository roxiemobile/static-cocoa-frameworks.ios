# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommons'
  s.summary               = 'A collection of useful utility classes common to different iOS projects.'
  s.version               = '1.4.0'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.2'

  s.cocoapods_version     = '>= 1.7.5'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: s.version.to_s
  }

# MARK: - Modules

  # The core abstractions and public protocols used for iOS application development.
  s.subspec 'Abstractions' do |sp|
=begin
    sp.dependency 'SwiftCommonsAbstractions', s.version.to_s
=end
    sp.dependency 'SwiftCommonsAbstractions-SCF42', s.version.to_s
  end

  # A collection of reusable components used to simplify the work of writing concurrent and asynchronous code.
  s.subspec 'Concurrent' do |sp|
=begin
    sp.dependency 'SwiftCommonsConcurrent', s.version.to_s
=end
    sp.dependency 'SwiftCommonsConcurrent-SCF42', s.version.to_s
  end

  # A collection of reusable components used to simplify serialization, deserialization and validation operations on data objects.
  s.subspec 'Data' do |sp|
=begin
    sp.dependency 'SwiftCommonsData', s.version.to_s
=end
    sp.dependency 'SwiftCommonsData-SCF42', s.version.to_s
  end

  # A collection of static classes for debugging and diagnostics of program contracts such as preconditions, postconditions, and invariants.
  s.subspec 'Diagnostics' do |sp|
=begin
    sp.dependency 'SwiftCommonsDiagnostics', s.version.to_s
=end
    sp.dependency 'SwiftCommonsDiagnostics-SCF42', s.version.to_s
  end

  # A collection of useful type extensions used for iOS application development.
  s.subspec 'Extensions' do |sp|
=begin
    sp.dependency 'SwiftCommonsExtensions', s.version.to_s
=end
    sp.dependency 'SwiftCommonsExtensions-SCF42', s.version.to_s
  end

  # A collection of useful classes and Swift language extensions.
  s.subspec 'Lang' do |sp|
=begin
    sp.dependency 'SwiftCommonsLang', s.version.to_s
=end
    sp.dependency 'SwiftCommonsLang-SCF42', s.version.to_s
  end

  # Provides simple abstraction layer over an existing logging frameworks.
  s.subspec 'Logging' do |sp|
=begin
    sp.dependency 'SwiftCommonsLogging', s.version.to_s
=end
    sp.dependency 'SwiftCommonsLogging-SCF42', s.version.to_s
  end

  # A collection of Objective-C frameworks, utility classes and 3rd party libraries used by other modules of this library.
  s.subspec 'ObjC' do |sp|
=begin
    sp.dependency 'SwiftCommonsObjC', s.version.to_s
=end
    sp.dependency 'SwiftCommonsObjC-SCF42', s.version.to_s
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftCommons-#{s.version}-SCF42.zip",
    sha256: '1326ad5b313961072a6670f5647127aca809a7cf110305ff5b90fc3fa4c2ef29'
  }
end
