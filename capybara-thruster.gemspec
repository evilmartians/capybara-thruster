# frozen_string_literal: true

require_relative "lib/capybara/thruster/version"

Gem::Specification.new do |s|
  s.name = "capybara-thruster"
  s.version = Capybara::Thruster::VERSION
  s.authors = ["Vladimir Dementyev"]
  s.email = ["Vladimir Dementyev"]
  s.homepage = "https://github.com/evilmartians/capybara-thruster"
  s.summary = "Example description"
  s.description = "Example description"

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/evilmartians/capybara-thruster/issues",
    "changelog_uri" => "https://github.com/evilmartians/capybara-thruster/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://github.com/evilmartians/capybara-thruster",
    "homepage_uri" => "https://github.com/evilmartians/capybara-thruster",
    "source_code_uri" => "https://github.com/evilmartians/capybara-thruster"
  }

  s.license = "MIT"

  s.files = Dir.glob("lib/**/*") + Dir.glob("bin/**/*") + %w[README.md LICENSE.txt CHANGELOG.md]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.7"

  s.add_dependency "childprocess", ">= 4.0"
  s.add_dependency "puma"

  s.add_development_dependency "bundler", ">= 1.15"
  s.add_development_dependency "rake", ">= 13.0"
  s.add_development_dependency "minitest", "~> 5.0"
end
