# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_loader/version"

Gem::Specification.new do |spec|
  spec.name          = "active_loader"
  spec.version       = ActiveLoader::VERSION
  spec.authors       = ["JuanitoFatas"]
  spec.email         = ["katehuang0320@gmail.com"]
  spec.summary       = %q{Load YAML and JSON easily and safely with Active Loader.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/JuanitoFatas/active_loader"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http"
end
