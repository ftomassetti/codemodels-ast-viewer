# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codemodels/ast/viewer/version'

Gem::Specification.new do |spec|
  spec.name          = "codemodels-ast-viewer"
  spec.version       = Codemodels::Ast::Viewer::VERSION
  spec.authors       = ["Federico Tomassetti"]
  spec.email         = ["f.tomassetti@gmail.com"]
  spec.summary       = %q{Simple editor to look at Codemodels AST.}
  spec.description   = %q{Simple editor to look at Codemodels AST.}
  spec.email         = 'f.tomassetti@gmail.com'
  spec.homepage      = 'https://github.com/ftomassetti/codemodels-ast-viewer'
  spec.license       = "Apache v2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'codemodels'
  spec.add_dependency 'codemodels-ruby'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rubygems-tasks', '~> 0.2.4'
  spec.add_development_dependency 'yard',           '~> 0.8.7'  
end
