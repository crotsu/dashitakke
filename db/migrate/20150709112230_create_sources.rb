class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.references :answer, index: true

      t.timestamps
    end
  end
end
