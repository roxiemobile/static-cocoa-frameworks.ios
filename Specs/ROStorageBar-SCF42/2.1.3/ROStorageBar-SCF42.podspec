#
# Be sure to run `pod lib lint ROStorageBar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
    spec.name         = 'ROStorageBar'
    spec.version      = '2.1.3'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/prine/ROStorageBar'
    spec.authors      = { 'Robin Oster' => 'prine.dev@gmail.com' }
    spec.summary      = 'Dynamic Storage Bar (a là iTunes Usage Bar) written in Swift'
    spec.source       = { :git => 'https://github.com/prine/ROStorageBar.git', :tag => '2.1.3' }
    spec.source_files = 'Source/**/*'
    spec.framework    = 'SystemConfiguration'
    spec.ios.deployment_target  = '8.4'

# MARK: - iOS Static Framework

  spec.module_name = spec.name
  spec.name = "#{spec.name}-SCF42"
  spec.version = "#{spec.version}-patch.2"

  spec.platform = :ios
  spec.ios.deployment_target = '9.0'
  spec.swift_version = '4.0'

  spec.default_subspec = 'StaticCocoaFramework'
  spec.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/ROStorageBar-#{spec.version}-SCF42.zip",
    sha256: '0edf3d2d2ec55f77791cbcf8b0facab5530e87bc1ffc6b57fcd3eab5675ee75e'
  }

  spec.source_files = nil

  spec.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'ROStorageBar.framework/*'
    sc.source_files = 'ROStorageBar.framework/Headers/*.h'
    sc.public_header_files = 'ROStorageBar.framework/Headers/*.h'
    sc.vendored_frameworks = 'ROStorageBar.framework'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  spec.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
