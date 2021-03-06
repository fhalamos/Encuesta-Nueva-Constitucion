class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @question = Question.find(params[:id]).order('number ASC')
  end

  def index
  	@questions = Question.all.includes(:answers)
    render json: @questions.to_json(include: :answers), status: :ok
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def create
  	@question = Question.new(question_params)
  	if @question.save
  		redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end




  private
    def question_params
      params.require(:question).permit(:content)
    end
end
