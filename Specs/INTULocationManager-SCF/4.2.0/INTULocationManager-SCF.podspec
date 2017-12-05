# coding: utf-8
Pod::Spec.new do |s|
  s.name                  = "INTULocationManager"
  s.version               = "4.2.0"
  s.homepage              = "https://github.com/intuit/LocationManager"
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { "Jason Hall" => "Jason_Hall2@intuit.com" }
  s.source                = { :git => "https://github.com/intuit/LocationManager.git", :tag => "v4.2.0" }
  s.source_files          = 'LocationManager/INTULocationManager'
  s.platform              = :ios
  s.ios.deployment_target = '6.0'
  s.requires_arc          = true
  s.summary               = "Easily get the device's current location on iOS."
  s.description           = <<-DESC
  # INTULocationManager
  INTULocationManager makes it easy to get the device's current location on iOS. It is an Objective-C library that also works great in Swift.

  INTULocationManager provides a block-based asynchronous API to request the current location, either once or continuously. It internally manages multiple simultaneous location requests, and each one-time request can specify its own desired accuracy level and timeout duration. INTULocationManager automatically starts location services when the first request comes in and stops location services as soon as all requests have been completed, all the while dynamically managing the power consumed by location services to reduce impact on battery life.

  ## What's wrong with CLLocationManager?
  CLLocationManager requires you to manually detect and handle things like permissions, stale/inaccurate locations, errors, and more. CLLocationManager uses a more traditional delegate pattern instead of the modern block-based callback pattern. And while it works fine to track changes in the user's location over time (such as for turn-by-turn navigation), it is extremely cumbersome to correctly request a single location update (such as to determine the user's current city to get a weather forecast, or to autofill an address from the current location).

  INTULocationManager makes it easy to request the device's current location, either once or continuously. The API is extremely simple for both one-time location requests and recurring subscriptions to location updates. For one-time location requests, you can specify how accurate of a location you need, and how long you're willing to wait to get it. Significant location change monitoring is also supported. INTULocationManager is power efficient and conserves the device's battery by automatically determining and using the most efficient Core Location accuracy settings, and by automatically powering down location services (e.g. GPS) as soon as they are no longer needed.
  DESC

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF"

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/INTULocationManager-4.2.0-SCF.zip',
    sha256: 'a0f2f3cd28da6120cfca22b654292276fd5273d507a948159328425a758b6c48'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'INTULocationManager.framework/*'
    sc.source_files = 'INTULocationManager.framework/Headers/*.h'
    sc.public_header_files = 'INTULocationManager.framework/Headers/*.h'
    sc.vendored_frameworks = 'INTULocationManager.framework'
  end
end
