# coding: utf-8
Pod::Spec.new do |s|
  s.name = 'SwiftReorder'
  s.version = '3.2.0'
  s.license = 'MIT'
  s.summary = 'Easy drag-and-drop reordering for UITableViews'
  s.homepage = 'https://github.com/adamshin/SwiftReorder'
  s.author = 'Adam Shin'
  
  s.platform = :ios, '8.0'
  
  s.source = { :git => 'https://github.com/adamshin/SwiftReorder.git', :tag => s.version }
  s.source_files = 'Source/*'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftReorder-3.2.0-SCF.zip',
    sha256: 'f331f2ad81bcf7ee8355bb1ef36595ab03f8eca1ad1bb56aca1220a554f1d210'
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
