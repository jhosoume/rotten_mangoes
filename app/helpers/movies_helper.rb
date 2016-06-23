module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end
  
  # return min and max values in a string
  def range_duration(statement)
    case statement
    when "Under 90 minutes"
      [0, 90]
    when "Between 90 and 120 minutes"
      [90, 120]
    when "Over 120 minutes"
      [120, 1000]
    end
  end

end
