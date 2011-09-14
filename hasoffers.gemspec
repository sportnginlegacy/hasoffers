# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hasoffers/version"

Gem::Specification.new do |s|
  s.name        = "hasoffers"
  s.version     = Hasoffers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luke Ludwig"]
  s.email       = ["luke.ludwig@tstmedia.com"]
  s.homepage    = "https://github.com/tstmedia/hasoffers"
  s.summary     = %q{Implementation of the HasOffers API for affiliate advertising.}
  s.description = %q{Implementation of the HasOffers API for affiliate advertising.}

  s.rubyforge_project = "hasoffers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'crack'
  s.add_dependency 'yajl-ruby'
  s.add_development_dependency 'rake'
end
