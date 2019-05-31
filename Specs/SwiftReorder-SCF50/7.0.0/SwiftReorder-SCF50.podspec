Pod::Spec.new do |s|
  s.name = 'SwiftReorder'
  s.version = '7.0.0'
  s.license = 'MIT'
  s.summary = 'Easy drag-and-drop reordering for UITableViews'
  s.homepage = 'https://github.com/adamshin/SwiftReorder'
  s.author = 'Adam Shin'
  
  s.swift_version = '5.0'
  s.platform = :ios, '8.0'
  
  s.source = { :git => 'https://github.com/adamshin/SwiftReorder.git', :tag => s.version }
  s.source_files = 'Source/*'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/SwiftReorder-#{s.version}-SCF50.zip",
    sha256: 'a53aafe3f5057cef43fa974493ada1bc36226f0b4c9e5a8bbc610ecc960ba581'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'SwiftReorder.framework/*'
    sc.source_files = 'SwiftReorder.framework/Headers/*.h'
    sc.public_header_files = 'SwiftReorder.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftReorder.framework'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
