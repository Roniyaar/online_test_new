class Quiz < ActiveRecord::Base
  serialize :answers, Hash
  attr_accessible :answer, :create_answer, :duration, :category_id, :user_id, :correct_answers, :answers
  has_many :questions, :dependent => :destroy
  belongs_to :category
  belongs_to :user
  has_many :descriptives, :dependent => :destroy
end
