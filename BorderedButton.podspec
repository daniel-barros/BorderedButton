Pod::Spec.new do |s|
  s.name         = "BorderedButton"
  s.version      = "1.0.0"
  s.summary      = "UI Button subclass that imitates buttons in the App Store app."
  s.homepage     = "https://github.com/daniel-barros/BorderedButton"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author       = { "Daniel Barros" => "dani.barros@me.com" }
  s.source       = { :git => "https://github.com/daniel-barros/BorderedButton.git", :tag => s.version }

  s.ios.deployment_target = "8.0"
  s.source_files  = "BorderedButton/**/*.{h,swift}"
  s.requires_arc = true
end
