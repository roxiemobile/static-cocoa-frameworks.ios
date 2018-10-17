Pod::Spec.new do |s|
  s.name = "Charts"
  s.version = "3.2.1"
  s.summary = "Charts is a powerful & easy to use chart library for iOS, tvOS and OSX (and Android)"
  s.homepage = "https://github.com/danielgindi/Charts"
  s.license = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.authors = "Daniel Cohen Gindi", "Philipp Jahoda"
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"
  s.source = { :git => "https://github.com/danielgindi/Charts.git", :tag => "v#{s.version}" }
  s.default_subspec = "Core"
  s.swift_version = '4.2'
  s.cocoapods_version = '>= 1.5.0'

  s.subspec "Core" do |ss|
=begin
    ss.source_files  = "Source/Charts/**/*.swift"
=end
    ss.dependency "#{s.name}-SCF42/StaticCocoaFramework", s.version.to_s
  end

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/#{s.module_name}-#{s.version}-SCF42.zip",
    sha256: '38e63d51a5d830326434f394611b9c123efcff8c65abfbf23fab508dc7ab1b85'
  }

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Charts.framework/*'
    sc.source_files = 'Charts.framework/Headers/*.h'
    sc.public_header_files = 'Charts.framework/Headers/*.h'
    sc.vendored_frameworks = 'Charts.framework'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
