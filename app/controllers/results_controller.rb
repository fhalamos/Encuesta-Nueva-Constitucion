class ResultsController < ApplicationController
before_action :authenticate_user!

  def index
    
    #Debemos mostrar los resultados

    #1. Mi posicion en el grafico de acuerdo a mis respuestas

    #1.1 Primero debo recalcular la posición

    x=0 #nueva posicion en el eje x 
    y=0 #nueva posicion en el eje y

    #Recorro las respuestas del usuario
    @userAnswers = UserAnswer.where(user_id: current_user.id)
    puts @userAnswers

    puts "x inicial: "+x.to_s
    puts "y inicial: "+y.to_s


    @userAnswers.each do |userAnswer|
      #Para cada respuesta veo cuanto aporta en cada uno de los ejes
      puts "entre a una respuesta del usuario"
      @answer = Answer.find(userAnswer.answer_id)
      puts "la respuesta va a aumenar "+@answer.Xaxis.to_s+" en el eje x"
      puts "la respuesta va a aumenar "+@answer.Yaxis.to_s+" en el eje y"
      x = x + @answer.Xaxis
      y = y + @answer.Yaxis
      puts "x: "+x.to_s
      puts "y: "+y.to_s
    end

    puts "x final: "+x.to_s
    puts "y final: "+y.to_s
    

    #Guardamos la nueva posición del usuario
    current_user.Xposition = x
    current_user.Yposition = y
    current_user.save


    #2. La posicion en el grafico de los famosos y de mis amigos (maximo 3)
    @famousPeople = User.where(famous: true)

    #ACA NO SE COMO VER CUALES DE LOS USUARIOS EN LD BD SON MIS AMIGOS
    #podria ocupar una gema para ver todos mis amigos, y ver cuales de ellos estan la bd, pero no hay una forma mas rapida?
    @friends = User.where(famous: false)


    #3. Los % de respuesta de cada una de las preguntas
    @questions = Question.all
    @answers = Answer.all


  end

end
