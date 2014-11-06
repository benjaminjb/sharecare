module ApplicationHelper
  def reload_flash
    page.replace "message_center", :partial => "layouts/message_center"
  end
end
