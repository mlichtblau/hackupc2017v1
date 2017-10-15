class AddTimeToScore < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :time, :string
  end
end
