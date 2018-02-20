require 'spec_helper'

describe MeterReader do

    it 'takes an input from STDIN' do
      mr = MeterReader.new
      allow($stdin).to receive(:gets) { 123 }
      expect(mr.get_input).to eq 123
    end


end
