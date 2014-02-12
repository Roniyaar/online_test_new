ActiveAdmin.register Question do
  index do
    column :name
    column :option_type
    column :category_id
    column :A
    column :B
    column :C
    column :D
    column :right_answer
    column :right_choices
    column :write_answer
  end
  form do |f|
    f.inputs do
    	f.input :category_id, :as => :select, :collection => Category.all.collect{|a| [a.question_category, a.id]}, :include_blank => false, :prompt => "please select category"
    	f.input :name, as: :html_editor
      f.input :option_type, :as => :select, :collection => Answer::OPTIONS, :include_blank =>false, :prompt => "please select option", :remote => true, :input_html => { :id => "question_option_type" }
    end
    f.inputs do
      f.has_one :answer, :allow_destroy => true, :for => :answer do |h|
        h.input :A
        h.input :B
        h.input :C
        h.input :D
        h.input :right_answer
        h.input :right_choices
        h.input :write_answer
      end
    end
    f.actions
  end
  
  controller do
    def question_type_choices
      debugger
      @questions = Question.find_by_name params[:name]
      render :layout => false, :template => 'admin/questions/question_type_choices'
    end
  end
end