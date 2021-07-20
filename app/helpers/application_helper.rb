# rubocop:disable Metrics/ModuleLength, Style/GuardClause
module ApplicationHelper
  def vote_or_unvote_btn(article)
    vote = Vote.find_by(article_id: article.id, user_id: current_user.id)
    if vote
      button_to('Unvote',
                article_vote_path(id: vote.id,
                                  article_id: article.id,
                                  user_id: current_user.id,
                                  category_id: article.category_id),
                method: :delete,
                class: 'btn-to-link')
    else
      button_to('Vote', article_votes_path(article_id: article.id, category_id: article.category_id),
                class: 'btn-to-link')
    end
  end

  def most_voted(articles)
    highest = 0
    the_article = nil
    articles.each do |article|
      if article.votes.length > highest
        highest = article.votes.length
        the_article = article
      end
    end
    the_article
  end

  def top_row(articles)
    html = ''
    html << if most_voted(articles).nil?
              content_tag(:h1, "There aren't votes for any image", class: 'text-center text-warning mt-5')
            else
              link_to(image_tag(url_for(most_voted(@articles).image), class: 'most-voted-img mt-4 p-0',
                                                                      data: 'most-voted-article'),
                      article_path(most_voted(articles)))
            end
    html.html_safe
  end

  def show_sign_in
    html = ''
    html << link_to(link_to('Sign In', new_user_session_path)) unless user_signed_in?
    html.html_safe
  end

  def show_sign_up
    html = ''
    html << link_to(link_to('Sign up', new_user_registration_path)) unless user_signed_in?
    html.html_safe
  end

  def show_sign_out
    html = ''
    if user_signed_in?
      html << link_to(button_to('Sign out', destroy_user_session_path, method: :delete,
                                                                       class: 'btn-to-link'))
    end
    html.html_safe
  end

  def show_lay_cat(categories)
    if user_signed_in?
      html = ''
      html << "<div class='text-center'>"
      categories.each do |category|
        html << "<span class='m-3'>"
        html << link_to(link_to(category.name.to_s, category, class: 'text-white text-decoration-none'))
        html << '</span>'
      end
      html << '</div>'
      html.html_safe
    end
  end

  def display_cat(categories)
    html = ''
    categories.each do |category|
      html << "<div class='card-index card bg-dark text-whit col m-1 p-0'>"
      next if category.articles.last.nil?

      html << image_tag(url_for(category.articles.last.image), class: 'card-img card-index p-0', data: 'IMAGE BROKEN')
      html << "<div class='card-img-overlay p-0'>"
      html << "<h5 class='card-title position-relative'>"
      html << if user_signed_in?
                link_to(link_to(category.name.to_s, category, class: 'text-white underline-yellow'))
              else
                link_to(link_to(category.name.to_s, new_user_session_path, class: 'text-white underline-yellow'))
              end
      html << '</h5>'
      html << content_tag(:p, category.articles.last.title, class: 'card-text top-50 start-0  text-white')
      html << '</div>'
      html << '</div>'
    end
    html.html_safe
  end

  def display_arts(category)
    html = ''
    category.articles.with_attached_image.includes(%i[author votes]).each do |article|
      html << "<div class='row col-6'>"
      html << "<div class='col-6 mb-2'>"
      html << image_tag(url_for(article.image), class: 'img-card', data: 'IMAGE BROKEN')
      html << '</div>'
      html << "<div class='col-6 mt-2'>"
      html << "<div class='card-body'>"
      html << "<h5 class='card-title text-warning text-decoration-underline'>"
      html << link_to(article.title.to_s, article, class: 'text-warning')
      html << '</h5>'
      html << content_tag(:p, article.text, class: 'card-text')
      html << "<p class='card-text'>"
      html << content_tag(:span, vote_or_unvote_btn(article))
      html << content_tag(:span, "Votes: #{article.votes.length}")
      html << '</p>'
      html << "<p class='card-text'>"
      html << content_tag(:small, article.author.username, class: 'text-muted')
      html << '</p>'
      html << '</div>'
      html << '</div>'
      html << '</div>'
    end
    html.html_safe
  end
end
# rubocop:enable Metrics/ModuleLength, Style/GuardClause
