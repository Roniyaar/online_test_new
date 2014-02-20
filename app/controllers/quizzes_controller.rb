class QuizzesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@categories = Category.all
	end
	def new
		@questions = Question.all
		@quiz = Quiz.new
	end
	def create
		@quiz = Quiz.new(params[:quiz])
		if @quiz.save
			redirect_to quizzes_path
		else
			render 'new'
		end
	end
	def start
		@quiz = Quiz.new
		@category = Category.find(params[:category_id])
		@question = @category.questions
		total = @question.count.to_i
		all_question = @category.questions
		session[:questions] = all_question.sort_by{rand}[0..(total-1)]
		session[:total] = total
		session[:current] = 0
		session[:correct] = 0
		redirect_to question_quizzes_path(:category_id => @category.id)
	end
	# def new
	# 	debugger
	# 	@question = Question.find(session[:questions]
	# 	@quiz = Quiz.new
	# end
	def question
		if params[:commit] == "Continue"
			# @quiz = Quiz.new
			@category = Category.find(params[:category_id])
			@question = @category.questions
			@current = session[:current] + 1
			session[:current] = @current
			@total = session[:total]
			hash = {}
			@q = Question.find(params[:question_id])
			if @q.option_type == 0
			  hash = {params[:question_id]=>{"answers"=>params[:answers]}}
			elsif @q.option_type == 1
			  hash = {params[:question_id]=>{"A"=>params[:answer_a],"B"=>params[:answer_b],"C"=>params[:answer_c],"D"=>params[:answer_d]}}
			else
				hash = { params[:question_id] => {"correct_answer" => [params[:create_answer]]}}
			end
			if session[:r_id].nil?
				session[:r_id]={}
				session[:r_id].store(params[:question_id],hash)
			else
				session[:r_id].store(params[:question_id],hash)
			end
			answer = session[:r_id]
			if @current >= @total
				redirect_to finish_quizzes_path(:category_id => @category.id, :question_id => @q.id)
			else
			  @question = Question.find(session[:questions][@current])
			  @answer = @question.answer
			end
		elsif params[:commit] == "Back"
			@quiz = Quiz.new
			@category = Category.find(params[:category_id])
			@question = @category.questions
			@current = session[:current] - 1
			session[:current] = @current
			@total = session[:total]
			if @current >= @total
				redirect_to finish_quizzes_path
			end
			@question = Question.find(session[:questions][@current])
			@answer = @question.answer
		else
			@quiz = Quiz.new
			@category = Category.find(params[:category_id])
			@question = @category.questions
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
		# session[:question] = @question
		# session[:exam] = @exam
		# @exam = examid ? Answer.find(examid) : nil
		# if @answer && @answer.correct
		# 	@correct = true
		# 	session[:correct] += 1
		# else
		# 	@correct = false
		# end
		# session[:current] += 1
	end
	def finish
		@correct = session[:correct]
		@total = session[:total]
		@quiz = Quiz.new
		@quiz.answers = session[:r_id]
		# @quiz.create_answer = 
		@quiz.category_id = params[:category_id]
		@quiz.user_id = current_user.id
		if @quiz.save
			session.delete(:r_id)
			redirect_to finish_exam_quizzes_path
		end
		# @score = @correct * 100/@total
	end
	def finish_exam
		
	end
end
