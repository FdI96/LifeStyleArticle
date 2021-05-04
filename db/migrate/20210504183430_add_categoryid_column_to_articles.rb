class AddCategoryidColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :categoryid, :integer
  end
end
