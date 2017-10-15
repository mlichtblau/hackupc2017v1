class AddCarToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :car, :string
  end
end
