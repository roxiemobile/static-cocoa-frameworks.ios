Pod::Spec.new do |s|
  s.name         = 'Bolts'
  s.version      = '1.9.0'
  s.summary      = 'Bolts is a collection of low-level libraries designed to make developing mobile apps easier.'
  s.description  = <<-DESC
                    Bolts was designed by Parse and Facebook for our own internal use, and we have decided to open source these libraries to make them available to others. Using these libraries does not require using any Parse services. Nor do they require having a Parse or Facebook developer account.

                    The first component in Bolts is "tasks", which make organization of complex asynchronous code more manageable. A task is kind of like a JavaScript Promise, but available for iOS and Android.
                   DESC
  s.homepage     = 'https://github.com/BoltsFramework'
  s.authors      = { 'Nikita Lutsenko' => 'nlutsenko@me.com' }
  s.license      = 'BSD'
  s.source       = { :git => 'https://github.com/BoltsFramework/Bolts-ObjC.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ParseIt'
  s.requires_arc = true

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.8'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.subspec 'Tasks' do |ss|
=begin
    ss.ios.source_files = 'Bolts/Common/*.[hm]'
    ss.ios.public_header_files = 'Bolts/Common/*.h'

    ss.osx.source_files = 'Bolts/Common/*.[hm]'
    ss.osx.public_header_files = 'Bolts/Common/*.h'

    ss.watchos.source_files = 'Bolts/Common/*.[hm]'
    ss.watchos.public_header_files = 'Bolts/Common/*.h'

    ss.tvos.source_files = 'Bolts/Common/*.[hm]'
    ss.tvos.public_header_files = 'Bolts/Common/*.h'
=end
    ss.dependency "#{s.name}-SCF42/StaticCocoaFramework", s.version.to_s
  end

  s.subspec 'AppLinks' do |ss|
=begin
    ss.ios.deployment_target = '8.0'
    ss.dependency 'Bolts/Tasks'

    ss.ios.source_files = 'Bolts/iOS/**/*.[hm]'
    ss.ios.public_header_files = 'Bolts/iOS/*.h'
    ss.osx.source_files = ''
    ss.watchos.source_files = ''
    ss.tvos.source_files = ''
=end
    ss.dependency "#{s.name}-SCF42/Tasks", s.version.to_s
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspecs = 'Tasks', 'AppLinks'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/Bolts-#{s.version}-SCF42.zip",
    sha256: '99fd75c9302c78a6b97e365614d7d439e35d1140c4e3663ff5caef3f804bacda'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Bolts.framework/*'
    sc.source_files = 'Bolts.framework/Headers/*.h'
    sc.public_header_files = 'Bolts.framework/Headers/*.h'
    sc.vendored_frameworks = 'Bolts.framework'
  end
end
