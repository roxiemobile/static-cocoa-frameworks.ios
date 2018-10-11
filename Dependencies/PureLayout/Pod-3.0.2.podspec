# coding: utf-8
Pod::Spec.new do |s|
  s.name                  = 'PureLayout'
  s.version               = '3.0.2'
  s.homepage              = 'https://github.com/PureLayout/PureLayout'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = 'Tyler Fox'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
  s.tvos.deployment_target = '9.0'
  s.source                = { :git => 'https://github.com/PureLayout/PureLayout.git', :tag => 'v3.0.2' }
  s.source_files          = 'PureLayout/PureLayout'
  s.requires_arc          = true
  s.summary               = 'The ultimate API for iOS & OS X Auto Layout — impressively simple, immensely powerful. Objective-C and Swift compatible.'
  s.description  = <<-DESC
	  # PureLayout
	  The ultimate API for iOS & OS X Auto Layout — impressively simple, immensely powerful. PureLayout extends `UIView`/`NSView`, `NSArray`, and `NSLayoutConstraint` with a comprehensive Auto Layout API that is modeled after Apple's own frameworks. PureLayout is an Objective-C library that also works (and looks!) great with Swift using a bridging header.

	  Writing Auto Layout code from scratch isn't easy. PureLayout provides a fully capable and developer-friendly interface for Auto Layout. It is designed for clarity and simplicity, and takes inspiration from the AutoLayout UI options available in Interface Builder while delivering far more flexibility. The API is also highly efficient, as it adds only a thin layer of third party code and is engineered for maximum performance.
	  DESC

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.license = {}
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.pod_target_xcconfig = (cn.pod_target_xcconfig || {}).tap do |h|
    h['SWIFT_OBJC_BRIDGING_HEADER'] = "${PODS_ROOT}/Target Support Files/#{s.name}/#{s.name}-umbrella.h"
  end
end
