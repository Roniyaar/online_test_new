class Quiz < ActiveRecord::Base
  attr_accessible :answer1, :answer2, :answer3, :answer4, :create_answer, :duration
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :results, :dependent => :destroy
  belongs_to :category
  belongs_to :user
end
