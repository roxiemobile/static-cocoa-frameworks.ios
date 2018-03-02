# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'YandexMobileMetrica'
  s.summary               = 'This library is designed to be a part of mobile apps and provide app usage stats to Yandex AppMetrica'
  s.version               = '2.9.6'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = { 'Yandex LLC' => 'appmetrica@yandex-team.com' }
  s.license               = { type: 'PROPRIETARY', file: 'LICENSE.md' }

  s.homepage              = 'http://appmetrica.yandex.com/'

  s.source                = { 'http': 'https://storage.mds.yandex.net/get-appmetrica-mobile-sdk/48248/YandexMobileMetrica-2.9.6-ios-79c52048-dc1f-48e1-8a5d-bacb86c7fe6d.zip', 'sha1': 'c123ab4b6ba245e9a384cbd3b25647aff2427556' }
  s.libraries             = [ 'c++', 'z', 'sqlite3' ]
  s.frameworks            = [ 'UIKit', 'Foundation', 'CoreTelephony', 'CoreLocation', 'CoreGraphics', 'AdSupport' ]

  s.requires_arc          = true

  s.default_subspec       = 'Static'

# MARK: - Modules

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'static/YandexMobileMetrica.framework'
    sc.source_files = 'static/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.public_header_files = 'static/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.vendored_frameworks = 'static/YandexMobileMetrica.framework'
  end

  s.subspec 'Dynamic' do |sc|
    sc.preserve_paths = 'dynamic/YandexMobileMetrica.framework'
    sc.source_files = 'dynamic/YandexMobileMetrica.framework/Headers/*.h'
    sc.public_header_files = 'dynamic/YandexMobileMetrica.framework/Headers/*.h'
    sc.vendored_frameworks = 'dynamic/YandexMobileMetrica.framework'
  end

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.license = {}
end
