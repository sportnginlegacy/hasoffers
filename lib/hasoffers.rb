require 'yaml'
require 'net/http'
require 'net/https'
require 'yajl'
require 'crack'

# loading base classes which other models depend on
directory = File.expand_path(File.dirname(__FILE__))
require File.join(directory, "hasoffers", "response")
require File.join(directory, "hasoffers", "dummy_response")
require File.join(directory, "hasoffers", "base")

# loading all other models within hasoffers directory
Dir[File.dirname(__FILE__) + '/hasoffers/*.rb'].each do |f|
  require f
end
