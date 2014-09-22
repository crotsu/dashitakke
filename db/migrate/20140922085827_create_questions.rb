class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :index, null: false
      t.string :need_check, null: false
      t.integer :point, null: false
      t.text :contents
      t.references :paper, index: true

      t.timestamps
    end
  end
end
