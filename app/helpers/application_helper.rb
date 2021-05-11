module ApplicationHelper
  def vote_or_unvote_btn(article)
    vote = Vote.find_by(article_id: article.id, user_id: current_user.id)
    if vote
      button_to('Unvote', article_vote_path(id: vote.id, article_id: article.id, user_id: current_user.id, category_id: article.category_id), method: :delete, class: 'btn-to-link')
    else
      button_to('Vote', article_votes_path(article_id: article.id, category_id: article.category_id), class: 'btn-to-link')
    end
  end

  def most_voted(articles)
    highest = 0
    theArticle = nil
    articles.each do |article|
      if article.votes.length > highest
        highest = article.votes.length
        theArticle = article
      end
    end
    theArticle
  end
end
