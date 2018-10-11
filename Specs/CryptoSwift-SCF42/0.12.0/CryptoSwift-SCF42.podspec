# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "CryptoSwift"
  s.version      = "0.12.0"
  s.source       = { :git => "https://github.com/krzyzanowskim/CryptoSwift.git", :tag => "#{s.version}" }
  s.summary      = "Cryptography in Swift. SHA, MD5, CRC, PBKDF, Poly1305, HMAC, CMAC, HDKF, ChaCha20, Rabbit, Blowfish, AES."
  s.description  = "Cryptography functions and helpers for Swift implemented in Swift. SHA-1, SHA-2, SHA-3, MD5, PBKDF1, PBKDF2, CRC, Poly1305, HMAC, ChaCha20, Rabbit, Blowfish, AES"
  s.homepage     = "https://github.com/krzyzanowskim/CryptoSwift"
  s.license      = {:type => "Attribution", :file => "LICENSE"}
  s.authors      = {'Marcin Krzyżanowski' => 'marcin@krzyzanowskim.com'}
  s.social_media_url   = "https://twitter.com/krzyzanowskim"
  s.cocoapods_version = '>= 1.4.0'
  s.swift_version = "4.2"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source_files  = "Sources/CryptoSwift/**/*.swift"
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_OPTIMIZATION_LEVEL' => '-O', 'SWIFT_COMPILATION_MODE' => 'wholemodule', 'SWIFT_DISABLE_SAFETY_CHECKS' => 'YES', 'SWIFT_ENFORCE_EXCLUSIVE_ACCESS' => 'compile-time', 'GCC_UNROLL_LOOPS' => 'YES'}

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/CryptoSwift-0.12.0-SCF42.zip',
    sha256: '1d7e7a8213672adc422ba31cd990824cb9c6e0a2889188d33a9a8653bcaa5ecf'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'CryptoSwift.framework/*'
    sc.source_files = 'CryptoSwift.framework/Headers/*.h'
    sc.public_header_files = 'CryptoSwift.framework/Headers/*.h'
    sc.vendored_frameworks = 'CryptoSwift.framework'
  end
end
