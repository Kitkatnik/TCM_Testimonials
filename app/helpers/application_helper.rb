module ApplicationHelper
  def kats_id 
    User.find_by_email("kittyserenakat@gmail.com").id 
  end

  def flash_css_class(key)
    case key
    when :notice
      "success"
    when :alert
      "danger"
    else 
      "info"
    end
  end
end
