class AddCarNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :car_name, :string
  end
end
