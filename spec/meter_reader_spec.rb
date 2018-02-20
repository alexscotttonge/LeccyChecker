require 'spec_helper'

describe MeterReader do

  class ErrorLibrary

    class InputLengthError < StandardError
    end

    class InputTotalError < StandardError
    end

  end

  subject(:meter_reader) { described_class.new }

  it 'takes an input from STDIN' do
    allow(meter_reader).to receive(:gets).and_return(123_456)
    expect(meter_reader.user_input).to eq 123_456
  end

  it 'adds the new meter reading to the previous reading' do
    allow(meter_reader).to receive(:gets).and_return(2000)
    meter_reader.user_input
    expect(meter_reader.new_reading).to eq 10_000
  end

  it 'raises an error if the input length is less than four characters' do
    allow(meter_reader).to receive(:gets).and_return(435)
    meter_reader.user_input
    expect { meter_reader.check_length }.to raise_error(ErrorLibrary::InputLengthError)
  end

  it 'checks new input is larger than previous number' do
    allow(meter_reader).to receive(:gets).and_return(435)
    meter_reader.user_input
    expect { meter_reader.check_total }.to raise_error(ErrorLibrary::InputTotalError)
  end

end
