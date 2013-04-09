#
# Be sure to run `pod spec lint CocoaActiveModel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "CocoaActiveModel"
  s.version      = "0.0.2"
  s.license      = { :type => "FreeBSD", :file => "LICENSE" }
  s.summary      = "A ActiceRecord style data modeling for Objective C."
  s.homepage     = "https://www.github.com/zquintana/CocoaActiveModel"
  s.author       = { "Zachary Quintana" => "zach.quintana@gmail.com" }
  s.source       = { :git => "http://github.com/zquintana/CocoaActiveModel.git", :tag => "0.0.1" }
  s.source_files = 'CocoaActiveModel', 'CocoaActiveModel/**/*.{h,m}'
  s.requires_arc = false
end
