class Assignment < ActiveRecord::Base
  belongs_to :paper
  belongs_to :user
  has_many :answers, dependent: :destroy

  # 未完了の問題
  def undone_answers
    undone = Array.new
    self.answers.each do |answer|
      if answer.status == "UNDONE"
        undone.push answer
      end
    end
    return undone
  end

  # 完了している問題
  def done_answers
    done = Array.new
    self.answers.each do |answer|
      if answer.status == "DONE"
        done.push answer
      end
    end
    return done
  end

  # 問題の数
  def count_questions
    return self.paper.count_questions
  end

  # 達成度
  def progress
    if (self.count_questions==0)
      return 0
    else
      return (self.done_answers.length.to_f / self.count_questions * 100).to_i
    end
  end

end
