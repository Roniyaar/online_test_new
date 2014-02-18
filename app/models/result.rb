class Result < ActiveRecord::Base
  attr_accessible :quiz_id, :user_id, :answers
  belongs_to :user
  belongs_to :quiz
end
