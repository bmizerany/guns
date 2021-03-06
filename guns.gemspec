Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = 'guns'
  s.version = '0.1.4'
  s.date = '2009-10-30'

  s.description = "Guns - It's got two pipes; got tickets to the show?"
  s.summary     = s.description

  s.authors = ["Blake Mizerany"]
  s.email = "blake.mizerany@gmail.com"

  s.files = %w[
    README.md
    guns.gemspec
    lib/guns.rb
  ]

  s.extra_rdoc_files = %w[README.md]

  s.homepage = "http://github.com/bmizerany/guns/"
  s.require_paths = %w[lib]
  s.rubygems_version = '1.1.1'
end
