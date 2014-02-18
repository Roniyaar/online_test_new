ActiveAdmin.register Result do
	actions :index
	index do
		column :user_id
		column "Name" do |n|
			User.find_by_id(n.user_id).name
		end
		column "Email" do |e|
			User.find_by_id(e.user_id).email
		end
		column "Mobile No" do |m|
			User.find_by_id(m.user_id).mobile_no
		end
		column "category" do |c|
			Category.find_by_id(c.user_id).name
		end
		column :final_result
	end
end
