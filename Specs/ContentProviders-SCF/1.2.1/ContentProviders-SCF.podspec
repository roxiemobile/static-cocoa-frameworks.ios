# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ContentProviders'
  s.summary               = 'A collection of useful content providers used for accessing and modifying iOS applications data.'
  s.version               = '1.2.1'

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

# MARK: - Modules

  # # A content provider used for accessing and modifying physical files.
  # s.subspec 'FileSystem' do |sc|
  #   sc.dependency 'ContentProvidersFileSystem', s.version.to_s
  # end

  # A content provider used for accessing and modifying data in SQLite database.
  s.subspec 'SQLite' do |sc|
=begin
    sc.dependency 'ContentProvidersSQLite', s.version.to_s
=end
    sc.dependency 'ContentProvidersSQLite-SCF', s.version.to_s
  end

  # # A content provider used for accessing and modifying data in UserDefaults.
  # s.subspec 'UserDefaults' do |sc|
  #   sc.dependency 'ContentProvidersUserDefaults', s.version.to_s
  # end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.source = {
#   http: 'https://dl.bintray.com/roxiemobile/generic/ContentProviders-1.2.1-SCF.zip',
    http: 'https://github.com/roxiemobile/content-providers.ios/releases/download/1.2.1/ContentProviders-1.2.1-SCF.zip',
    sha256: '851d516f6f344b8888cb2a1c49f324467c84e19c1f8b8d1a204626b0bbdc2868'
  }
end
