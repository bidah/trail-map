require 'spec_helper'
require 'rspec/mocks/standalone'
require 'mocha_standalone'
require 'bourne'

describe TrailRunner, '#run' do
  it 'returns a starting message' do
    fixture =  File.dirname(__FILE__) + '/fixtures/valid.json'
    validator = JSONValidator.new(fixture)
    validator.stubs(:puts)

    validator.run

    validator.should have_received(:puts)
  end

  it 'calls JSONValidator.new(file).run on each file' do

    TrailRunner.new.run

  end

  it 'prints a closing puts' do
    mock_puts = stubs('puts')

    TrailRunner.new.run

    mock_puts.should have_received ''
  end
end
