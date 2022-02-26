# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "schoolfinder_api/version"

Gem::Specification.new do |s|
  s.name        = "schoolfinder_api"
  s.version     = SchoolfinderApi::VERSION
  s.authors     = ["Matthew Vince"]
  s.email       = ["schoolfinder_api@matthewvince.com"]
  s.homepage    = "https://github.com/synewaves/education_dot_com_api"
  s.summary     = %q{TRuby library to access the Education.com SchoolFinder API}
  s.description = %q{TRuby library to access the Education.com SchoolFinder API}

  s.rubyforge_project = "schoolfinder_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec",     "~> 2.6"
  s.add_development_dependency "mocha",     "~> 0.9.8"
  s.add_development_dependency "bourne",    "~> 1.0"
  s.add_development_dependency "simplecov", "~> 0.5.3"
  s.add_development_dependency "yard",      ">= 0.6.8"
  
  s.add_runtime_dependency "nokogiri",      ">= 1.5", "< 1.14"
end
