class AddAssignmentIdToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :assignment, index: true
  end
end
