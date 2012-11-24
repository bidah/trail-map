require 'spec_helper'

describe JSONValidator, '#run' do
  it 'returns a starting message' do
    mock_puts = stubs('puts')

    TrailRunner.new.run

    mock_puts.should have_received "Starting JSON validation\n"
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
