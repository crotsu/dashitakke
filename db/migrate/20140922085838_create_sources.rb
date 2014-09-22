class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :filename
      t.string :content_type
      t.integer :filesize
      t.binary :code
      t.references :question, index: true

      t.timestamps
    end
  end
end
