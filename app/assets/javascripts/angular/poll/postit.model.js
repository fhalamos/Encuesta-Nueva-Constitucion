'use strict';

angular.module('encuestaNuevaConstitucion')
  .factory('Postit', function($resource) {
  return $resource("/api/postits/:id", { id: "@id" },
    {
      'create':  { method: 'POST' },
      'index':   { method: 'GET', isArray: true },
      'show':    { method: 'GET', isArray: false },
      'update':  { method: 'PUT' },
      'destroy': { method: 'DELETE' }
    }
  );
});
