class Quiz < ActiveRecord::Base
  serialize :answers, Hash
  attr_accessible :answer, :create_answer, :duration, :category_id, :user_id, :correct_answers, :answers
  has_many :questions, :dependent => :destroy
  belongs_to :category
  belongs_to :user
  has_many :descriptives, :dependent => :destroy

  # Instance methods
  def create_descriptive_answers(user_answers)
  	descriptive_qs = {}
  	user_answers.each do |k, v|
  		option_type = Question.find(k).option_type.to_i
  		if option_type == 2
  			descriptive_qs[k] = v.values.first
  		end
  	end

  	# Now create descriptve objects associated with this quiz
  	unless descriptive_qs.empty?
  		descriptive_qs.each do |q, a|
  			self.descriptives.create!(:descriptive_answer => a, :question_id => q.to_i) unless q.empty? || q.nil?
  		end
  	end
  end
end
