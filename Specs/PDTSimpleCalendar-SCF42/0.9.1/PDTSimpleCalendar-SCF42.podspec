Pod::Spec.new do |s|

  s.name         = "PDTSimpleCalendar"
  s.version      = "0.9.1"
  s.summary      = "A simple Calendar/Date Picker with a nice iOS7/iOS8 design."

  s.description  = <<-DESC
                   Inspired by Square's TimesSquare & Apple Calendar.

                   Simple Calendar is a simple Date Picker/Calendar View Controller using UICollectionView and a flowLayout.
                   DESC

  s.homepage     = "https://github.com/jivesoftware/PDTSimpleCalendar"
  s.license      = 'Apache License, Version 2.0'
  s.author       = { "Jerome Miglino" => "jerome.miglino@jivesoftware.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/jivesoftware/PDTSimpleCalendar.git", :tag => s.version.to_s }
  s.source_files  = 'PDTSimpleCalendar/**/*.{h,m}'
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF42"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/PDTSimpleCalendar-#{s.version}-SCF42.zip",
    sha256: '935e08636985d26500f4c32aa02238c230db36cd24bee771bc6e5df2810b54cd'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'PDTSimpleCalendar.framework/*'
    sc.source_files = 'PDTSimpleCalendar.framework/Headers/*.h'
    sc.public_header_files = 'PDTSimpleCalendar.framework/Headers/*.h'
    sc.vendored_frameworks = 'PDTSimpleCalendar.framework'
  end
end
