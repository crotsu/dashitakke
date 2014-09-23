class RemoveQuestionFromSource < ActiveRecord::Migration
  def change
    remove_reference :sources, :question, index: true
  end
end
