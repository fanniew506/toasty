# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toasty/version'

Gem::Specification.new do |spec|
  spec.name          = "toasty"
  spec.version       = Toasty::VERSION
  spec.authors       = ["Fannie Wang"]
  spec.email         = ["fannie.wang506@gmail.com"]

  spec.summary       = %q{A lightweight ORM Library}
  spec.homepage      = "https://github.com/fanniew506/toasty"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*") + %w{README.md LICENSE.txt}
  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '~> 4.0'
  spec.add_runtime_dependency 'sqlite3', '~> 1.3'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
