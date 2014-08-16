module DateHelper

  def friendly_date(date)
    if date.is_a?(String)
      date = Date.strptime(date, '%m/%d/%Y')
    end
    if date.year == Time.now.year
      date.strftime("%B #{date.day.ordinalize}")
    else
      date.strftime("%B #{date.day.ordinalize}, %Y")
    end
  end
  
end