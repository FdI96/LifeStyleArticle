class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :authorid
      t.string :title
      t.text :text
      t.string :image
      t.date :createdAt

      t.timestamps
    end
  end
end
