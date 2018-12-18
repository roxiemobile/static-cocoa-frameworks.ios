Pod::Spec.new do |s|
  s.name             = "RxAtomic"
  s.version          = "4.4.0"
  s.summary          = "Atomic primitives for RxSwift"
  s.description      = <<-DESC
Atomic primitives for RxSwift.
                        DESC
  s.homepage         = "https://github.com/ReactiveX/RxSwift"
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/ReactiveX/RxSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '9.0'

  s.source_files          = 'RxAtomic/**/*.{c,h}'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.mame}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/RxAtomic-#{s.version}-SCF42.zip",
    sha256: '217a023c73a11c59c9e0df11baead9e4782b183aa8ce3235f0c70d82df6ad767'
  }

  s.source_files = nil
  s.exclude_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'RxAtomic.framework/*'
    sc.source_files = 'RxAtomic.framework/Headers/*.h'
    sc.public_header_files = 'RxAtomic.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxAtomic.framework'
  end
end