class DropTablePapersUsers < ActiveRecord::Migration
  def change
    drop_table :papers_users
  end
end
