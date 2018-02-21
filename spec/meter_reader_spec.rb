require 'spec_helper'

describe MeterReader do

  subject(:meter_reader) { described_class.new }

  xit 'takes an input from STDIN' do
    allow(meter_reader).to receive(:gets).and_return(456)
    expect(meter_reader.user_input).to eq 456
  end

  xit 'adds the new meter reading to the previous reading' do
    allow(meter_reader).to receive(:gets).and_return(500)
    meter_reader.user_input
    expect(meter_reader.update_reading).to eq 8_500
  end

  xit 'raises an error if the input length is less than four characters' do
    allow(meter_reader).to receive(:gets).and_return(435)
    meter_reader.user_input
    expect { meter_reader.check_length }.to output("It looks like your number is too short, please reenter\n").to_stdout
  end

  it 'raises an error if input is less than previous number' do
    allow(meter_reader).to receive(:gets).and_return(435)
    meter_reader.user_input
    expect { meter_reader.check_total }.to raise_error(ErrorLibrary::InputTotalError)
  end

  xit 'checks new reading is within expected value' do
    allow(meter_reader).to receive(:gets).and_return(10_000)
    meter_reader.user_input
    expect { meter_reader.within_estimate? }.to raise_error(ErrorLibrary::EstimateError)
  end

  xit 'rolls over the meter' do
    allow(meter_reader).to receive(:gets).and_return(2_001)
    meter_reader.user_input
    expect(meter_reader.rollover).to eq 1
  end

end
