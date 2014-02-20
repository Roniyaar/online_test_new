ActiveAdmin.register Quiz do
	actions :index
	index do
		column :id
		column :answers
		column :create_answer
		column :user_id
		column :category_id
		column :name do |n|
      User.find_by_id(n.user_id).name
    end
    column :email do |n|
      User.find_by_id(n.user_id).email
    end
	end
end
