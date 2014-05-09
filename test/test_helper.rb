require "test/unit"
require "rubygems"
require "active_model"
require 'active_support/all'
require "hasoffers"

def assert_success(response)
  assert response.success?, "Failed with error messages: #{response.error_messages}"
end
