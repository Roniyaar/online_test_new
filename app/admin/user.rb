ActiveAdmin.register User do
	index do
	  column :name
	  column :email
	  column :password
	  column :password_confirmation
	end
	form do |f|
		f.inputs do
			f.input :name
			f.input :email
			f.input :password
			f.input :password_confirmation
		end
		f.actions
	end
end
