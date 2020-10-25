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

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.3'

  s.license = {}
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
end
