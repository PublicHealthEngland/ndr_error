$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ndr_error/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ndr_error'
  s.version     = NdrError::VERSION
  s.authors     = ['NCRS Development Team']
  s.email       = []
  s.summary     = 'Rails exception logging'
  s.description = 'Mountable engine for exception logging and fingerprinting'
  s.homepage    = 'https://github.com/PublicHealthEngland/ndr_error'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md'] - ['.travis.yml']

  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'rails', '>= 5.2', '< 7'
  s.add_dependency 'will_paginate'

  s.add_dependency 'ndr_ui'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'sqlite3'

  s.add_development_dependency 'mocha'
  s.add_development_dependency 'test-unit', '~> 3.0'

  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ndr_dev_support', '>= 5.10'
  s.add_development_dependency 'simplecov'
end
