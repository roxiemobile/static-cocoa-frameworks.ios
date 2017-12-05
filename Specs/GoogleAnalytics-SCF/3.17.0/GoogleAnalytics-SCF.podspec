# coding: utf-8
Pod::Spec.new do |s|
  s.name                  = 'GoogleAnalytics'
  s.version               = '3.17.0'
  s.summary               = 'Google Analytics - measure your app performance.'
  s.description           = 'Google Analytics lets you track application events you care about and gain insights from discovery and installation to conversion and engagement.'
  s.homepage              = 'https://www.google.com/analytics'
  s.license               = { text: 'Copyright 2016 Google', type: 'Copyright' }
  s.authors               = 'Google, Inc.'

  s.platform              = :ios
  s.ios.deployment_target = '5.0'

  s.source = {
    http: 'https://www.gstatic.com/cpdc/5cd71dd2f756bb01/GoogleAnalytics-3.17.0.tar.gz'
  }

  s.source_files = [
    'Sources/GAI.h',
    'Sources/GAIDictionaryBuilder.h',
    'Sources/GAIEcommerceFields.h',
    'Sources/GAIEcommerceProduct.h',
    'Sources/GAIEcommerceProductAction.h',
    'Sources/GAIEcommercePromotion.h',
    'Sources/GAIFields.h',
    'Sources/GAILogger.h',
    'Sources/GAITrackedViewController.h',
    'Sources/GAITracker.h'
  ]

  s.vendored_libraries    = 'Libraries/libGoogleAnalytics.a'
  s.libraries             = 'z', 'sqlite3'
  s.frameworks            = 'CoreData', 'SystemConfiguration'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/GoogleAnalytics-3.17.0-SCF.zip',
    sha256: 'c279630e7352d3129f1d53d2b2d668e0a1a6ea5de2afaa19a44b491c49ab6dec'
  }

  s.source_files = nil
  s.vendored_libraries = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'GoogleAnalytics.framework/*'
    sc.source_files = 'GoogleAnalytics.framework/Headers/*.h'
    sc.public_header_files = 'GoogleAnalytics.framework/Headers/*.h'
    sc.vendored_frameworks = 'GoogleAnalytics.framework'
  end
end
