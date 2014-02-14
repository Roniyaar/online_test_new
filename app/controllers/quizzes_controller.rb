class QuizzesController < ApplicationController
	def index
		@quizes = Quiz.all
	end
	def new
		@questions = Question.all
		@quiz = Quiz.new
	end
	def create
		
	end
end
