class Answer < ActiveRecord::Base
  attr_accessible :question_id, :A, :B, :C, :D, :right_answer, :right_choices, :write_answer
  serialize :right_choices, Array
  attr_accessible :correct_answer, :question_answer, :question_id
  belongs_to :question
  OPTIONS = {'single_choice' => 0,'multiple_choice' => 1, 'descriptive' => 2}
  #validates :A, :B, :C, :D, :right_answer, :right_choices, :write_answer, presence: true 
end
