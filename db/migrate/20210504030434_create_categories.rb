class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :Name
      t.boolean :Priority

      t.timestamps
    end
  end
end
