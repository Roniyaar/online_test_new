class Question < ActiveRecord::Base
  attr_accessible :name, :category_id, :option_type
  belongs_to :category
  has_one :answer
  OPTIONS = {0 => 'single_choice',1 => 'multiple_choice', 2 => 'descriptive'}
end
