# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "MBProgressHUD"
  s.version      = "1.1.0"
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    MBProgressHUD is an iOS drop-in class that displays a translucent HUD 
                    with an indicator and/or labels while work is being done in a background thread. 
                    The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD 
                    with some additional features.
                   DESC
  s.homepage     = "http://www.bukovinski.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Matej Bukovinski' => 'matej@bukovinski.com' }
  s.source       = { :git => "https://github.com/matej/MBProgressHUD.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = '*.{h,m}'
  s.frameworks   = "CoreGraphics", "QuartzCore"
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/MBProgressHUD-1.1.0-SCF.zip',
    sha256: '3f09540634e7d14312b367ce98ea3e0cbaf1c2daf638077d465d075afaeaf8ed'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'MBProgressHUD.framework/*'
    sc.source_files = 'MBProgressHUD.framework/Headers/*.h'
    sc.public_header_files = 'MBProgressHUD.framework/Headers/*.h'
    sc.vendored_frameworks = 'MBProgressHUD.framework'
  end
end
