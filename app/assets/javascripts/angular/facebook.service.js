'use strict';

angular.module('encuestaNuevaConstitucion').factory('Facebook',['$window', function($window) {

  var Facebook = {};

  Facebook.feed = function(url, message){
    FB.ui({
      method: 'share',
      link: url,
      caption: message,
    }, function(response){});
  };

  $window.fbAsyncInit = function() {
    FB.init({
      appId: '1657412431181784',
      status: true,
      cookie: true,
      xfbml: true,
      version: 'v2.4'
    });
  };


  (function(d){
  // load the Facebook javascript SDK

    var js,
    id = 'facebook-jssdk',
    ref = d.getElementsByTagName('script')[0];

    if (d.getElementById(id)) {
      return;
    }

    js = d.createElement('script');
    js.id = id;
    js.async = true;
    js.src = "//connect.facebook.net/es_ES/all.js";

    ref.parentNode.insertBefore(js, ref);

  }(document));

  return Facebook;


}]);
