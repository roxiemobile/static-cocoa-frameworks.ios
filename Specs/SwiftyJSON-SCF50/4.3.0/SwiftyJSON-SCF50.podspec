# coding: utf-8
Pod::Spec.new do |s|
  s.name        = "SwiftyJSON"
  s.version     = "4.3.0"
  s.summary     = "SwiftyJSON makes it easy to deal with JSON data in Swift"
  s.homepage    = "https://github.com/SwiftyJSON/SwiftyJSON"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "lingoerer@gmail.com", "tangplin" => "tangplin@gmail.com" }

  s.requires_arc = true
  s.swift_version = "5.0"
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/SwiftyJSON/SwiftyJSON.git", :tag => s.version }
  s.source_files = "Source/SwiftyJSON/*.swift"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftyJSON-#{s.version}-SCF50.zip",
    sha256: '9f24b2c99637c56f5388fa279ee2bd0e1626c0489a4d3b909bc82e7f8ed29f2c'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftyJSON.framework/*'
    sc.source_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.public_header_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftyJSON.framework'
  end
end
