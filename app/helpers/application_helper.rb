# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_path(controller_name)
    controller_name.to_s
  end
  
  def get_name(controller_name)
    controller_name.to_s.capitalize.singularize
  end
end
