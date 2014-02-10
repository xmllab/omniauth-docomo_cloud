# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/docomo_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-docomo_cloud"
  spec.version       = Omniauth::DocomoCloud::VERSION
  spec.authors       = ["Takahiro HAMAGUCHI"]
  spec.email         = ["tk.hamaguchi@gmail.com"]
  spec.summary       = %q{OmniAuth strategy for docomo Cloud}
  spec.description   = %q{OmniAuth strategy for docomo Cloud.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency 'omniauth-oauth2'

end
