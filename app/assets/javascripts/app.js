angular.module('encuestaNuevaConstitucion', [
  //External modules
  'ngResource'
]).config(['$httpProvider', function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);

$(document).ready(function(){
  $('.main-nav-button').click(function(e){
    $('#main-header .main-nav').slideToggle();
    console.log('click!');
  });
});
