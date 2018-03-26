# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ContentProvidersSQLite'
  s.summary               = 'A content provider used for accessing and modifying data in SQLite database.'
  s.version               = '1.2.0'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.0'

  s.cocoapods_version     = '>= 1.4.0'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/content-providers.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/content-providers.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.ContentProviders/Sources/SQLite/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SQLITE_HAS_CODEC=1 CONTENTPROVIDERS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_SQLCIPHER'
  }
  s.user_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1',
    'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_SQLCIPHER'
  }

# MARK: - Dependencies

=begin
  s.dependency 'CryptoSwift', '~> 0.8.3'
  s.dependency 'SwiftCommons/Concurrent', '~> 1.2.5'
  s.dependency 'SwiftCommons/Extensions', '~> 1.2.5'
  s.dependency 'SQLite.swift/SQLCipher', '~> 0.11.4'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/ContentProvidersSQLite-1.2.0-SCF.zip',
    sha256: '888e6c0dbebcf01121b5cb1ca1dc2d87596c7658a60ed27000872f7c0f1ab5c5'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'ContentProvidersSQLite.framework/*'
    sc.source_files = 'ContentProvidersSQLite.framework/Headers/*.h'
    sc.public_header_files = 'ContentProvidersSQLite.framework/Headers/*.h'
    sc.vendored_frameworks = 'ContentProvidersSQLite.framework'

    # Dependencies
    sc.dependency 'CryptoSwift-SCF', '~> 0.8.3'
    sc.dependency 'SwiftCommons-SCF/Concurrent', '~> 1.2.0'
    sc.dependency 'SwiftCommons-SCF/Extensions', '~> 1.2.0'
    sc.dependency 'SQLite.swift-SCF/SQLCipher', '~> 0.11.4'
  end
end
