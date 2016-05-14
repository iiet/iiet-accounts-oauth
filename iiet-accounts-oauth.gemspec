# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name     = 'iiet-accounts-oauth'
  s.version  = '0.0.1'
  s.authors  = ['Jakub Kruczek']
  s.email    = ['kruczjak@gmail.com']
  s.summary  = 'Iiet Accounts OAuth2 strategy'
  s.homepage = 'https://github.com/iiet/iiet-accounts-oauth'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake'
end
