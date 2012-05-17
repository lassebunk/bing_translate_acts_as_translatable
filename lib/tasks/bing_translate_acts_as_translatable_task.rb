require 'net/http'
require 'rexml/document'

desc "Translate your YAML files using Bing."
  task :bing_translate_acts_as_translatable => :environment do
  @class => ENV["class"]
  @from_locale = ENV["from"]
  @to_locale = ENV["to"]
  @app_id = ENV["app_id"] || "TWwfmo09qPdsxVfnXUMCRHAyk2dGOaodKYVOvbyu3m5Y*"
  
  puts "Translating..."
  
  puts "Done!"
end

def translate_hash(yaml)
  dest = yaml.dup
  
  yaml.keys.each do |key|
    source = yaml[key]
    
    if source.is_a?(Symbol)
      translated = source
    elsif source.is_a?(String)
      translated = translate_string(source)
    elsif source.is_a?(Hash)
      translated = translate_hash(source)
    elsif source.is_a?(Array)
      translated = translate_array(source)
    else
      translated = ""
    end
    
    dest[key] = translated
  end
  
  dest
end

def translate_array(array)
  out = []
  array.each do |source|
    if source.is_a?(Symbol)
      out << source
    else
      out << translate_string(source)
    end
  end
  out
end

def translate_string(source)
  return "" unless source
  
  url = "http://api.microsofttranslator.com/v2/Http.svc/Translate?appId=#{@app_id}&text=#{CGI::escape(source)}&from=#{@from_locale}&to=#{@to_locale}"
  xml = Net::HTTP.get_response(URI.parse(url)).body

  doc = REXML::Document.new(xml)
  if element = doc.elements["string"]
    dest = element.text.html_safe.gsub("% {", "%{")
  else
    dest = ""
  end
  
  puts "#{source} => #{dest}"
  
  dest
end