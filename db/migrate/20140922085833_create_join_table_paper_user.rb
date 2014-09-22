class CreateJoinTablePaperUser < ActiveRecord::Migration
  def change
    create_join_table :papers, :users do |t|
      # t.index [:paper_id, :user_id]
      # t.index [:user_id, :paper_id]
    end
  end
end
