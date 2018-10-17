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
    ss.source_files  = "Source/Charts/**/*.swift"
  end

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.license = {}
  s.static_framework = true

  s.subspecs.each do |sc|
    cn = sc.consumer(:ios)
    sc.ios.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" } if !cn.source_files.blank?
  end
end
