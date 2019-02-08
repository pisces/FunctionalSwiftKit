#
# Be sure to run `pod lib lint FunctionalSwiftKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'FunctionalSwiftKit'
    s.version          = '0.1.0'
    s.summary          = 'This kit help you can write code as functional programming.'
    s.description      = 'This kit help you can write code as functional programming.'
    s.homepage         = 'https://github.com/pisces/FunctionalSwiftKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Steve Kim' => 'hh963103@gmail.com' }
    s.source           = { :git => 'https://github.com/pisces/FunctionalSwiftKit.git', :tag => s.version.to_s }
    s.ios.deployment_target = '9.0'
    s.source_files = 'FunctionalSwiftKit/Classes/**/*'
end
