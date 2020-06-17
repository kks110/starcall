lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "starcall/version"

Gem::Specification.new do |spec|
  spec.name          = "Starcall"
  spec.version       = Starcall::VERSION
  spec.authors       = ["Kelvin Samuel"]
  spec.email         = ["kelvin@kks110.com"]

  spec.summary       = "A Helper Gem for calling Riots API"
  spec.description   = "You can use this gem to call Riot Games API without having to write the requests yourself."
  spec.homepage      = "https://github.com/kks110/starcall"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kks110/starcall"
  spec.metadata["changelog_uri"] = "https://github.com/kks110/starcall"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "httparty"
end
