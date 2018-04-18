
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitlab_health_checker/version"

Gem::Specification.new do |spec|
  spec.name          = "gitlab_health_checker"
  spec.version       = GitlabHealthChecker::VERSION
  spec.authors       = ["whyarkadas"]
  spec.email         = ["dortbucukkilo@gmail.com"]

  spec.summary       = "Checks https://gitlab.com or https://about.gitlab.com s response time"
  spec.description   = "Ruby gem that exposes a CLI to check the status of https://gitlab.com or https://about.gitlab.com and reports an average response time after probing the site every 10 seconds for a one minute"

  #spec.homepage      = "www.github.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "HttpPing"

  spec.add_dependency "thor"


end
