module ApplicationHelper

  def small_display_date(date)
    date.strftime('%B, %Y')
  end

  def display_date(date)
    date.strftime('%B %d, %Y')
  end
end
