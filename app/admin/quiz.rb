ActiveAdmin.register Quiz do
	actions :index
	index do
		column :id
		# column :user_id
		column "name" do |n|
      User.find_by_id(n.user_id).name
    end
    column "email" do |e|
      User.find_by_id(e.user_id).email
    end
    column "mobile_no" do |m|
    	User.find_by_id(m.user_id).mobile_no
    end
    column "question_category" do |q|
      Category.find_by_id(q.category_id).question_category
    end
		column :correct_answers
	end
	controller do
		
	end
end
