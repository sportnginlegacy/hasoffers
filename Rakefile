require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('hasoffers', '0.1.1') do |p|
  p.description = "Implementation of the HasOffers API for affiliate advertising."
  p.url = "http://github.com/ngin/hasoffers"
  p.author = "Luke Ludwig"
  p.email = "luke.ludwig@tstmedia.com"
  p.development_dependencies = []
  p.runtime_dependencies = ["yajl-ruby >=0.7.6", "crack >=0.1.6"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }