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

  def new_reading
    CURRENT_READING + @input
  end

end
