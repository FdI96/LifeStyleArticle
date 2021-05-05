class RenameForeignKeys < ActiveRecord::Migration[6.1]
  def change
    rename_column :votes, :userid, :user_id
    rename_column :votes, :articleid, :article_id
  end
end
