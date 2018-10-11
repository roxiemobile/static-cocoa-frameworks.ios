Pod::Spec.new do |s|
  s.name             = 'KeychainAccess'
  s.version          = '3.1.2'
  s.summary          = 'KeychainAccess is a simple Swift wrapper for Keychain that works on iOS and OS X.'
  s.description      = <<-DESC
                         KeychainAccess is a simple Swift wrapper for Keychain that works on iOS and OS X.
                         Makes using Keychain APIs exremely easy and much more palatable to use in Swift.
                         Features
                           - Simple interface
                           - Support access group
                           - Support accessibility
                           - Support iCloud sharing
                           - **Support TouchID and Keychain integration (iOS 8+)**
                           - **Support Shared Web Credentials (iOS 8+)**
                           - Works on both iOS & OS X
                           - watchOS and tvOS are also supported
                       DESC
  s.homepage         = 'https://github.com/kishikawakatsumi/KeychainAccess'
  s.screenshots      = 'https://raw.githubusercontent.com/kishikawakatsumi/KeychainAccess/master/Screenshots/01.png'
  s.license          = 'MIT'
  s.author           = { 'kishikawa katsumi' => 'kishikawakatsumi@mac.com' }
  s.source           = { :git => 'https://github.com/kishikawakatsumi/KeychainAccess.git', :tag => "v#{s.version}" }
  s.social_media_url = 'https://twitter.com/k_katsumi'

  s.requires_arc = true
  s.source_files = 'Lib/KeychainAccess/*.swift'

  s.swift_version = '4.2'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/KeychainAccess-3.1.2-SCF42.zip',
    sha256: 'f216f99c7ecf125c30ec94fc56453e7c6c34262bcc9a3cb01c366f1fd3c77c0c'
  }

  s.source_files = nil
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'KeychainAccess.framework/*'
    sc.source_files = 'KeychainAccess.framework/Headers/*.h'
    sc.public_header_files = 'KeychainAccess.framework/Headers/*.h'
    sc.vendored_frameworks = 'KeychainAccess.framework'
  end
end
