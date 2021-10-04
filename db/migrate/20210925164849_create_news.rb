class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :name
      t.text :body
      t.integer :edit_counter

      t.timestamps
    end
  end
end
