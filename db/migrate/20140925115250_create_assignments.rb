class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :paper, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
