Pod::Spec.new do |s|
  s.name             = "SQLite.swift"
  s.version          = "0.11.5"
  s.summary          = "A type-safe, Swift-language layer over SQLite3 for iOS and OS X."

  s.description      = <<-DESC
    SQLite.swift provides compile-time confidence in SQL statement syntax and
    intent.
                       DESC

  s.homepage         = "https://github.com/stephencelis/SQLite.swift"
  s.license          = 'MIT'
  s.author           = { "Stephen Celis" => "stephen@stephencelis.com" }
  s.source           = { :git => "https://github.com/stephencelis/SQLite.swift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stephencelis'

  s.module_name      = 'SQLite'
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.1"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.2"
  s.default_subspec  = 'standard'
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.1',
  }

  s.subspec 'standard' do |ss|
=begin
    ss.source_files = 'Sources/{SQLite,SQLiteObjc}/**/*.{c,h,m,swift}'
    ss.exclude_files = 'Sources/**/Cipher.swift'
    ss.private_header_files = 'Sources/SQLiteObjc/*.h'
    ss.library = 'sqlite3'

    ss.test_spec 'tests' do |test_spec|
      test_spec.resources = 'Tests/SQLiteTests/fixtures/*'
      test_spec.source_files = 'Tests/SQLiteTests/*.swift'
    end
=end
    ss.dependency '//+NotSupported'
  end

  s.subspec 'standalone' do |ss|
=begin
    ss.source_files = 'Sources/{SQLite,SQLiteObjc}/**/*.{c,h,m,swift}'
    ss.exclude_files = 'Sources/**/Cipher.swift'
    ss.private_header_files = 'Sources/SQLiteObjc/*.h'

    ss.xcconfig = {
      'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_STANDALONE'
    }
    ss.dependency 'sqlite3'

    ss.test_spec 'tests' do |test_spec|
      test_spec.resources = 'Tests/SQLiteTests/fixtures/*'
      test_spec.source_files = 'Tests/SQLiteTests/*.swift'
    end
=end
    ss.dependency '//+NotSupported'
  end

  s.subspec 'SQLCipher' do |ss|
=begin
    ss.source_files = 'Sources/{SQLite,SQLiteObjc}/**/*.{c,h,m,swift}'
    ss.private_header_files = 'Sources/SQLiteObjc/*.h'
    ss.xcconfig = {
      'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_SQLCIPHER',
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1'
    }
    ss.dependency 'SQLCipher', '>= 3.4.0'

    ss.test_spec 'tests' do |test_spec|
      test_spec.resources = 'Tests/SQLiteTests/fixtures/*'
      test_spec.source_files = 'Tests/SQLiteTests/*.swift'
    end
=end
    ss.dependency "#{s.name}-SCF42/StaticCocoaFramework", s.version.to_s
  end

# MARK: - iOS Static Framework

  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SQLite.swift+SQLCipher-#{s.version}-SCF42.zip",
    sha256: '2b255a49e493ec8de130db4dfa153edfce197eb4c0c982e9c97c75b8d8a15964'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SQLite.framework/*'
    sc.source_files = 'SQLite.framework/Headers/*.h'
    sc.public_header_files = 'SQLite.framework/Headers/*.h'
    sc.vendored_frameworks = 'SQLite.framework'

    # Dependencies
    sc.dependency 'SQLCipher-SCF42', '~> 3.4.2'
  end
end
