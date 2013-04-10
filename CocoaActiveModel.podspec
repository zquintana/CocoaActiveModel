#
# Be sure to run `pod spec lint CocoaActiveModel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "CocoaActiveModel"
#  s.version      = "1.0.1"
  s.license      = { :type => "FreeBSD", :file => "LICENSE" }
  s.summary      = "A ActiceRecord style data modeling for Objective C."
  s.homepage     = "https://www.github.com/zquintana/CocoaActiveModel"
  s.author       = { "Zachary Quintana" => "zach.quintana@gmail.com" }
  s.source       = { :git => "http://github.com/zquintana/CocoaActiveModel.git", :tag => "v#{s.version}" }
  s.source_files = 'Core/**/*.{h,m}'
  s.header_dir   = 'CocoaActiveModel'
  s.requires_arc = false
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
end
