Pod::Spec.new do |s|
  s.name             = "RxSwift"
  s.version          = "4.3.1"
  s.summary          = "RxSwift is a Swift implementation of Reactive Extensions"
  s.description      = <<-DESC
This is a Swift port of [ReactiveX.io](https://github.com/ReactiveX)

Like the original [Rx](https://github.com/Reactive-extensions/Rx.Net), its intention is to enable easy composition of asynchronous operations and event streams.

It tries to port as many concepts from the original Rx as possible, but some concepts were adapted for more pleasant and performant integration with iOS/macOS/Linux environment.

Probably the best analogy for those who have never heard of Rx would be:
```
git diff | grep bug | less          #  linux pipes - programs communicate by sending
            #  sequences of bytes, words, lines, '\0' terminated strings...
```
would become if written in RxSwift
```
gitDiff().grep("bug").less          // sequences of swift objects
```
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

  s.source_files          = 'RxSwift/**/*.swift', 'Platform/**/*.swift'
  s.exclude_files         = 'RxSwift/Platform/**/*.swift'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/RxSwift-#{s.version}-SCF42.zip",
    sha256: 'a67138cf1e52f111f362d1ecb0d589103349cb5c442863ec915587b8a1243a8b'
  }

  s.source_files = nil
  s.exclude_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'RxSwift.framework/*'
    sc.source_files = 'RxSwift.framework/Headers/*.h'
    sc.public_header_files = 'RxSwift.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxSwift.framework'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
