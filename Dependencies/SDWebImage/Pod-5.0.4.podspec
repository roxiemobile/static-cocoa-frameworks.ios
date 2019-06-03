Pod::Spec.new do |s|
  s.name = 'SDWebImage'
  s.version = '5.0.4'

  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.license = 'MIT'
  s.summary = 'Asynchronous image downloader with cache support with an UIImageView category.'
  s.homepage = 'https://github.com/SDWebImage/SDWebImage'
  s.author = { 'Olivier Poitrey' => 'rs@dailymotion.com' }
  s.source = { :git => 'https://github.com/SDWebImage/SDWebImage.git', :tag => s.version.to_s }

  s.description = 'This library provides a category for UIImageView with support for remote '      \
                  'images coming from the web. It provides an UIImageView category adding web '    \
                  'image and cache management to the Cocoa Touch framework, an asynchronous '      \
                  'image downloader, an asynchronous memory + disk image caching with automatic '  \
                  'cache expiration handling, a guarantee that the same URL won\'t be downloaded ' \
                  'several times, a guarantee that bogus URLs won\'t be retried again and again, ' \
                  'and performances!'

  s.requires_arc = true
  s.framework = 'ImageIO'
  s.module_map = 'WebImage/SDWebImage.modulemap'
  
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'SDWebImage/*.{h,m}', 'WebImage/SDWebImage.h', 'SDWebImage/Private/*.{h,m}'
    core.exclude_files = 'SDWebImage/MapKit/*.{h,m}'
    core.private_header_files = 'SDWebImage/Private/*.h'
  end

  s.subspec 'MapKit' do |mk|
    mk.osx.deployment_target = '10.10'
    mk.ios.deployment_target = '8.0'
    mk.tvos.deployment_target = '9.2'
    mk.source_files = 'SDWebImage/MapKit/*.{h,m}'
    mk.framework = 'MapKit'
    mk.dependency 'SDWebImage/Core'
  end

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.license = {}
  s.static_framework = true
  s.module_map = "#{s.version}/WebImage/SDWebImage.modulemap"

  cn1 = s.consumer(:ios)
  s.pod_target_xcconfig = (cn1.pod_target_xcconfig || {}).tap do |h|
    h['SWIFT_OBJC_BRIDGING_HEADER'] = "${PODS_ROOT}/Target Support Files/#{s.name}/#{s.name}-umbrella.h"
  end

  s.subspecs.each do |sc|
    cn2 = sc.consumer(:ios)
    sc.source_files = cn2.source_files.map { |pt| "#{cn2.version}/#{pt}" } if !cn2.source_files.blank?
    sc.exclude_files = cn2.exclude_files.map { |pt| "#{cn2.version}/#{pt}" } if !cn2.exclude_files.blank?
  end
end
