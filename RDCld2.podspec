Pod::Spec.new do |s|

  s.name         = "RDCld2"
  s.version      = "1.0.2"
  s.summary      = "RDCld2"
  s.description  = <<-DESC
                  RDCld2
                   DESC

  s.homepage     = "https://github.com/readdle/swift-cld2.git"
  s.license      = { :type => 'Copyright 2022 Readdle Inc.', :text => 'Copyright 2022 Readdle Inc.' }
  s.author       = { "Andrew Druk" => "adruk@readdle.com" }
  s.source       = { :git => "git@github.com:readdle/swift-cld2.git" }
  s.platforms    = { :ios => "10.0", :osx => "10.12" }

  s.source_files = "Sources/*.{swift,c,h,m}"
  s.requires_arc = true

end