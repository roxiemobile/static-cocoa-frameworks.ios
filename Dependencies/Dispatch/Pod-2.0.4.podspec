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

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.license = {}
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
end
