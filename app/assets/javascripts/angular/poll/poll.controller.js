'use strict';

angular.module('encuestaNuevaConstitucion')
  .controller('PollController', [ '$scope', 'Question', 'Postit', 'Poll', function ($scope, Question, Postit, Poll) {

    $scope.currentQuestionIndex = 0;
    $scope.questions = [];
    $scope.currentAnswerId = 0;
    $scope.pollCompleted = false;

    $scope.postits = [];

    Question.index(function(response){
      $scope.questions = response;

      Poll.answers(function(data){
        $scope.pollCompleted = data.length == $scope.questions.length;
        if($scope.pollCompleted){
          $scope.loadResults();
        }
        else{
          $scope.currentQuestionIndex = data.length;
        }

      });

    });
    Postit.index(function(data){
      $scope.postits = data;
    });

    $scope.loadResults = function(){
      Poll.results(function(data){
        $scope.results = data;
      });
    }


    $scope.submitAnswer = function(){
      var answerData = {
        answer_id: $scope.currentAnswerId,
        question_id: $scope.questions[$scope.currentQuestionIndex].id
      }
      Poll.answer(answerData, function(result){
        if($scope.currentAnswerId > 0){
          $scope.currentQuestionIndex += 1;
          if($scope.currentQuestionIndex == $scope.questions.length){
            $scope.pollCompleted = true;
            $scope.loadResults();
          }
        }
        else{
          Materialize.toast('Selecciona una respuesta para continuar!', 3000);
        }
      }, function(error){
        console.log('Server error.');
      });

    }

    $scope.getProgress = function(){
      return ($scope.currentQuestionIndex + 1) * 100 / $scope.questions.length;
    }

    $scope.getProgressFraction = function(){
      return ($scope.currentQuestionIndex + 1) + '/' + $scope.questions.length;
    }

}]);
