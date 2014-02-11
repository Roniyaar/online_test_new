ActiveAdmin.register Question do
  index do
    column :name
    column :option_type
    column :category_id
  end
  form do |f|
    f.inputs do
    	f.input :category_id, :as => :select, :collection => Category.all.collect{|a| [a.question_category, a.id]}, :include_blank => false, :prompt => "please select category"
    	f.input :name, as: :html_editor
      f.input :option_type, :as => :select, :collection => Answer::OPTIONS, :include_blank =>false, :prompt => "please select option", :remote => true, :input_html => { :id => "question_option_type" }
      f.has_one :answer, :new_record => false do |af|
        af.input :A,
        af.input :B,
        af.input :C,
        af.input :D,
        af.input :correct_answer, :as => :radio
        
        af.input :descriptive, :as => :text
      end
    end
    f.actions
  end
  
  controller do
  end
end