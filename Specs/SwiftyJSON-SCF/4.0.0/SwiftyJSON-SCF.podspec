# coding: utf-8
Pod::Spec.new do |s|
  s.name        = "SwiftyJSON"
  s.version     = "4.0.0"
  s.summary     = "SwiftyJSON makes it easy to deal with JSON data in Swift"
  s.homepage    = "https://github.com/SwiftyJSON/SwiftyJSON"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "lingoerer@gmail.com", "tangplin" => "tangplin@gmail.com" }

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/SwiftyJSON/SwiftyJSON.git", :tag => s.version }
  s.source_files = "Source/*.swift"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftyJSON-4.0.0-SCF.zip',
    sha256: '2ed84082bcec04eff2fc42de1852c8e58e7169c3aed32f531ce1c58f4ed510fe'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftyJSON.framework/*'
    sc.source_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.public_header_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftyJSON.framework'
  end
end
