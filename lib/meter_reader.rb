class MeterReader

  UPPER_METER_VALUE = 10_000

  attr_reader :counter, :input

  def initialize
    @counter = 8000
  end

  def user_input
    @input = gets.to_i
  end

  def check_length
    if input.digits.count < 4
      puts 'It looks like your number is too short, please re-enter'
      user_input
    end
  end

  def check_total
    if input < counter
      puts 'Your input must be higher than the previous reading, please re-enter'
      user_input
    end
  end

  def update_reading
    @counter += input
  end

  def rollover
    check_rollover
    if @reset_value < 0
      @reset_value.abs
    else
      update_reading
    end
  end

  def within_estimate?
    unless (expected_lower_range..expected_higher_range).include?(calculate_estimate)
      puts 'Your estimate looks like it\'s not quite right, please re-enter'
      user_input
    end
  end

  private

  def check_rollover
    @reset_value = UPPER_METER_VALUE - update_reading
  end

  def submitted_value
    input - counter
  end

  def estimated_usage
    counter * 1.05
  end

  def calculate_estimate
    estimated_usage + counter
  end

  def expected_lower_range
    submitted_value * 0.85
  end

  def expected_higher_range
    submitted_value * 1.15
  end

end
