# -*- encoding: utf-8 -*-
# stub: ae_page_objects 4.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ae_page_objects".freeze
  s.version = "4.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["AppFolio Engineering".freeze]
  s.date = "2018-09-27"
  s.description = "Capybara Page Objects pattern".freeze
  s.email = ["engineering@appfolio.com".freeze]
  s.homepage = "http://github.com/appfolio/ae_page_objects".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.5".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Capybara Page Objects pattern".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<capybara>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<capybara>.freeze, ["~> 3.0"])
  end
end
