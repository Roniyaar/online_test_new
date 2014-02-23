class Descriptive < ActiveRecord::Base
  attr_accessible :descriptive_answer, :mark_answer, :question_id, :quiz_id, :user_id
  belongs_to :question
  belongs_to :user
  belongs_to :quiz
end
