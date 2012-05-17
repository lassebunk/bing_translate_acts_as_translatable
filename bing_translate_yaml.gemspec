Gem::Specification.new do |s|
  s.name = "bing_translate_acts_as_translatable"
  s.version = "0.0.1"

  s.author = "Lasse Bunk"
  s.email = "lassebunk@gmail.com"
  s.description = "bing_translate_yaml is a simple Ruby on Rails plugin to translate your YAML files using Bing."
  s.summary = "Simple Ruby on Rails plugin for translating your YAML files using Bing."
  s.homepage = "http://github.com/lassebunk/bing_translate_acts_as_translatable"
  
  s.add_dependency 'acts_as_translatable'
  
  s.files = Dir['lib/**/*']
  s.require_paths = ["lib"]
end