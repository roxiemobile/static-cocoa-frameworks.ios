# coding: utf-8
Pod::Spec.new do |s|
  s.name = 'Alamofire'
  s.version = '4.6.0'
  s.license = 'MIT'
  s.summary = 'Elegant HTTP Networking in Swift'
  s.homepage = 'https://github.com/Alamofire/Alamofire'
  s.social_media_url = 'http://twitter.com/AlamofireSF'
  s.authors = { 'Alamofire Software Foundation' => 'info@alamofire.org' }
  s.source = { :git => 'https://github.com/Alamofire/Alamofire.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Source/*.swift'

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.license = {}
  s.static_framework = true

  VERSION_HEADER_FILE = "#{s.name}FrameworkVersion.h" unless defined? VERSION_HEADER_FILE
  File.open(File.join(File.expand_path(File.dirname(__FILE__)), VERSION_HEADER_FILE), 'w+') do |f|
    f.puts "#import <Foundation/Foundation.h>"
    f.puts "#define #{s.name.upcase}_FRAMEWORK_VERSION @\"#{s.version}\""
  end

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" } << VERSION_HEADER_FILE
  s.public_header_files = VERSION_HEADER_FILE
end
