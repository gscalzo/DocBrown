# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docbrown/version'

Gem::Specification.new do |spec|
  spec.name          = "docbrown"
  spec.version       = DocBrown::VERSION
  spec.authors       = ["Giordano Scalzo"]
  spec.email         = ["giordano.scalzo@gmail.com"]
  spec.summary       = %q{A very opinionated implementation of Flux architecture in Swift}
  spec.description   = <<-DESC
                       A very opinionated implementation of Flux architecture in Swift.
                       DESC
  spec.homepage      = "https://github.com/gscalzo/DocBrown"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f =~ /docs\// }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "pry", "~> 0.9"

  spec.add_dependency "clamp", "~> 0.6"
  spec.add_dependency "colorize", "~> 0.7"
  spec.add_dependency "xcodeproj", "~> 0.17"
end