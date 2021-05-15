module CategoriesHelper
  def display_errors(category)
    if category.errors.any?
      html = ''
      html = "<div id='error_explanation'>"
      html = content_tag(:h2, "#{pluralize(category.errors.count, 'error')} prohibited this article from being saved:")
      html = '<ul>'
      category.errors.each do |error|
        html = content_tag(:li, error.full_message)
      end
      html = '</ul>'
      html = '</div>'
      html.html_safe
    end
  end
end
