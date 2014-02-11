class Category < ActiveRecord::Base
  attr_accessible :question_category
  has_many :questions
end
