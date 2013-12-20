$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "finance_management/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "finance_management"
  s.version     = FinanceManagement::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FinanceManagement."
  s.description = "TODO: Description of FinanceManagement."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'will_paginate-bootstrap'

  s.add_development_dependency 'will_paginate', '~> 3.0'

  s.add_development_dependency "rspec-rails"

  s.add_development_dependency "factory_girl_rails"

end
