$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'tasks/json_validator'

Dir['support/**/*.rb'].each { |f| require File.expand_path(f) }

RSpec.configure do |c|
  #?
end
