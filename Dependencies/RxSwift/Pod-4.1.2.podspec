Pod::Spec.new do |s|
  s.name             = "RxSwift"
  s.version          = "4.1.2"
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

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.license = {}
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.exclude_files = cn.exclude_files.map { |pt| "#{cn.version}/#{pt}" }
end