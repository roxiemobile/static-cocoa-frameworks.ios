Pod::Spec.new do |s|
  s.name             = "RxCocoa"
  s.version          = "5.0.1"
  s.summary          = "RxSwift Cocoa extensions"
  s.description      = <<-DESC
* UI extensions
* NSURL extensions
* KVO extensions
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

  s.source_files          = 'RxCocoa/**/*.{swift,h,m}', 'Platform/**/*.swift'
  s.exclude_files         = 'RxCocoa/Platform/**/*.swift', 'Platform/AtomicInt.swift'

=begin
  s.dependency 'RxSwift', '~> 5'
  s.dependency 'RxRelay', '~> 5'
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
    http: "https://dl.bintray.com/roxiemobile/generic/RxCocoa-#{s.version}-SCF50.zip",
    sha256: 'a32dcc67264762d76b3514dd8641b6293f13c42d5abee9e152e94b3aab5a5d46'
  }

  s.source_files = nil
  s.ios.source_files = nil
  s.exclude_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'RxCocoa.framework/*'
    sc.source_files = 'RxCocoa.framework/Headers/*.h'
    sc.public_header_files = 'RxCocoa.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxCocoa.framework'

    # Dependencies
    sc.dependency 'RxSwift', '~> 5'
    sc.dependency 'RxRelay', '~> 5'
  end
end
