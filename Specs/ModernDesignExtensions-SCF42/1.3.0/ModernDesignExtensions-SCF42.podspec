# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ModernDesignExtensions'
  s.summary               = 'A collection of useful type extensions used for iOS apps development.'
  s.version               = '1.3.0'

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

  base_dir = 'Modules/RoxieMobile.ModernDesign/Sources/Extensions/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) MODERNDESIGN_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

=begin
  s.dependency 'SwiftCommons/Lang', '~> 1.3.0'
=end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/ModernDesignExtensions-#{s.version}-SCF42.zip",
    sha256: '4c8874cba7dfd79e638f16b489609c7fcc5d9baffa95cf701b53c42172a45171'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'ModernDesignExtensions.framework/*'
    sc.source_files = 'ModernDesignExtensions.framework/Headers/*.h'
    sc.public_header_files = 'ModernDesignExtensions.framework/Headers/*.h'
    sc.vendored_frameworks = 'ModernDesignExtensions.framework'

    # Dependencies
    sc.dependency 'SwiftCommons-SCF42/Lang', '~> 1.3.0'
  end
end
