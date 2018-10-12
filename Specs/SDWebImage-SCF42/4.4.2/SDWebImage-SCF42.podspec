Pod::Spec.new do |s|
  s.name = 'SDWebImage'
  s.version = '4.4.2'

  s.osx.deployment_target = '10.9'
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.license = 'MIT'
  s.summary = 'Asynchronous image downloader with cache support with an UIImageView category.'
  s.homepage = 'https://github.com/rs/SDWebImage'
  s.author = { 'Olivier Poitrey' => 'rs@dailymotion.com' }
  s.source = { :git => 'https://github.com/rs/SDWebImage.git', :tag => s.version.to_s }

  s.description = 'This library provides a category for UIImageView with support for remote '      \
                  'images coming from the web. It provides an UIImageView category adding web '    \
                  'image and cache management to the Cocoa Touch framework, an asynchronous '      \
                  'image downloader, an asynchronous memory + disk image caching with automatic '  \
                  'cache expiration handling, a guarantee that the same URL won\'t be downloaded ' \
                  'several times, a guarantee that bogus URLs won\'t be retried again and again, ' \
                  'and performances!'

  s.requires_arc = true
  s.framework = 'ImageIO'
  
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
=begin
    core.source_files = 'SDWebImage/{NS,SD,UI}*.{h,m}'
    core.exclude_files = 'SDWebImage/UIImage+WebP.{h,m}', 'SDWebImage/SDWebImageWebPCoder.{h,m}'
    core.tvos.exclude_files = 'SDWebImage/MKAnnotationView+WebCache.*'
=end
    core.dependency "#{s.name}-SCF42/StaticCocoaFramework"
  end

  s.subspec 'MapKit' do |mk|
=begin
    mk.osx.deployment_target = '10.9'
    mk.ios.deployment_target = '7.0'
    mk.tvos.deployment_target = '9.0'
    mk.source_files = 'SDWebImage/MKAnnotationView+WebCache.*'
    mk.framework = 'MapKit'
    mk.dependency 'SDWebImage/Core'
=end
    mk.dependency '//+NotSupported'
  end

  s.subspec 'GIF' do |gif|
=begin
    gif.ios.deployment_target = '7.0'
    gif.source_files = 'SDWebImage/FLAnimatedImage/*.{h,m}'
    gif.dependency 'SDWebImage/Core'
    gif.dependency 'FLAnimatedImage', '~> 1.0'
    gif.xcconfig = {
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/FLAnimatedImage/FLAnimatedImage'
    }
=end
    gif.dependency '//+NotSupported'
  end

  s.subspec 'WebP' do |webp|
=begin
    webp.source_files = 'SDWebImage/UIImage+WebP.{h,m}', 'SDWebImage/SDWebImageWebPCoder.{h,m}'
    webp.xcconfig = { 
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1',
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
    webp.watchos.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1 WEBP_USE_INTRINSICS=1',
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
    webp.dependency 'SDWebImage/Core'
    webp.dependency 'libwebp', '~> 0.5'
=end
    webp.dependency '//+NotSupported'
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SDWebImage+Core-4.4.2-SCF42.zip',
    sha256: 'd5494a628ab4f79035629925515fc74bc1e13fcbb2f27457fb70831f80ba5468'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SDWebImage.framework/*'
    sc.source_files = 'SDWebImage.framework/Headers/*.h'
    sc.public_header_files = 'SDWebImage.framework/Headers/*.h'
    sc.vendored_frameworks = 'SDWebImage.framework'
  end
end
