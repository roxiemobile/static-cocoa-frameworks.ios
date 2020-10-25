Pod::Spec.new do |s|
  s.name         = "CryptoSwift"
  s.version      = "1.3.2"
  s.source       = { :git => "https://github.com/krzyzanowskim/CryptoSwift.git", :tag => "#{s.version}" }
  s.summary      = "Cryptography in Swift. SHA, MD5, CRC, PBKDF, Poly1305, HMAC, CMAC, HDKF, Scrypt, ChaCha20, Rabbit, Blowfish, AES."
  s.description  = "Cryptography functions and helpers for Swift implemented in Swift. SHA-1, SHA-2, SHA-3, MD5, PBKDF1, PBKDF2, Scrypt, CRC, Poly1305, HMAC, ChaCha20, Rabbit, Blowfish, AES"
  s.homepage     = "https://github.com/krzyzanowskim/CryptoSwift"
  s.license      = {:type => "Attribution", :file => "LICENSE"}
  s.authors      = {'Marcin Krzyżanowski' => 'marcin@krzyzanowskim.com'}
  s.social_media_url = "https://twitter.com/krzyzanowskim"
  s.cocoapods_version = '>= 1.9.1'
  s.swift_version = "5.3"
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source_files  = "Sources/CryptoSwift/**/*.swift"
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.3'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/CryptoSwift-#{s.version}-SCF53.zip",
    sha256: '0ad042fbbc6338ddabaf829a39646ab221d8eba9c3b5cf4c24abbf11549599ea'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'CryptoSwift.framework/*'
    sc.source_files = 'CryptoSwift.framework/Headers/*.h'
    sc.public_header_files = 'CryptoSwift.framework/Headers/*.h'
    sc.vendored_frameworks = 'CryptoSwift.framework'
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
