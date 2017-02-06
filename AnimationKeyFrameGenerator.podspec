#
# Be sure to run `pod lib lint AnimationKeyFrameGenerator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnimationKeyFrameGenerator'
  s.version          = '0.0.1'
  s.summary          = 'A tool to generate key frame data base on given timing function.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
With AnimationKeyFrameGenerator, you can calculate all the raw data you want.
And you can apply varied timing fucntions to those data in order to simulate the animation apppearance you desire.
                       DESC

  s.homepage         = 'https://github.com/n41l/AnimationKeyFrameGenerator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'n41l' => 'diueym@gmail.com' }
  s.source           = { :git => 'https://github.com/n41l/AnimationKeyFrameGenerator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AnimationKeyFrameGenerator/Classes/**/*'

  # s.resource_bundles = {
  #   'AnimationKeyFrameGenerator' => ['AnimationKeyFrameGenerator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
