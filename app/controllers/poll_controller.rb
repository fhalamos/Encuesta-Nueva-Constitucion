class PollController < ApplicationController
  before_action :authenticate_user!

  def answer
    poll_answer = UserAnswer.new(answer_params.merge({user_id: current_user.id}))
    if poll_answer.save
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end

  def answers
    @answers = current_user.user_answers
    render json: @answers
  end

  def results
    @score = current_user.get_score
    render json: @score, status: :ok
  end


  private

  def answer_params
    puts params[:poll]
    params.require(:poll).permit(:question_id, :answer_id)
  end
end
