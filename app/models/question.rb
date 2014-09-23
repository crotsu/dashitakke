class Question < ActiveRecord::Base
  belongs_to :paper
  has_many :sources
end
