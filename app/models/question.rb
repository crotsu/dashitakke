class Question < ActiveRecord::Base
  belongs_to :paper
  has_many :answers

  def getfilename question_id, user_id
  	source = Question.find(question_id).answers.find_by(user_id: user_id).source
  	if source
  		return source.avatar_file_name
  	else
  		return "none"
  	end
  end
end
