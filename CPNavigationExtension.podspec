Pod::Spec.new do |s|
  s.name         = "CPNavigationExtension"
  s.version      = "0.1.0"
  s.summary      = "Extension for customize the appearance of the UINavigationBar"
  s.homepage     = "https://github.com/caoping/CPNavigationExtension"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "caoping" => "caoping.dev@gmail.com" }
  s.social_media_url   = "http://weibo.com/caoping"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/caoping/CPNavigationExtension.git", :tag => s.version }
  s.source_files = "CPNavigationExtension/*.{h,m}"
  s.requires_arc = true
end
