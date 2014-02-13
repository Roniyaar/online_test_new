ActiveAdmin.register Answer do
	actions :index
	index do
		column :id
    column :question do |q|
      Question.find_by_id(q.question_id).name.html_safe
    end
    column :A
    column :B
    column :C
    column :D
    column :right_answer
    column :right_choices
    column :write_answer
  end

  # show do
  # end
  
end
