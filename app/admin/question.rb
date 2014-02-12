ActiveAdmin.register Question do
  index do
    column :name
    column :option_type do |question|
      Answer::OPTIONS.key(question.option_type)
    end
    column :question_category do |q|
      Category.find_by_id(q.category_id).question_category
    end
  end
  show do
    h3 question.name
  end
  form do |f|
    f.inputs do
    	f.input :category_id, :as => :select, :collection => Category.all.collect{|a| [a.question_category, a.id]}, :include_blank => false, :prompt => "please select category"
    	f.input :name, as: :html_editor
      f.input :option_type, :as => :select, :collection => Answer::OPTIONS, :include_blank =>false, :prompt => "please select option", :remote => true, :input_html => { :id => "question_option_type" }
    end
    f.inputs :for => [:answer, f.object.answer || Answer.new] do |h|
      h.input :A
      h.input :B
      h.input :C
      h.input :D
      h.input :right_answer, :as => :radio, :collection => ['A', 'B', 'C', 'D']
      h.input :right_choices, :as => :check_boxes, :collection => ['A', 'B', 'C', 'D']
      h.input :write_answer
    end
    f.actions
  end
  
  controller do
    def new
      @question = Question.new
      @question.build_answer
    end
  end
end