module ArticlesHelper
  def display_errors(article)
    return unless article.errors.any?

    html = ''
    html = "<div id='error_explanation'>"
    html = content_tag(:h2, "#{pluralize(article.errors.count, 'error')} prohibited this article from being saved:")
    html = '<ul>'
    article.errors.each do |error|
      html = content_tag(:li, error.full_message)
    end
    html = '</ul>'
    html = '</div>'
    html.html_safe
  end
end
