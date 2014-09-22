class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :index
      t.date :given_date
      t.boolean :set

      t.timestamps
    end
  end
end
