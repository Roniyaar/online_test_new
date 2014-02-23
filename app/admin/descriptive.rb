ActiveAdmin.register Descriptive do
  actions :index, :accept, :deny
  index do
  	column :quiz_id
    column :question_id
  	column "Question Name" do |f|
  		Question.find_by_id(f.question_id).name.html_safe
  	end
  	column :descriptive_answer
  	# column "user" do |u|
  	# 	User.find_by_id(u.user_id).name
  	# end
  	column "mark_answer" do |descriptive|
      # link_to status_tag("YO YO")
      if descriptive.mark_answer.nil?
        ul :class => 'accept_or_deny' do
          li link_to "accept", accept_admin_descriptive_path(descriptive, :accepted => 'true'), :remote => true
          li link_to "deny", deny_admin_descriptive_path(descriptive, :accepted => 'false'), :remote => true
        end
      else
        accepted_or_denied = descriptive.mark_answer == true ? 'Accepted' : 'Denied'
        ul accepted_or_denied
      end
    end
  end
  # member_action :marking_descriptive_answers, :method => :put do
  #   question = Question.find(params[:question_id])
  #   quiz = Quiz.find(params[:quiz_id])
  #   # redirect_to { :action => :index}
  # end
  # controller do
  #   def accept
  #     respond_to do |format|
  #       format.js
  #     end
  #   end
  #   def deny
  #     respond_to do |format|
  #       format.js
  #     end
  #   end
  # end
  member_action :accept, :method => :get do
    @d = Descriptive.find(params[:id])
    @accepted_or_denied = params[:accepted] == 'true' ? "Accepted" : "Denied"
    @d.update_attributes(:mark_answer => 1)
    correct_answers = @d.quiz.correct_answers.to_i
    @d.quiz.update_attributes(:correct_answers => correct_answers + 1)
  end

  member_action :deny, :method => :get do
    @d = Descriptive.find(params[:id])
    @accepted_or_denied = params[:accepted] == 'true' ? "Accepted" : "Denied"
    @d.update_attributes(:mark_answer => 0)
  end
end
