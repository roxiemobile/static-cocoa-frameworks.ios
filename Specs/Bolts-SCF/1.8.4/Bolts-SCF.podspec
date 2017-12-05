# coding: utf-8
Pod::Spec.new do |s|
  s.name         = 'Bolts'
  s.version      = '1.8.4'
  s.summary      = 'Bolts is a collection of low-level libraries designed to make developing mobile apps easier.'
  s.description  = <<-DESC
                    Bolts was designed by Parse and Facebook for our own internal use, and we have decided to open source these libraries to make them available to others. Using these libraries does not require using any Parse services. Nor do they require having a Parse or Facebook developer account.

                    The first component in Bolts is "tasks", which make organization of complex asynchronous code more manageable. A task is kind of like a JavaScript Promise, but available for iOS and Android.
                   DESC
  s.homepage     = 'https://github.com/BoltsFramework'
  s.license      = 'BSD'
  s.authors      = 'Parse'
  s.source       = { :git => 'https://github.com/BoltsFramework/Bolts-ObjC.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ParseIt'
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
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
    ss.dependency "#{s.name}-SCF/StaticCocoaFramework", s.version.to_s
  end

  s.subspec 'AppLinks' do |ss|
=begin
    ss.ios.deployment_target = '6.0'
    ss.dependency 'Bolts/Tasks'

    ss.ios.source_files = 'Bolts/iOS/**/*.[hm]'
    ss.ios.public_header_files = 'Bolts/iOS/*.h'
    ss.osx.source_files = ''
    ss.watchos.source_files = ''
    ss.tvos.source_files = ''
=end
    ss.dependency "#{s.name}-SCF/Tasks", s.version.to_s
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspecs = 'Tasks', 'AppLinks'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/Bolts-1.8.4-SCF.zip',
    sha256: '8fce4a758d2d46e6d32711ab0963c2e5de22ae60c9c0f3242e0f12032f10e5ca'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Bolts.framework/*'
    sc.source_files = 'Bolts.framework/Headers/*.h'
    sc.public_header_files = 'Bolts.framework/Headers/*.h'
    sc.vendored_frameworks = 'Bolts.framework'
  end
end
