class QuizzesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@categories = Category.all
	end
	def new
		@questions = Question.all
		@quiz = Quiz.new
	end
	# def create
	# 	@quiz = Quiz.new(params[:quiz])
	# 	if @quiz.save
	# 		redirect_to quizzes_path
	# 	else
	# 		render 'new'
	# 	end
	# end
	def start
		# @quiz = Quiz.new
		session.delete(:user_answers)
		@category = Category.find(params[:category_id])
		@question = @category.questions
		total = @question.count.to_i
		all_question = @category.questions
		session[:questions] = all_question.sort_by{rand}[0..(total-1)]
		session[:total] = total
		session[:current] = 0
		# session[:correct] = 0
		redirect_to question_quizzes_path(:category_id => @category.id)
	end

	def question
		if params[:commit] == "Continue" || params[:commit] == "Finish"
			if session[:current] == 0
				session.delete(:user_answers)
			end
			@category = Category.find(params[:category_id])
			@question = @category.questions
			@current = session[:current] + 1
			session[:current] = @current
			@total = session[:total]
			### Initializing hash ###
			hash = {}
			@q = Question.find(params[:question_id])
			######Checking option type and send answer in params#######
			if @q.option_type == 0
				hash[params[:question_id]] = params[:answers]
			elsif @q.option_type == 1
				hash[params[:question_id]]= params[:answer_a], params[:answer_b], params[:answer_c], params[:answer_d]
			else
				hash[params[:question_id]] = params[:create_answer]
			end
			######################################
			### merging hash into exising hash ###
			######################################
			if session[:user_answers].nil?
				session[:user_answers]={}
				session[:user_answers].store(params[:question_id],hash)
			else
				session[:user_answers].store(params[:question_id],hash)
			end
			################################################
			## Checking condition for displaying questions ##
			################################################
			if @current >= @total
				redirect_to finish_quizzes_path(:category_id => @category.id, :question_id => @q.id)
			else
				@question = Question.find(session[:questions][@current])
				@answer = @question.answer
			end
			@descriptive_value = session[:user_answers]
			@descriptive_value.each do |key, value|
				question = Question.find_by_id(key)
				@current = session[:current]
				if question.option_type == 0 && params[:commit] == "Continue"
			    @user_answer = value[key]
			  elsif question.option_type == 1 && params[:commit] == "Continue" || params[:commit] == "Finish"
			  	@user_answer = value[key]
			  	@ds_value1 = @user_answer.first
			  	@ds_value2 = @user_answer.second
			  	@ds_value3 = @user_answer.third
			  	@ds_value4 = @user_answer.fourth
			  else
			  	@user_answer = value[key]
			  end
			end
		elsif params[:commit] == "Back"
			@category = Category.find(params[:category_id])
			@question = @category.questions
			@current = session[:current] - 1
			if @current == 0
				session.delete(:user_answers)
			end
			session[:current] = @current
			@total = session[:total]
			if @current >= @total
				redirect_to finish_quizzes_path
			end
			@question = Question.find(session[:questions][@current])
			@answer = @question.answer
			unless session[:user_answers].nil?
				@descriptive_value = session[:user_answers]
				@descriptive_value.each do |key, value|
					question = Question.find_by_id(key)
					if question.option_type == 0
				    @user_answer = value[key]
				  elsif question.option_type == 1
				  	@user_answer = value[key]
				  	@ds_value1 = @user_answer.first
				  	@ds_value2 = @user_answer.second
				  	@ds_value3 = @user_answer.third
				  	@ds_value4 = @user_answer.fourth
				  else
				  	@user_answer = value[key]
				  end
				end
			end
		else
			@quiz = Quiz.new
			@category = Category.find(params[:category_id])
			@question = @category.questions
			if session[:current] == 0
				session.delete(:user_answers)
			end
			@current = session[:current]
			@total = session[:total]
			if @current >= @total
				redirect_to finish_quizzes_path
			end
			@question = Question.find(session[:questions][@current])
			@answer = @question.answer
			session[:question] = @question
			session[:answer] = @answer
		end
	end
	def exam
		@questions = Question.all
		@current = session[:current] + 1
		@question = Question.find(session[:questions][@current])
		@total = session[:total]
		examid = params[:exam]
	end
	def finish
		@correct = session[:correct]
		@total = session[:total]
		@quiz = Quiz.new(:category_id => params[:category_id],
										 :user_id => current_user.id,
										 :correct_answers => find_correct_answers(session[:user_answers])
										)
		if @quiz.save
			@quiz.create_descriptive_answers(session[:user_answers])
			session.delete(:user_answers)
			redirect_to finish_exam_quizzes_path
		end
	end
	def finish_exam
		
	end

	# def question_back_button
	# 	@category = Category.find(params[:category_id])
	# 	@question = @category.questions
	# 	@current = session[:current] - 1
	# 	session[:current] = @current
	# 	@total = session[:total]
	# 	if @current >= @total
	# 		redirect_to finish_quizzes_path
	# 	end
	# 	@question = Question.find(session[:questions][@current])
	# 	respond_to do |format|
	# 		format.js
	# 	end
	# end

	private
	def find_correct_answers(user_answers)
		count = 0
		# ua = user_answers.values
		user_answers.each do |key, value|
			question = Question.find_by_id(key)
			user_answer = value[key]
			if question.option_type == 0
				actual_answer = question.answer.right_answer
			elsif question.option_type == 1
				actual_answer = question.answer.right_choices.reject(&:empty?)
			end
			actual_answer == user_answer ? (count += 1) : count
		end
		return count
	end
end
