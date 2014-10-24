module ErrorHelper
  # A customization of Devise's devise_error_messages! method
  # Meant to normalize error messages across errors
  # Added require line to config/initializers/tools.rb

  def error_messages(object_possibly_with_error_messages)
    return "" if object_possibly_with_error_messages.errors.empty?

    messages = object_possibly_with_error_messages.errors.messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: object_possibly_with_error_messages.errors.count,
                      resource: object_possibly_with_error_messages.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
