# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "Toast"
  s.version      = "4.0.0"
  s.summary      = "A UIView category that adds Android-style toast notifications to iOS."
  s.homepage     = "https://github.com/scalessec/Toast"
  s.license      = 'MIT'
  s.author       = { "Charles Scalesse" => "scalessec@gmail.com" }
  s.source       = { :git => "https://github.com/scalessec/Toast.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files = 'Toast', 'Toast-Framework/Toast.h'
  s.framework    = 'QuartzCore'
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/Toast-#{s.version}-SCF50.zip",
    sha256: '9333c7f846f46995b7b53271894640448574d8bab4107cb83a2c34fb4e6dd401'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Toast.framework/*'
    sc.source_files = 'Toast.framework/Headers/*.h'
    sc.public_header_files = 'Toast.framework/Headers/*.h'
    sc.vendored_frameworks = 'Toast.framework'
  end
end
