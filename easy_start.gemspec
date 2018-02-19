
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "easy_start/version"

Gem::Specification.new do |spec|
  spec.name          = "easy_start"
  spec.version       = EasyStart::VERSION
  spec.authors       = ["Arun Eapachen"]
  spec.email         = ["aruneapachen@gmail.com"]

  spec.summary       = %q{Will launch the local rails server with a single command.}
  spec.description   = %q{In order to work as expected add projects beforehand and just launch the server in a single command}
  spec.homepage      = "https://github.com/aruneapachenmec"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'easy_start'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
