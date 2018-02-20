require 'spec_helper'

describe MeterReader do

  let(:meter_reader) { described_class.new }

    it 'takes an input from STDIN' do
      allow(meter_reader).to receive(:gets).and_return(123456)
      expect(meter_reader.user_input).to eq 123456
    end

end
