module ApplicationHelper
  def available_languages
    [
      ['Latviešu', 'lv'],
      ['English',  'en']
    ]
  end

  def boolean_value(value)
    if value
      'Y'
    else
      'N'
    end
  end
end
