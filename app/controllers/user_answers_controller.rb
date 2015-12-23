class UserAnswersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    #Recogemos las respuestas del usuario y las guardamos en la BD

    #Para cada pregunta en la base de datos, vamos a buscar la respuesta asociada
    @questions = Question.all
    
    @questions.each do |question|
      
      puts "Question id: "+ question.id.to_s

      #Buscamos en los parametros, la respuesta a la pregunta en cuestion
      answer_id = params[question.id.to_s]
      puts "Answer id: "+answer_id.to_s
      
      #Guardamos la respuesta del usuario en la BD user_answer
      @user_answer = UserAnswer.new

      @user_answer.user_id = current_user.id
      @user_answer.question_id = question.id
      @user_answer.answer_id = answer_id

      #Actualizamos la cantidad de votos en la respuesta asociada
      @answer = Answer.find(answer_id)
      @answer.votes = @answer.votes + 1
      @answer.save
      
      if @user_answer.save
        puts "exitooooooooooooo"
      else
        puts "errorrrrrrrrrrrr"
      end

    end

    redirect_to results_path
  end

end
