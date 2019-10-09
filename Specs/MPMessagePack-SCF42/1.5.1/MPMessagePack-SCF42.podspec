Pod::Spec.new do |s|

  s.name         = "MPMessagePack"
  s.version      = "1.5.1"
  s.summary      = "Library for MessagePack"
  s.homepage     = "https://github.com/gabriel/MPMessagePack"
  s.license      = { :type => "MIT" }
  s.authors       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/MPMessagePack.git", :tag => s.version.to_s }
  s.requires_arc = true

=begin
  s.dependency "GHODictionary"
=end

  s.ios.deployment_target = "6.0"
  s.ios.source_files = "MPMessagePack/**/*.{c,h,m}", "RPC/**/*.{c,h,m}"

  s.osx.deployment_target = "10.8"
  s.osx.source_files = "MPMessagePack/**/*.{c,h,m}", "RPC/**/*.{c,h,m}", "XPC/**/*.{c,h,m}"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/MPMessagePack-#{s.version}-SCF42.zip",
    sha256: 'fb45cbda52af541523caf42c0be6a4ed2ec159e4155120610be13ec782e2518d'
  }

  s.ios.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'MPMessagePack.framework/*'
    sc.source_files = 'MPMessagePack.framework/Headers/*.h'
    sc.public_header_files = 'MPMessagePack.framework/Headers/*.h'
    sc.vendored_frameworks = 'MPMessagePack.framework'

    # Dependencies
    sc.dependency 'GHODictionary-SCF42', '~> 1.1.0'
  end
end
