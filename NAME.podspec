#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ${POD_NAME}.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'http://192.168.1.107:7000/ios//${POD_NAME}'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }
  s.source           = { :git => 'http://192.168.1.107:7000/ios/${POD_NAME}.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  if ENV['IS_SOURCE'] || ENV['${POD_NAME}_SOURCE']
      s.source_files = '${POD_NAME}/**/*.{h,m}'
      s.resource_bundles = {
        '${POD_NAME}' => ['${POD_NAME}/**/*.{png,xib,plist}']
      }
      puts '-------------------------------------------------------------------'
      puts "Notice:#{s.name} is source now"
      puts '-------------------------------------------------------------------'
  else
      s.source_files = '${POD_NAME}/**/*.h'
      s.vendored_library = '${POD_NAME}/lib${POD_NAME}.a'
      s.resource_bundles = {
        '${POD_NAME}' => ['${POD_NAME}/**/*.{png,xib,plist}']
      }
      puts '-------------------------------------------------------------------'
      puts "Notice:#{s.name} is binary now"
      puts '-------------------------------------------------------------------'
  end

 s.preserve_paths = '${POD_NAME}/**/*'


#s.dependency 'YBYConfig', '~> 1.0'
#s.dependency 'YBYCategory', '~> 1.0'
#s.dependency 'Masonry','1.1.0'
#s.dependency 'YYBaseModel', '~> 1.0'
#s.dependency 'YBYNetWork', '~> 1.0'
#s.dependency 'Utils', '~> 1.0'
end
