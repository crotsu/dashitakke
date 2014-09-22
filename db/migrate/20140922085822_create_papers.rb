class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :index, null: false
      t.date :given_date, null: false
      t.boolean :set, null: false, default: false

      t.timestamps
    end
  end
end
