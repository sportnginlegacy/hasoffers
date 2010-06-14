require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('hasoffers', '0.1.0') do |p|
  p.description = "Implementation of the HasOffers API for affiliate advertising."
  p.url = "http://github.com/ngin/hasoffers"
  p.author = "Luke Ludwig"
  p.email = "luke.ludwig@tstmedia.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }