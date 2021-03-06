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
    @score = current_user.get_results
    render json: @score, status: :ok
  end

  def quadrant
    @quadrant = Quadrant.where(name: current_user.get_quadrant).first
    render json: @quadrant, status: :ok
  end

  def statistics
    @statistics = UserAnswer.all.group(:answer_id).count(:answer_id)
    render json: @statistics, status: :ok
  end

  def reset_answers
    if current_user
      current_user.user_answers.delete_all
      render json: {}, status: :ok
    else
      render json: {}, status: 422
    end
  end


  private

  def answer_params
    puts params[:poll]
    params.require(:poll).permit(:question_id, :answer_id)
  end
end
