# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'platform_sh_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "platform_sh_rails"
  spec.version       = PlatformSHRails::VERSION
  spec.authors       = ["Ori Pekelman"]
  spec.email         = ["ori@platform.sh"]

  spec.summary       = %q{Platform.sh rails helper gem to ease interacting with the environment}
  spec.description   = %q{Platform.sh rails helper gem to ease interacting with the environment}
  spec.homepage      = "https://platform.sh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/platform.*}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency "platform_sh", "0.2.11"
  spec.add_dependency "activerecord-nulldb-adapter"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
