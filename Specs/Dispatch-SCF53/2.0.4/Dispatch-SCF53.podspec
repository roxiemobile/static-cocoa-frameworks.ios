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

  s.name = "#{s.name}-SCF53"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.3'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/Dispatch-#{s.version}-SCF53.zip",
    sha256: '6dd766ee3f92aaa1e1e4e6552b874e9bc582bac6a59b1c931a110355373cc640'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'DispatchFramework.framework/*'
    sc.source_files = 'DispatchFramework.framework/Headers/*.h'
    sc.public_header_files = 'DispatchFramework.framework/Headers/*.h'
    sc.vendored_frameworks = 'DispatchFramework.framework'
  end

# MARK: - Validation

  # Why linker link static libraries with errors? iOS
  # @link https://stackoverflow.com/a/57126566

  # Xcode 12, building for iOS Simulator, but linking in object file built for iOS, for architecture arm64
  # @link https://stackoverflow.com/a/63955114

  s.user_target_xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift-5.0/$(PLATFORM_NAME) $(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  }
end
