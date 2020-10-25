Pod::Spec.new do |s|

  s.name         = "GHODictionary"
  s.version      = "1.1.0"
  s.summary      = "Ordered dictionary."
  s.homepage     = "https://github.com/gabriel/GHODictionary"
  s.license      = { :type => "MIT" }
  s.author       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/GHODictionary.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = "GHODictionary/**/*.{c,h,m}"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.3'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/GHODictionary-#{s.version}-SCF53.zip",
    sha256: '7123260c008bb0ef93e6d1892b9c8d37a6dc8213ac40cb05784f9dc2a65b8ad1'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'GHODictionary.framework/*'
    sc.source_files = 'GHODictionary.framework/Headers/*.h'
    sc.public_header_files = 'GHODictionary.framework/Headers/*.h'
    sc.vendored_frameworks = 'GHODictionary.framework'
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
