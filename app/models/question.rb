class Question < ActiveRecord::Base
  attr_accessible :name, :category_id, :option_type, :answer_attributes, :quiz_id
  belongs_to :category
  has_one :answer
  belongs_to :quiz
  has_one :descriptive
  accepts_nested_attributes_for :answer
  OPTIONS = {'single_choice' => 0, 'multiple_choice' => 1, 'descriptive' => 2}
  #validates :name, :category_id, :option_type, presence: true
end
