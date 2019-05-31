Pod::Spec.new do |s|
  s.name                  = 'PureLayout'
  s.version               = '3.1.4'
  s.homepage              = "https://github.com/#{s.name}/#{s.name}"
  s.license               = { type: 'MIT', file: 'LICENSE' }
  s.author                = 'Tyler Fox'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
  s.tvos.deployment_target = '9.0'
  s.source                = { git: "#{s.homepage}.git", tag: "v#{s.version}" }
  s.source_files          = "#{s.name}/#{s.name}"
  s.summary               = 'The ultimate API for iOS & OS X Auto Layout — impressively simple, immensely powerful. Objective-C and Swift compatible.'
  s.description  = <<-DESC
    # PureLayout
    The ultimate API for iOS & OS X Auto Layout — impressively simple, immensely powerful. PureLayout extends `UIView`/`NSView`, `NSArray`, and `NSLayoutConstraint` with a comprehensive Auto Layout API that is modeled after Apple's own frameworks. PureLayout is an Objective-C library that also works (and looks!) great with Swift using a bridging header.

    Writing Auto Layout code from scratch isn't easy. PureLayout provides a fully capable and developer-friendly interface for Auto Layout. It is designed for clarity and simplicity, and takes inspiration from the AutoLayout UI options available in Interface Builder while delivering far more flexibility. The API is also highly efficient, as it adds only a thin layer of third party code and is engineered for maximum performance.
  DESC

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/PureLayout-#{s.version}-SCF50.zip",
    sha256: '887d1816487890e1b5340917b46a39b99c92e44f885a11fc59a6e3c3866da139'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'PureLayout.framework/*'
    sc.source_files = 'PureLayout.framework/Headers/*.h'
    sc.public_header_files = 'PureLayout.framework/Headers/*.h'
    sc.vendored_frameworks = 'PureLayout.framework'
  end
end
