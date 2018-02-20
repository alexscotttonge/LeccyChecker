require_relative 'error_library'

class MeterReader

  CURRENT_READING = 8000

  def user_input
    @input = gets.to_i
  end

  def check_length
    if @input.digits.count < 4
      raise ErrorLibrary::InputLengthError, 'Your number must be between 4 and 6 digits long'
    end
  end

  def check_total
    if @input < CURRENT_READING
      raise ErrorLibrary::InputTotalError, 'Your input must be higher than the previous reading'
    end
  end

  def new_reading
    CURRENT_READING + @input
  end

  def within_estimate?
    unless (expected_lower_range..expected_higher_range).include?(calculate_estimate)
      raise ErrorLibrary::EstimateError, 'Your estimate looks like it\'s not quite right'
    end
  end

  private

  def submitted_value
    @input - CURRENT_READING
  end

  def estimated_usage
    CURRENT_READING * 1.05
  end

  def calculate_estimate
    estimated_usage + CURRENT_READING
  end

  def expected_lower_range
    @lower_value = submitted_value * 0.85
  end

  def expected_higher_range
    @higher_value = submitted_value * 1.15
  end

end
