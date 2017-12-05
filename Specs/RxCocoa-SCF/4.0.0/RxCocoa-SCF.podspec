# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "RxCocoa"
  s.version          = "4.0.0"
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
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files          = 'RxCocoa/RxCocoa.h', 'RxCocoa/*.swift', 'RxCocoa/Common/**/*.{swift,h,m}', 'RxCocoa/Traits/**/*.{swift,h,m}', 'RxCocoa/Foundation/**/*.{swift,h,m}', 'RxCocoa/Runtime/**/*.{swift,h,m}', 'Platform/**/*.swift'
  s.exclude_files         = 'RxCocoa/Platform/**/*.swift'

  s.ios.source_files      = 'RxCocoa/iOS/**/*.swift'
  s.osx.source_files      = 'RxCocoa/macOS/**/*.swift'
  s.watchos.source_files  = 'RxCocoa/iOS/**/*.swift'
  s.tvos.source_files     = 'RxCocoa/iOS/**/*.swift'

=begin
  s.dependency 'RxSwift', '~> 4.0'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/RxCocoa-4.0.0-SCF.zip',
    sha256: '184ada1ebc8d5aa3b1cdeda4b60d575a826b671adf82c3cb3a495c42db8d0e1b'
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
    sc.dependency 'RxSwift-SCF', '~> 4.0.0'
  end
end
