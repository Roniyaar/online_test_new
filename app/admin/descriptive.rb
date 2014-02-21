ActiveAdmin.register Descriptive do
  actions :index
  index do
  	column :question_id
  	column :answer
  	column :user_id
  	column :quiz_id
  	column :mark_answer
  end  
end
