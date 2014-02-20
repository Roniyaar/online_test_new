ActiveAdmin.register Quiz do
	actions :index
	index do
		column :id
		column :answers
		column :create_answer
		column :user_id
		column :category_id
	end
end
