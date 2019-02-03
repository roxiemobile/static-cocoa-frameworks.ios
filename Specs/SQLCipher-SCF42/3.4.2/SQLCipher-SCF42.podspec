# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SQLCipher'
  s.summary               = 'Full Database Encryption for SQLite.'
  s.description           = 'SQLCipher is an open source extension to SQLite that provides transparent 256-bit AES encryption of database files.'
  s.version               = '3.4.2'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = 'Zetetic LLC'
  s.license               = 'BSD'

  s.homepage              = 'https://www.zetetic.net/sqlcipher/'

  s.source                = { git: 'https://github.com/sqlcipher/sqlcipher.git', tag: 'v3.4.2' }
  s.prepare_command       = './configure --enable-tempstore=yes --with-crypto-lib=commoncrypto CFLAGS="-DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DSQLITE_SOUNDEX -DSQLITE_THREADSAFE -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_STAT4 -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS4_UNICODE61 -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS5 -DHAVE_USLEEP=1 -DSQLITE_MAX_VARIABLE_NUMBER=99999"; make sqlite3.c'

  s.requires_arc          = false

  s.default_subspecs      = 'standard'

# MARK: - Modules

  s.subspec 'common' do |sc|
=begin
    sc.source_files = 'sqlite3.{h,c}'

    sc.frameworks = [
      'Foundation',
      'Security'
    ]

    sc.compiler_flags = [
      '-DNDEBUG',
      '-DSQLITE_HAS_CODEC',
      '-DSQLITE_TEMP_STORE=2',
      '-DSQLITE_SOUNDEX',
      '-DSQLITE_THREADSAFE',
      '-DSQLITE_ENABLE_RTREE',
      '-DSQLITE_ENABLE_STAT3',
      '-DSQLITE_ENABLE_STAT4',
      '-DSQLITE_ENABLE_COLUMN_METADATA',
      '-DSQLITE_ENABLE_MEMORY_MANAGEMENT',
      '-DSQLITE_ENABLE_LOAD_EXTENSION',
      '-DSQLITE_ENABLE_FTS4',
      '-DSQLITE_ENABLE_FTS4_UNICODE61',
      '-DSQLITE_ENABLE_FTS3_PARENTHESIS',
      '-DSQLITE_ENABLE_UNLOCK_NOTIFY',
      '-DSQLITE_ENABLE_JSON1',
      '-DSQLITE_ENABLE_FTS5',
      '-DSQLCIPHER_CRYPTO_CC',
      '-DHAVE_USLEEP=1',
      '-DSQLITE_MAX_VARIABLE_NUMBER=99999'
    ]

    sc.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1',
      'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DSQLITE_SOUNDEX -DSQLITE_THREADSAFE -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_STAT4 -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS4_UNICODE61 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS5 -DSQLCIPHER_CRYPTO_CC -DHAVE_USLEEP=1 -DSQLITE_MAX_VARIABLE_NUMBER=99999'
    }
=end
    sc.dependency "#{s.name}-SCF42/StaticCocoaFramework", s.version.to_s
  end

  s.subspec 'standard' do |sc|
=begin
    sc.dependency 'SQLCipher/common'
=end
    sc.dependency "#{s.name}-SCF42/common"
  end

  s.subspec 'fts' do |sc|
=begin
    sc.compiler_flags = []

    sc.xcconfig = {
      'OTHER_CFLAGS' => '$(inherited)'
    }

    sc.dependency 'SQLCipher/common'
=end
    sc.dependency '//+NotSupported'
  end

  s.subspec 'unlock_notify' do |sc|
=begin
    sc.compiler_flags = []

    sc.xcconfig = {
      'OTHER_CFLAGS' => '$(inherited)'
    }

    sc.dependency 'SQLCipher/common'
=end
    sc.dependency '//+NotSupported'
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SQLCipher+standard-#{s.version}-SCF42.zip",
    sha256: 'b03933abb98556bd7017b649ebe2735070f66995409354f576d2e9a5df49d517'
  }

  s.prepare_command = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SQLCipher.framework/*'
    sc.source_files = 'SQLCipher.framework/Headers/*.h'
    sc.public_header_files = 'SQLCipher.framework/Headers/*.h'
    sc.vendored_frameworks = 'SQLCipher.framework'
  end
end
