$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "locomotive/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "locomotive"
  s.version     = Locomotive::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Locomotive."
  s.description = "TODO: Description of Locomotive."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "jquery-rails", "~> 2.0.1"
  s.add_dependency "haml-rails", "~> 0.3.4"
  s.add_dependency "devise", "~> 2.0.4"
  s.add_dependency "simple_form", "~> 2.0.1"

  s.add_dependency "rspec-rails", "~> 2.9.0"
  s.add_dependency "capybara", "~> 1.1.2"
  s.add_dependency "factory_girl_rails", "~> 1.7.0"
  s.add_dependency "database_cleaner", "~> 0.7.1"
  s.add_development_dependency "sqlite3"
end
