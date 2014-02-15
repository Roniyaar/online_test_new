class AnswersController < ApplicationController

	def create
		@question = Question.find(params[:question])
		text = params[:text]
		correct = params[:correct] == 1
		new = Answer.correct(:text => text, :correct => correct, :question => @question.id)
		if new.correct
			@question.exam = new
		end
		redirect_to questions_path
	end
	def method_name
		
	end
end
