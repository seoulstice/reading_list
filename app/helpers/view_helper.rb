module ViewHelper

  def convert_days(params)
    if params == "1"
      "Day"
    elsif params == "7"
      "7 Days"
    elsif params == "30"
      "30 Days"
    end
  end

end
