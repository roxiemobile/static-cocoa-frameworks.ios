# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'YandexMobileMetrica'
  s.summary               = 'This library is designed to be a part of mobile apps and provide app usage stats to Yandex AppMetrica'
  s.version               = '2.9.8'

  s.platform              = :ios
  s.ios.deployment_target = '6.0'

  s.authors               = { 'Yandex LLC' => 'appmetrica@yandex-team.com' }
  s.license               = { type: 'PROPRIETARY', file: 'LICENSE.md' }

  s.homepage              = 'http://appmetrica.yandex.com/'

  s.source                = { 'http': 'https://storage.mds.yandex.net/get-appmetrica-mobile-sdk/117488/YandexMobileMetrica-2.9.8-ios-71d8155b-cd35-4d5b-a382-2e737d3029d4.zip', 'sha1': '3758096d5fad033abdbad75e834ce5924ba0a6e2' }
  s.libraries             = [ 'c++', 'z', 'sqlite3' ]
  s.frameworks            = [ 'UIKit', 'Foundation', 'CoreTelephony', 'CoreLocation', 'CoreGraphics', 'AdSupport' ]

  s.requires_arc          = true

  s.default_subspec       = 'Static'

# MARK: - Modules

  s.subspec 'Static' do |sc|
=begin
    sc.preserve_paths = 'static/YandexMobileMetrica.framework'
    sc.source_files = 'static/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.public_header_files = 'static/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.vendored_frameworks = 'static/YandexMobileMetrica.framework'
=end
    sc.dependency "#{s.name}-SCF/StaticCocoaFramework", s.version.to_s
  end

  s.subspec 'Dynamic' do |sc|
=begin
    sc.preserve_paths = 'dynamic/YandexMobileMetrica.framework'
    sc.source_files = 'dynamic/YandexMobileMetrica.framework/Headers/*.h'
    sc.public_header_files = 'dynamic/YandexMobileMetrica.framework/Headers/*.h'
    sc.vendored_frameworks = 'dynamic/YandexMobileMetrica.framework'
=end
    sc.dependency '//+NotSupported'
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/YandexMobileMetrica+Static-2.9.8-SCF.zip',
    sha256: 'd2a1255afc79de830b9864b3cbb7116eae930282563db51e23ec60006b7682c0'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'YandexMobileMetrica.framework/*'
    sc.source_files = 'YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.public_header_files = 'YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.vendored_frameworks = 'YandexMobileMetrica.framework'
  end
end
