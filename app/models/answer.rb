class Answer < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :question
  belongs_to :user
  has_one :source

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
