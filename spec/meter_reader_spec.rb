require 'spec_helper'

describe MeterReader do

  subject(:meter_reader) { described_class.new }

  it 'takes an input from STDIN' do
    allow(meter_reader).to receive(:gets).and_return(456)
    expect(meter_reader.user_input).to eq 456
  end

  it 'adds the new meter reading to the previous reading' do
    allow(meter_reader).to receive(:gets).and_return(500)
    meter_reader.user_input
    expect(meter_reader.update_reading).to eq 8_500
  end

  it 'raises an error if the input length is less than four characters' do
    allow(meter_reader).to receive(:gets).and_return(435)
    meter_reader.user_input
    expect { meter_reader.check_length }.to output.to_stdout
  end

  it 'raises an error if input is less than previous number' do
    allow(meter_reader).to receive(:gets).and_return(435)
    meter_reader.user_input
    expect { meter_reader.check_total }.to output.to_stdout
  end

  it 'checks new reading is within expected value' do
    allow(meter_reader).to receive(:gets).and_return(3_000)
    meter_reader.user_input
    expect { meter_reader.within_estimate? }.to output.to_stdout
  end

  it 'rolls over the meter' do
    allow(meter_reader).to receive(:gets).and_return(2_001)
    meter_reader.user_input
    expect(meter_reader.rollover).to eq 1
  end

end
