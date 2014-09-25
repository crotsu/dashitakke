class Assignment < ActiveRecord::Base
  belongs_to :paper
  belongs_to :user
  has_many :answers, dependent: :destroy

  def undone_answers
    undone = Array.new
    self.answers.each do |answer|
      if answer.status == "UNDONE"
        undone.push answer
      end
    end
    return undone
  end
end
