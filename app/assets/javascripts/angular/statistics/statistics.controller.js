(function() {
  'use strict';

  angular.module('encuestaNuevaConstitucion')
    .controller('StatisticsController', ['$scope', 'Question', 'Poll', function($scope, Question, Poll) {

      $scope.questions = [];
      $scope.statistics = {};
      $scope.totalAnswer = 0;

      Question.index(function(response) {
        $scope.questions = response;
        Poll.statistics(function(data) {
          console.log(data);
          $scope.statistics = data;
        });
      });

      $scope.getWidth = function(question, answer) {
        var values = question.answers.map(function(obj) {
          return $scope.statistics[obj.id] || 0;
        });
        var total = values.reduce(add, 0);
        return ($scope.statistics[answer.id] || 0) * 100 / total;
      };

      function add(a, b) {
        return a + b;
      }



    }]);
}());
