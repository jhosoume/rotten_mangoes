module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end
  
  # return min and max values in a string
  def range_duration(statement)
    case statement
    when "Any"
      [0, 1000]
    when "Under 90 minutes"
      [0, 89]
    when "Between 90 and 120 minutes"
      [90, 120]
    when "Over 120 minutes"
      [121, 1000]
    end
  end

end
