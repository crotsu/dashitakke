class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attendnumber, :integer
    add_column :users, :number, :string
    add_column :users, :name, :string
  end
end
