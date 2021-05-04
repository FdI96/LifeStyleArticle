class RemoveCreatedAtColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :createdAt
  end
end
