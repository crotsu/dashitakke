class Question < ActiveRecord::Base
  belongs_to :paper
  has_many :answers, dependent: :destroy
  has_many :sources, dependent: :destroy

  def getfilename question_id, user_id
  	source = Question.find(question_id).answers.find_by(user_id: user_id).source
  	if source
  		return source.filename
  	else
  		return "none"
  	end
  end
end
