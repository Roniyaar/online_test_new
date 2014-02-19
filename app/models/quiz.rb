class Quiz < ActiveRecord::Base
  serialize :answers, Hash
  attr_accessible :answer, :create_answer, :duration
  has_many :questions, :dependent => :destroy
  # has_many :answers, :dependent => :destroy
  has_many :results, :dependent => :destroy
  belongs_to :category
  belongs_to :user
end
