class ChangeEditCounterToNews < ActiveRecord::Migration[6.1]
  def change
    change_column_default :news, :edit_counter, 0
  end
end
