Pod::Spec.new do |s|
  s.name         = "SlideMenuControllerSwift"
  s.version      = "4.0.0"
  s.summary      = "iOS Slide View based on iQON, Feedly, Google+, Ameba iPhone app."
  s.homepage     = "https://github.com/dekatotoro/SlideMenuControllerSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Yuji Hato" => "hatoyujidev@gmail.com" }
  s.social_media_url   = "https://twitter.com/dekatotoro"
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/dekatotoro/SlideMenuControllerSwift.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.requires_arc = true

# MARK: - iOS Static Framework

  patch_version = "#{s.version}-patch.2"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.license = {}
  s.static_framework = true

  s.source = {
    git: 'https://github.com/roxiemobile-forks/SlideMenuControllerSwift.git',
    tag: patch_version
  }

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{patch_version}/#{pt}" }
end
