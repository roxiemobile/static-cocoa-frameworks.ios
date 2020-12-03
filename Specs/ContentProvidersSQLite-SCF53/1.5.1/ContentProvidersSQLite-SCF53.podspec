# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ContentProvidersSQLite'
  s.summary               = 'A content provider used for accessing and modifying data in SQLite database.'
  s.version               = '1.5.1'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '5.3'

  s.cocoapods_version     = '~> 1.10.0'
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
  s.dependency 'CryptoSwift', '~> 1.3.2'
  s.dependency 'GRDB.swift/SQLCipher', '~> 4.14.0'
  s.dependency 'SwiftCommons/Concurrent', '~> 1.5.0'
  s.dependency 'SwiftCommons/Extensions', '~> 1.5.0'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF53"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/ContentProvidersSQLite-#{s.version}-SCF53.zip",
    sha256: '4d00e6eaa0a03dfd94ec26618b9be950168a19d107f76b616253445feb564cc0'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'ContentProvidersSQLite.framework/*'
    sc.source_files = 'ContentProvidersSQLite.framework/Headers/*.h'
    sc.public_header_files = 'ContentProvidersSQLite.framework/Headers/*.h'
    sc.vendored_frameworks = 'ContentProvidersSQLite.framework'

    # Dependencies
    sc.dependency 'CryptoSwift-SCF53', '~> 1.3.2'
    sc.dependency 'GRDB.swift-SCF53/SQLCipher', '~> 4.14.0'
    sc.dependency 'SwiftCommons-SCF53/Concurrent', '~> 1.5.0'
    sc.dependency 'SwiftCommons-SCF53/Extensions', '~> 1.5.0'
  end
end
