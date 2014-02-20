class QuestionsController < ApplicationController
	def index
    #@category_question = Category.all.collect{|a| [a.question_category, a.id]}
		@questions = Question.all
	end
	def new
		@question = Question.new
	end
	def show
    #@category = Category.find(params[:id])
		@question = Question.find(params[:id])
	end
	def edit
		@question = Question.find(params[:id])
	end
	def create
    @category = Category.find(params[:question][:category_id])
    @question = @category.questions.build(params[:question])
    if @question.option_type == 0
      answer_attributes = [params[:A], params[:B], params[:C], params[:D]]
      @question.build_answer(:question_answer => answer_attributes, :correct_answer => [params[:right_answer]])
    elsif @question.option_type == 1
      answer_attributes = [params[:A], params[:B], params[:C], params[:D]]
      @question.build_answer(:question_answer => answer_attributes, :correct_answer => [params[:correct_multiple_answers]])
    else
      answer_attributes = [params[:write_answer]]
      @question.build_answer(:question_answer => answer_attributes)
    end
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
  def choices
    @option = params[:option]
    respond_to do |format|
      format.js
    end
  end
end
