class Quiz < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  belongs_to :user
end
