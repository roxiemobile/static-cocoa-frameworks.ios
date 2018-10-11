# coding: utf-8
Pod::Spec.new do |s|
  s.name          = "GzipSwift"
  s.version       = "4.0.4"
  s.summary       = "Swift framework that enables gzip/gunzip Data using zlib."

  s.homepage      = "https://github.com/1024jp/GzipSwift"
  s.license       = { :type => "MIT",
                      :file => "LICENSE" }
  s.author        = { "1024jp" => "1024jp@wolfrosch.com" }
  s.social_media_url = "https://twitter.com/1024jp"

  s.source        = { :git => "https://github.com/1024jp/GzipSwift.git",
                      :tag => s.version }
  s.source_files  = 'Sources/Gzip/*.swift'

  s.module_name = 'Gzip'
  s.osx.deployment_target     = '10.9'
  s.ios.deployment_target     = '8.0'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target    = '9.0'

  s.requires_arc  = true
  s.library       = 'z'
  s.pod_target_xcconfig = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES' }

# MARK: - iOS Static Framework

  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/GzipSwift-4.0.4-SCF42.zip',
    sha256: '7f3a173058f8e24f63544f7be5ec9dc43230aa6278c8805d457099e76ba2b0a2'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Gzip.framework/*'
    sc.source_files = 'Gzip.framework/Headers/*.h'
    sc.public_header_files = 'Gzip.framework/Headers/*.h'
    sc.vendored_frameworks = 'Gzip.framework'
  end
end
