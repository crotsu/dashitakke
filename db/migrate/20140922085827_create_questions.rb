class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :index
      t.string :need_check
      t.integer :point
      t.text :contents
      t.references :paper, index: true

      t.timestamps
    end
  end
end
