class Category < ActiveRecord::Base
  attr_accessible :question_category
  has_many :questions
  validates :question_category, presence: true, uniqueness: true
  has_many :quizzes, :dependent => :destroy
end
