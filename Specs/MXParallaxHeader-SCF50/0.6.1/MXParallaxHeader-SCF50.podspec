#
# Be sure to run `pod lib lint MXParallaxHeader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MXParallaxHeader"
  s.version          = "0.6.1"
  s.summary          = "Simple parallax header for UIScrollView."
  s.description      = <<-DESC
  							MXParallaxHeader is a simple header class for UIScrolView.

							In addition, MXScrollView is a UIScrollView subclass with the ability to hook the vertical scroll from its subviews, this can be used to add a parallax header to complex view hierachy.
							Moreover, MXScrollViewController allows you to add a MXParallaxHeader to any kind of UIViewController.
                       DESC

  s.homepage         = "https://github.com/maxep/MXParallaxHeader"
  s.license          = 'MIT'
  s.author           = { "Maxime Epain" => "maxime.epain@gmail.com" }
  s.source           = { :git => "https://github.com/maxep/MXParallaxHeader.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MaximeEpain'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'MXParallaxHeader/*.{m,h}'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/MXParallaxHeader-#{s.version}-SCF50.zip",
    sha256: 'c3abb9757ebd4930cf3b042f217caab125151e8d2d29d80e8639df7ad57ccacb'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'MXParallaxHeader.framework/*'
    sc.source_files = 'MXParallaxHeader.framework/Headers/*.h'
    sc.public_header_files = 'MXParallaxHeader.framework/Headers/*.h'
    sc.vendored_frameworks = 'MXParallaxHeader.framework'
  end
end
