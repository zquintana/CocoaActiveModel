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
  s.source       = { :git => "http://github.com/zquintana/CocoaActiveModel.git" }
  s.source_files = 'Core/**/*.{h,m}'
  s.header_dir   = 'CocoaActiveModel'
  s.requires_arc = false
  s.platform     = :ios
  s.framework    = 'Foundation'
  s.preserve_paths  = "libCocoaActiveModel.a"
end
