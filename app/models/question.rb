class Question < ActiveRecord::Base
  belongs_to :paper
  has_many :answers

  def getfilename question_id, user_id
  	source = Question.find(question_id).answers.find_by(user_id: user_id).source
  	if source
  		return source.filename
  	else
  		return "none"
  	end
  end

  def status_to_mark
    case self.status
    when "DONE"
      return "○"
    when "WAITING"
      return "△"
    else
      return ""
    end
  end

end
