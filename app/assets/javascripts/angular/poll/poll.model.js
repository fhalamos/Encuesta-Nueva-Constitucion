'use strict';

angular.module('encuestaNuevaConstitucion')
  .factory('Poll', ['$resource', function($resource) {
  return $resource("/api/poll/:controller", { },
    {
      'answer':  {
        method: 'POST',
        params: {
          controller: 'answer'
        }

      },
      'answers': {
        method: 'GET',
        isArray: true,
        params: {
          controller: 'answers'
        }
      },
      'results': {
        method: 'GET',
        isArray: true,
        params: {
          controller: 'results'
        }
      }
    }
  );
}]);
