ActiveAdmin.register Quiz do
	actions :index
	index do
		column :id
		column :user_id
		column "name" do |n|
      User.find_by_id(n.user_id).name
    end
    column "email" do |e|
      User.find_by_id(e.user_id).email
    end
    column "question_category" do |q|
      Category.find_by_id(q.category_id).question_category
    end
    # column :create_answer
		# column "create_answer" do |user_attempted_answers|
		# 	user_attempted_answers.answers.each do |key, value|
		# 		question = Question.find_by_id(key)
		# 		if question.option_type == 2
		# 		  user_answer = value[key]
		# 		end
		# 	end
		# end

		column :correct_answers
	end
	controller do
		def check_descriptive_answers
			respond_to do |format|
				format.js
			end
		end
	end
end
