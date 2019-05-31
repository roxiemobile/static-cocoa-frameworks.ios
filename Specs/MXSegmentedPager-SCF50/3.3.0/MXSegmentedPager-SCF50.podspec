#
# Be sure to run `pod lib lint MXSegmentedPager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MXSegmentedPager"
  s.version          = "3.3.0"
  s.summary          = "Segmented pager view with Parallax header."
  s.description      = <<-DESC
                       MXSegmentedPager combines [MXPagerView](https://github.com/maxep/MXPagerView) with [HMSegmentedControl](https://github.com/HeshamMegid/HMSegmentedControl) to control the page selection.
                       The integration of [MXParallaxHeader](https://github.com/maxep/MXParallaxHeader) allows you to add an parallax header on top while keeping a reliable scrolling effect.
                       DESC

  s.homepage         = "https://github.com/maxep/MXSegmentedPager"
  s.license          = 'MIT'
  s.author           = { "Maxime Epain" => "maxime.epain@gmail.com" }
  s.source           = { :git => "https://github.com/maxep/MXSegmentedPager.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MaximeEpain'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'MXSegmentedPager/*.{m,h}'
  s.public_header_files = ["MXSegmentedPager/*.h"]
=begin
  s.dependency 'HMSegmentedControl', '1.5.3'
  s.dependency 'MXPagerView', '0.2.1'
  s.dependency 'MXParallaxHeader', '0.6.1'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/MXSegmentedPager-#{s.version}-SCF50.zip",
    sha256: '14aea36d64e6a95f76a9594d35c19025559475d40295a34830279e502e4e0891'
  }

  s.source_files = nil
  s.public_header_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'MXSegmentedPager.framework/*'
    sc.source_files = 'MXSegmentedPager.framework/Headers/*.h'
    sc.public_header_files = 'MXSegmentedPager.framework/Headers/*.h'
    sc.vendored_frameworks = 'MXSegmentedPager.framework'

    # Dependencies
    sc.dependency 'HMSegmentedControl-SCF50', '~> 1.5.5'
    sc.dependency 'MXPagerView-SCF50', '~> 0.2.1'
    sc.dependency 'MXParallaxHeader-SCF50', '~> 0.6.1'
  end
end
