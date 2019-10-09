Pod::Spec.new do |s|

  s.name         = "GHODictionary"
  s.version      = "1.1.0"
  s.summary      = "Ordered dictionary."
  s.homepage     = "https://github.com/gabriel/GHODictionary"
  s.license      = { :type => "MIT" }
  s.author       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/GHODictionary.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = "GHODictionary/**/*.{c,h,m}"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/GHODictionary-#{s.version}-SCF42.zip",
    sha256: 'c3ed10793108cf8f57768db41e02ab2fa763f257fa546e19e240eea74b439117'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'GHODictionary.framework/*'
    sc.source_files = 'GHODictionary.framework/Headers/*.h'
    sc.public_header_files = 'GHODictionary.framework/Headers/*.h'
    sc.vendored_frameworks = 'GHODictionary.framework'
  end
end
