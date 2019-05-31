Pod::Spec.new do |s|
  s.name         = "HMSegmentedControl"
  s.version      = "1.5.5"
  s.summary      = "A drop-in replacement for UISegmentedControl mimicking the style of the one in Google Currents and various other Google products."
  s.homepage     = "https://github.com/HeshamMegid/HMSegmentedControl"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "Hesham Abd-Elmegid" => "hesham.abdelmegid@gmail.com" }
  s.source       = { :git => "https://github.com/HeshamMegid/HMSegmentedControl.git", :tag => "v1.5.5" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'HMSegmentedControl/*.{h,m}'
  s.framework  = 'QuartzCore'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/HMSegmentedControl-#{s.version}-SCF50.zip",
    sha256: 'bef043543f33fca4e105c0d377bcb83a43d356e30aa768020e7e8249aed2e25f'
  }

  s.source_files = nil
  s.ios.source_files = nil
  s.exclude_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'HMSegmentedControl.framework/*'
    sc.source_files = 'HMSegmentedControl.framework/Headers/*.h'
    sc.public_header_files = 'HMSegmentedControl.framework/Headers/*.h'
    sc.vendored_frameworks = 'HMSegmentedControl.framework'
  end
end
