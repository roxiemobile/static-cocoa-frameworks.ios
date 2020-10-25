Pod::Spec.new do |s|

  s.name         = "MPMessagePack"
  s.version      = "1.5.1"
  s.summary      = "Library for MessagePack"
  s.homepage     = "https://github.com/gabriel/MPMessagePack"
  s.license      = { :type => "MIT" }
  s.authors       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/MPMessagePack.git", :tag => s.version.to_s }
  s.requires_arc = true

=begin
  s.dependency "GHODictionary"
=end

  s.ios.deployment_target = "6.0"
  s.ios.source_files = "MPMessagePack/**/*.{c,h,m}", "RPC/**/*.{c,h,m}"

  s.osx.deployment_target = "10.8"
  s.osx.source_files = "MPMessagePack/**/*.{c,h,m}", "RPC/**/*.{c,h,m}", "XPC/**/*.{c,h,m}"

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.3'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/MPMessagePack-#{s.version}-SCF53.zip",
    sha256: '3eb1e94379c4e48e4c1b807353a5ac473982b35ff4162dd6bea007d727176397'
  }

  s.ios.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'MPMessagePack.framework/*'
    sc.source_files = 'MPMessagePack.framework/Headers/*.h'
    sc.public_header_files = 'MPMessagePack.framework/Headers/*.h'
    sc.vendored_frameworks = 'MPMessagePack.framework'

    # Dependencies
    sc.dependency 'GHODictionary-SCF53', '~> 1.1.0'
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
