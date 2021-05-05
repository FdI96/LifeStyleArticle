class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :UserId
      t.integer :ArticleId

      t.timestamps
    end
  end
end
