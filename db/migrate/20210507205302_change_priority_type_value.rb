class ChangePriorityTypeValue < ActiveRecord::Migration[6.1]
  def change
    change_column(:categories, :priority, :integer, using: 'priority::integer')
  end
end
