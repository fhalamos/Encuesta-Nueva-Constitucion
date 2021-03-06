class AnswersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = @questions.answers.find([:id])
  end


  private
    def answer_params
      params.require(:answer).permit(:content, :Xaxis, :Yaxis)      
    end

end
