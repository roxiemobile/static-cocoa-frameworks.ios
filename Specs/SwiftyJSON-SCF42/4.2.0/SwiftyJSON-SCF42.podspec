Pod::Spec.new do |s|
  s.name        = "SwiftyJSON"
  s.version     = "4.2.0"
  s.summary     = "SwiftyJSON makes it easy to deal with JSON data in Swift"
  s.homepage    = "https://github.com/SwiftyJSON/SwiftyJSON"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "lingoerer@gmail.com", "tangplin" => "tangplin@gmail.com" }

  s.requires_arc = true
  s.swift_version = "4.2"
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/SwiftyJSON/SwiftyJSON.git", :tag => s.version }
  s.source_files = "Source/*.swift"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftyJSON-4.2.0-SCF42.zip',
    sha256: 'af8fd8ef8e5b6636ee5d0eb874935edd6b16324db966a499a3334dc2092bb38c'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftyJSON.framework/*'
    sc.source_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.public_header_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftyJSON.framework'
  end
end
