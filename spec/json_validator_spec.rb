require 'spec_helper'

describe JSONValidator, '#run' do
  it 'returns a dot if the JSON is valid' do
    # mock_print = stubs('print')
    dir = File.dirname(__FILE__)
    file_name = File.open(dir + '/fixtures/valid.json')

    JSONValidator.new(file_name).run

    # Should print a dot
    # mock_print.should have_received('.')
  end


  it 'returns an error if the JSON is not valid' do
    # mock_print = stubs('puts')
    dir = File.dirname(__FILE__)
    file_name = File.open(dir + '/fixtures/invalid.json')

    JSONValidator.new(file_name).run

    # Should print 'ERROR: <filename> is not valid JSON'
    # puts.should have_received "\nERROR: ..."
  end
end
