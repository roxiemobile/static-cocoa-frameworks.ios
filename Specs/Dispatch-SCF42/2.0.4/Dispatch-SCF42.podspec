# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "Dispatch"
  s.version          = "2.0.4"
  s.summary          = "Just a tiny library to make using GCD easier and intuitive"
  s.homepage         = "https://github.com/JARMourato/Dispatch"
  s.license          = 'MIT'
  s.author           = { "João Mourato" => "joao.armourato@gmail.com", "Gabriel Peart" => "hello@swiftification.org" }
  s.source           = { :git => "https://github.com/JARMourato/Dispatch.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source_files = 'Sources/*.swift'
  s.module_name = 'DispatchFramework'

# MARK: - iOS Static Framework

  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/Dispatch-2.0.4-SCF42.zip',
    sha256: '0981c1a311ad1ab36a3943f9da960a7dbedca012ad9e19692bd25387b9c59292'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'DispatchFramework.framework/*'
    sc.source_files = 'DispatchFramework.framework/Headers/*.h'
    sc.public_header_files = 'DispatchFramework.framework/Headers/*.h'
    sc.vendored_frameworks = 'DispatchFramework.framework'
  end
end
