require_relative 'lib/factory_list/version'

Gem::Specification.new do |spec|
  spec.name          = "factory_list"
  spec.version       = FactoryList::VERSION
  spec.authors       = ["rinkei"]
  spec.email         = ["kei.h.hayashi@gmail.com"]

  spec.summary       = %q{Display factorys & traits list}
  spec.description   = %q{Display factorys & traits list to write good test.}
  spec.homepage      = "https://github.com/rinkei/factory_list"
  spec.license       = "MIT"

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'factory_bot'
end
