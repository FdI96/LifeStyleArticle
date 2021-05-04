class RenameForeignKeys < ActiveRecord::Migration[6.1]
  def change
    rename_column :votes, :userid, :user_id
    rename_column :votes, :articleid, :article_id
    rename_column :articles, :authorid, :author_id
    rename_column :articles, :categoryid, :category_id
  end
end
