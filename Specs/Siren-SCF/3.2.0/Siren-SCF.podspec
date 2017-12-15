# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "Siren"
  s.version      = "3.2.0"
  s.summary      = "Notify users that a new version of your iOS app is available, and prompt them with the App Store link."

  s.description  = <<-DESC
Notify users when a new version of your iOS app is available, and prompt them with the App Store link.
                   DESC

  s.homepage     = "https://github.com/ArtSabintsev/Siren"
  s.license      = "MIT"
  s.authors      = { "Arthur Ariel Sabintsev" => "arthur@sabintsev.com", "Aaron Brager" => "getaaron@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ArtSabintsev/Siren.git", :tag => s.version.to_s }
  s.source_files = 'Sources/*.swift'
  s.resources    = 'Sources/Siren.bundle'
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/Siren-3.2.0-SCF.zip',
    sha256: '7398b201b53d19c06a1f97cfc363de41314824f8a6843e3e3c258f3902070a03'
  }

  s.source_files = nil
  s.resources = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Siren.framework/*'
    sc.source_files = 'Siren.framework/Headers/*.h'
    sc.public_header_files = 'Siren.framework/Headers/*.h'
    sc.vendored_frameworks = 'Siren.framework'
    sc.resources = 'Siren.framework/Resources/Siren.bundle'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
