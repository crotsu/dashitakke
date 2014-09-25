class Paper < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_and_belongs_to_many :users

  def undone_questions
    undone = Array.new
    self.answers.each do |answer|
      if answer.status == "UNDONE"
        undone.push answer
      end
    end
    return undone
  end
end
