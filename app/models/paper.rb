class Paper < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_and_belongs_to_many :users
end
