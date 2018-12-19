Pod::Spec.new do |s|
  # Version
  s.version       = "3.9.1"
  s.swift_version = '4.2'

  # Meta
  s.name         = "Siren"
  s.summary      = "Notify users that a new version of your iOS app is available, and prompt them with the App Store link."
  s.homepage     = "https://github.com/ArtSabintsev/Siren"
  s.license      = "MIT"
  s.authors      = { "Arthur Ariel Sabintsev" => "arthur@sabintsev.com", "Aaron Brager" => "getaaron@gmail.com" }
  s.description  = <<-DESC
                    Notify your users when a new version of your iOS app is available, and prompt them with the App Store link.
                   DESC

  # Compatibility & Sources
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ArtSabintsev/Siren.git", :tag => s.version.to_s }
  s.source_files = 'Sources/**/*.swift'
  s.resources    = 'Sources/Siren.bundle'
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/Siren-#{s.version}-SCF42.zip",
    sha256: '21e2a5a24e2885ce7387b0d6c5848784bb072dd7e7e9598c7fc0ea90e414a7c5'
  }

  s.source_files = nil
  s.resources = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'Siren.framework/*'
    sc.source_files = 'Siren.framework/Headers/*.h'
    sc.public_header_files = 'Siren.framework/Headers/*.h'
    sc.vendored_frameworks = 'Siren.framework'
    sc.resources = 'Siren.framework/Siren.bundle'
  end

# MARK: - Validation

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }
end
