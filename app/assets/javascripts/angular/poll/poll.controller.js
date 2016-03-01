(function() {
  'use strict';

  angular.module('encuestaNuevaConstitucion')
    .controller('PollController', ['$scope', 'Question', 'Postit', 'Poll', '$compile', 'Facebook', '$location', function($scope, Question, Postit, Poll, $compile, Facebook, $location) {

      $scope.currentQuestionIndex = -1;
      $scope.questions = [];
      $scope.currentAnswerId = 0;
      $scope.pollCompleted = false;
      $scope.chartUserLimit = 3;

      $scope.postits = [];
      $scope.quadrant = {};

      Question.index(function(response) {
        $scope.questions = response;

        Poll.answers(function(data) {
          $scope.pollCompleted = data.length === $scope.questions.length;
          if ($scope.pollCompleted) {
            $scope.loadResults();
          } else {
            $scope.currentQuestionIndex = data.length;
          }
        });
      });

      Postit.index(function(data) {
        $scope.postits = data;
      });

      $scope.resetPoll = function() {
        Poll.resetAnswers(function(response) {
          $scope.pollCompleted = false;
          $scope.currentQuestionIndex = 0;
          $scope.results = [];
          $scope.quadrant = {};
          $('body').scrollTop(0);

        }, function(error) {
          console.log('Failed to reset poll.');
        });
      };

      $scope.isPollAvailable = function() {
        return !$scope.pollCompleted && $scope.currentQuestionIndex >= 0;
      };

      $scope.loadResults = function() {
        Poll.results(function(data) {
          data.forEach(function(result) {
            var coords = $scope.scaleCoordinates(result.score.Xaxis, result.score.Yaxis);
            result.coords = coords;
          });
          $scope.results = data;
        });
        Poll.quadrant(function(data) {
          $scope.quadrant = data;
        });
      };

      $scope.scaleCoordinates = function(x, y) {
        var height = document.getElementById('results-chart').offsetHeight - 80;
        var width = document.getElementById('results-chart').offsetWidth - 180;
        var scaledX = x * width / 24 + 90 + (Math.random() * 30 - 15);
        var scaledY = y * height / 24 + 40 + (Math.random() * 30 - 15);
        return {
          x: scaledX,
          y: scaledY
        };
      };

      $scope.submitAnswer = function() {

        if ($scope.currentAnswerId > 0) {
          var answerData = {
            answer_id: $scope.currentAnswerId,
            question_id: $scope.questions[$scope.currentQuestionIndex].id
          };
          Poll.answer(answerData, function(result) {
            $scope.currentAnswerId = -1;
            $scope.currentQuestionIndex += 1;
            if ($scope.currentQuestionIndex === $scope.questions.length) {
              $scope.pollCompleted = true;
              $scope.loadResults();
            }
          }, function(error) {
            Materialize.toast('Error de conexión. Inténtalo más tarde.', 3000);
          });
        } else {
          Materialize.toast('¡Selecciona una respuesta para continuar!', 3000);
        }
      };

      $scope.shareWithFacebook = function() {
        if ($scope.quadrant.name !== undefined) {
          console.log($scope.getMessage());
          Facebook.feed($location.absUrl(), $scope.getMessage());
        }

      };

      $scope.getMessage = function() {
        return 'La mía es "' + $scope.quadrant.name + '"... la tuya?';
      };

      $scope.getProgress = function() {
        return ($scope.currentQuestionIndex + 1) * 100 / $scope.questions.length;
      };

      $scope.getProgressFraction = function() {
        return ($scope.currentQuestionIndex + 1) + '/' + $scope.questions.length;
      };

    }]);
})();
