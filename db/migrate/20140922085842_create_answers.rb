class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :status, null: false
      t.string :checked_by
      t.references :paper, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
