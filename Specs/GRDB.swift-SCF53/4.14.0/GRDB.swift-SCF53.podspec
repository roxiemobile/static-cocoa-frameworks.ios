Pod::Spec.new do |s|
  s.name     = 'GRDB.swift'
  s.version  = '4.14.0'
  
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'A toolkit for SQLite databases, with a focus on application development.'
  s.homepage = 'https://github.com/groue/GRDB.swift'
  s.author   = { 'Gwendal Roué' => 'gr@pierlis.com' }
  s.source   = { :git => 'https://github.com/groue/GRDB.swift.git', :tag => "v#{s.version}" }
  s.module_name = 'GRDB'
  
  s.swift_versions = ['4.2', '5.0']
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.default_subspec  = 'standard'
  
  s.subspec 'standard' do |ss|
=begin
    ss.source_files = 'GRDB/**/*.swift', 'Support/grdb_config.h'
    ss.framework = 'Foundation'
    ss.library = 'sqlite3'
=end
    ss.dependency '//+NotSupported'
  end
  
  s.subspec 'SQLCipher' do |ss|
=begin
    ss.source_files = 'GRDB/**/*.swift', 'Support/grdb_config.h'
    ss.framework = 'Foundation'
    ss.dependency 'SQLCipher', '>= 3.4.0'
    ss.xcconfig = {
      'OTHER_SWIFT_FLAGS' => '$(inherited) -D SQLITE_HAS_CODEC -D GRDBCIPHER -D SQLITE_ENABLE_FTS5',
      'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC -DGRDBCIPHER -DSQLITE_ENABLE_FTS5',
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1 GRDBCIPHER=1 SQLITE_ENABLE_FTS5=1'
    }
=end
    ss.dependency "#{s.name}-SCF53/StaticCocoaFramework", s.version.to_s
  end

# MARK: - iOS Static Framework

  s.name = "#{s.name}-SCF53"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.3'

  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/GRDB.swift+SQLCipher-#{s.version}-SCF53.zip",
    sha256: '7273a168468ab2cd82bc7caed0a6ae871f80bc13dc5219b62de9b51c5dc97e15'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'GRDB.framework/*'
    sc.source_files = 'GRDB.framework/Headers/*.h'
    sc.public_header_files = 'GRDB.framework/Headers/*.h'
    sc.vendored_frameworks = 'GRDB.framework'

    # Dependencies
    sc.dependency 'SQLCipher-SCF53', '>= 3.4.0'
  end
end
