angular.module('encuestaNuevaConstitucion', [
  //External modules
  'ngResource'
]).config(function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
});
