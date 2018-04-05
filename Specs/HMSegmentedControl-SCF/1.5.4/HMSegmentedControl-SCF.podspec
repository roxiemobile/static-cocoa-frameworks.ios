Pod::Spec.new do |s|
  s.name         = "HMSegmentedControl"
  s.version      = "1.5.4"
  s.summary      = "A drop-in replacement for UISegmentedControl mimicking the style of the one in Google Currents and various other Google products."
  s.homepage     = "https://github.com/HeshamMegid/HMSegmentedControl"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "Hesham Abd-Elmegid" => "hesham.abdelmegid@gmail.com" }
  s.source       = { :git => "https://github.com/HeshamMegid/HMSegmentedControl.git", :tag => "v1.5.4" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'HMSegmentedControl/*.{h,m}'
  s.framework  = 'QuartzCore'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/HMSegmentedControl-1.5.4-SCF.zip',
    sha256: '6f8f60f28fc2aa4d46c0e866f6c3c4ffab87cb2453f2f0d503ad20c73f240658'
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
