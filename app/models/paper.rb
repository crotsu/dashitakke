class Paper < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy

  def count_questions
    return self.questions.length
  end
end
