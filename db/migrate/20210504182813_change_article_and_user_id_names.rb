class ChangeArticleAndUserIdNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :votes, :UserId, :userid
    rename_column :votes, :ArticleId, :articleid
  end
end
