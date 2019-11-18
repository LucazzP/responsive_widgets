#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'responsive_widgets'
  s.version          = '0.1.9'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
  This plugin helps to create responsive widgets, that makes an auto-size with the proportion between reference ScreenSize and the screen that the app is running.
                       DESC
  s.homepage         = 'http://polazzo.dev'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Lucas Polazzo' => 'lucashpolazzo2013@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.3'
end