Gem::Specification.new do |s|
  s.name = "bing_translate_acts_as_translatable"
  s.version = "0.0.1"

  s.author = "Lasse Bunk"
  s.email = "lassebunk@gmail.com"
  s.description = "bing_translate_acts_as_translatable is a Ruby on Rails plugin for easy translation of your acts_as_translatable models."
  s.summary = "Ruby on Rails plugin for easy translation of your acts_as_translatable models."
  s.homepage = "http://github.com/lassebunk/bing_translate_acts_as_translatable"
  
  s.add_dependency 'acts_as_translatable'
  
  s.files = Dir['lib/**/*']
  s.require_paths = ["lib"]
end