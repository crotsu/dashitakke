class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :filename, null: false
      t.string :content_type, null: false
      t.integer :filesize, null: false
      t.binary :code, null: false
      t.references :question, index: true

      t.timestamps
    end
  end
end
