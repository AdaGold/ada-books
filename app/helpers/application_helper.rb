module ApplicationHelper

  def readable_date(date)
    return "[unknown]" unless date
    return content_tag(:span, "#{time_ago_in_words(date)} ago", class: 'date', title: date.to_s)
  end

end
