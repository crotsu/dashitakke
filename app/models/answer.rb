class Answer < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :question
  belongs_to :user
  has_one :source
end
