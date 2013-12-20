$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "finance_star_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "finance_star_users"
  s.version     = FinanceStarUsers::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FinanceStarUsers."
  s.description = "TODO: Description of FinanceStarUsers."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"

  s.add_dependency 'haml', '~> 3.1.7'

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'haml-rails', '~> 0.3.5'

  s.add_development_dependency "rspec-rails"

  s.add_development_dependency "factory_girl_rails"

  s.add_dependency "protected_attributes"

  s.add_dependency 'will_paginate-bootstrap'

  s.add_dependency 'will_paginate', '~> 3.0'



end
