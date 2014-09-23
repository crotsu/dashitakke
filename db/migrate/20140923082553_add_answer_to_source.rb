class AddAnswerToSource < ActiveRecord::Migration
  def change
    add_reference :sources, :answer, index: true
  end
end
