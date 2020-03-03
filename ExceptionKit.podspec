Pod::Spec.new do |s|
    s.name = 'ExceptionKit'
    s.version = '1.0.9'
    s.summary = 'Pod that tries to help simplify Error Logging'
    s.description = <<-DESC 
    Pod that helps simplify Error logging in Swift
     DESC
    
    s.homepage = 'https://github.com/labs-nomad/ErrorKit'

    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'shared@nomad-go.com' => 'nomad@shared-go.com' }
    s.source           = { :git => 'https://github.com/labs-nomad/ErrorKit.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '11.1'

    s.source_files = 'Sources/**/*.swift'
  
    s.swift_version = '5'
end
