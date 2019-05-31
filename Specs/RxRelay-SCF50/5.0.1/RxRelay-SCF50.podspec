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

=begin
  s.dependency 'RxSwift', '~> 5'
=end

  s.swift_version = '5.0'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/RxRelay-#{s.version}-SCF50.zip",
    sha256: '74e4722dd1be39b3d5386449833061fd8dd0eb39ddbbe8cecc1ccc48e158f674'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'RxRelay.framework/*'
    sc.source_files = 'RxRelay.framework/Headers/*.h'
    sc.public_header_files = 'RxRelay.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxRelay.framework'

    # Dependencies
    sc.dependency 'RxSwift-SCF50', '~> 5'
  end
end
