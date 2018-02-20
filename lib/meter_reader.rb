class MeterReader

  CURRENT_READING = 8000

  def user_input
    @input = gets.to_i
  end

  def new_reading
    CURRENT_READING + @input
  end

end
