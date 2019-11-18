Pod::Spec.new do |spec|

  spec.name         = "BeaconConnector"
  spec.version      = "1.0.0"
  spec.summary      = "This is an Beacon Connector."
  spec.description  = "This is an amazing beacon connector for get the radius of location"
  spec.homepage     = "https://github.com/thisharika/BeaconConnector"
  spec.license      = "MIT"
  spec.author       = { "Thisharika" => "uyanhewagetr@gmail.com" }
  spec.platform     = :ios, "10.14"
  spec.source       = { :git => "https://github.com/thisharika/BeaconConnector.git", :tag => "1.0.0" }
  spec.source_files = "BeaconConnector/**/*.{h,m}"
  spec.swift_version = '4.0'

end
