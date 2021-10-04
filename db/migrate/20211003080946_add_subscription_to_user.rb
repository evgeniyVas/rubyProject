class AddSubscriptionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscription, :integer, default: 0
  end
end
