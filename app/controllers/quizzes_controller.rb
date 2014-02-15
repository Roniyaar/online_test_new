class QuizzesController < ApplicationController
	def index
		@quizzes = Quiz.all
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
		@questions = Question.all
		total = @questions.count.to_i
		all_question = Question.find(:all).map {|x| x.id}
		session[:questions] = all_question.sort_by{rand}[0..(total-1)]
		session[:total] = total
		session[:current] = 0
		session[:correct] = 0
		redirect_to question_quizzes_path
	end
	# def new
	# 	debugger
	# 	@question = Question.find(session[:questions]
	# 	@quiz = Quiz.new
	# end
	def question
		if params[:commit] == "Continue"
			@questions = Question.all
			@current = session[:current] + 1
			session[:current] = @current
			@total = session[:total]
			if @current >= @total
				redirect_to finish_quizzes_path
				return
			end
			@question = Question.find(session[:questions][@current])
			@answer = @question.answer
		else
			@questions = Question.all
			@current = session[:current]
			@total = session[:total]
			if @current >= @total
				redirect_to finish_quizzes_path
				return
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
		# @score = @correct * 100/@total
	end
end
