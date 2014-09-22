class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attendnumber, :integer
    add_column :users, :number, :string
    add_column :users, :name, :string
    change_column :users, :attendnumber, :integer, null: false
    change_column :users, :number, :string, null: false
    change_column :users, :name, :string, null: false
  end
end
