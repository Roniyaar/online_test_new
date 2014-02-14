class QuizzesController < ApplicationController
	def index
		@quizzes = Quiz.all
	end
	# def new
	# 	@questions = Question.all
	# 	@quiz = Quiz.new
	# end
	# def create
	# 	@quiz = Quiz.new(params[:quiz])
	# 	if @quiz.save
	# 		redirect_to new_quiz_path
	# 	else
	# 		render 'new'
	# 	end
	# end
	def start
		debugger
		@questions = Question.all
		total = @questions.count.to_i
		all_question = Question.find(:all).map {|x| x.id}
		session[:questions] = all_question.sort_by{rand}[0..(total-1)]
		session[:total] = total
		session[:current] = 0
		session[:correct] = 0
		redirect_to :action => "question"
	end
	def question
		debugger
		@current = session[:current]
		@total = session[:total]
		if @current <= @total
			redirect_to :action => "finish"
			return
		end
		@question = Question.find(session[:questions][@current])
		@answer = @question.answer.sort_by{rand}
		session[:question] = @question
		session[:answer] = @answer
	end
	def answer
		@current = session[:current]
		@total = session[:total]
		answerid = params[:answer]
		session[:question] = @question
		session[:answer] = @answer
		@answer = answerid ? Answer.find(answerid) : nil
		if @answer && @answer.correct
			@correct = true
			session[:correct] += 1
		else
			@correct = false
		end
		session[:current] += 1
	end
	def finish
		@correct = session[:correct]
		@total = session[:total]
		@score = @correct * 100/@total
	end
end
