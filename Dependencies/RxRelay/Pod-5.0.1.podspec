Pod::Spec.new do |s|
  s.name             = "RxRelay"
  s.version          = "5.0.1"
  s.summary          = "Relays for RxSwift - PublishRelay and BehaviorRelay"
  s.description      = <<-DESC
Relays for RxSwift - PublishRelay and BehaviorRelay

* PublishRelay
* BehaviorRelay
* Binding overloads
                        DESC
  s.homepage         = "https://github.com/ReactiveX/RxSwift"
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/ReactiveX/RxSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '9.0'

  s.source_files          = 'RxRelay/**/*.{swift,h,m}'

  s.dependency 'RxSwift', '~> 5'
  s.swift_version = '5.0'

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.license = {}
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.exclude_files = cn.exclude_files.map { |pt| "#{cn.version}/#{pt}" }
end
