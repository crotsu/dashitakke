class Question < ActiveRecord::Base
  belongs_to :paper
  has_one :source
end
