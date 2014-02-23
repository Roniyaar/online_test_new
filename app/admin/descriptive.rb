ActiveAdmin.register Descriptive do
  actions :index
  index do
  	column :quiz_id
  	column "question" do |f|
  		Question.find_by_id(f.question_id).name.html_safe
  	end
  	column :descriptive_answer
  	# column "user" do |u|
  	# 	User.find_by_id(u.user_id).name
  	# end
  	column :mark_answer
  end  
end
