class Question < ActiveRecord::Base
  attr_accessible :name, :category_id, :option_type
  belongs_to :category
  has_one :answer
  accepts_nested_attributes_for :answer
  OPTIONS = {'single_choice' => 0, 'multiple_choice' => 1, 'descriptive' => 2}
end
