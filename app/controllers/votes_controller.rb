class VotesController < ApplicationController
  def create
    @vote = current_user.votes.create(article_id: params[:article_id])
    category_id = params[:category_id]
    redirect_to "/categories/#{category_id}", notice: 'You voted this article.'
  end

  def destroy
    vote = Vote.find_by(id: params[:id], article: params[:article_id])
    category_id = params[:category_id]
    if vote
      vote.destroy
      redirect_to "/categories/#{category_id}", notice: 'You unvoted this article.'
    else
      redirect_to "/categories/#{category_id}", alert: 'You cannot unvote an article that you did not vote before.'
    end
  end
end
