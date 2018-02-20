class MeterReader

  CURRENT_READING = 8000

  def user_input
    @input = gets
  end

  def new_reading
    CURRENT_READING + @input
  end

end
