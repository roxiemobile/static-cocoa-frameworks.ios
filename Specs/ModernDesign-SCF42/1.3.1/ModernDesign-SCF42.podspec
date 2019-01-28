# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ModernDesign'
  s.summary               = 'A collection of useful UI classes common to different iOS projects.'
  s.version               = '1.3.1'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.2'

  s.cocoapods_version     = '>= 1.4.0'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/modern-design.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/modern-design.ios.git',
    tag: s.version.to_s
  }

# MARK: - Modules

  # A collection of useful type extensions used for iOS apps development.
  s.subspec 'Extensions' do |sp|
=begin
    sp.dependency 'ModernDesignExtensions', s.version.to_s
=end
    sp.dependency 'ModernDesignExtensions-SCF42', s.version.to_s
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/ModernDesign-#{s.version}-SCF42.zip",
    sha256: 'fb250fb035105abc7aebce62a2223317afad047b46b2930a0f21d05f3c089b89'
  }
end
