Pod::Spec.new do |s|

  s.name         = "MPMessagePack"
  s.version      = "1.5.1"
  s.summary      = "Library for MessagePack"
  s.homepage     = "https://github.com/gabriel/MPMessagePack"
  s.license      = { :type => "MIT" }
  s.authors       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/MPMessagePack.git", :tag => s.version.to_s }
  s.requires_arc = true

  s.dependency "GHODictionary"

  s.ios.deployment_target = "6.0"
  s.ios.source_files = "MPMessagePack/**/*.{c,h,m}", "RPC/**/*.{c,h,m}"

  s.osx.deployment_target = "10.8"
  s.osx.source_files = "MPMessagePack/**/*.{c,h,m}", "RPC/**/*.{c,h,m}", "XPC/**/*.{c,h,m}"

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.license = {}
  s.static_framework = true

  cn = s.consumer(:ios)
  s.ios.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
end
