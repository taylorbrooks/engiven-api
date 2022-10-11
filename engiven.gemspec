$:.push File.expand_path('../lib', __FILE__)
require 'engiven/version'
require 'base64'

Gem::Specification.new do |s|
  s.name          = 'engiven'
  s.version       = EngivenAPI::VERSION
  s.authors       = ['Taylor Brooks']
  s.email         = ['dGJyb29rc0BnbWFpbC5jb20='].map { |e| Base64.decode64(e) }
  s.homepage      = 'https://github.com/taylorbrooks/engiven-api'
  s.summary       = 'A Ruby wrapper for the Engiven API'
  s.description   = 'A Ruby wrapper for the Engiven API -- a service for accepting cryptocurrency donations.'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test)/})

  s.require_paths = ['lib']

  s.add_runtime_dependency     'faraday'
  s.add_runtime_dependency     'json'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
