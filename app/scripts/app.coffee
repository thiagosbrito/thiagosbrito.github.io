'use strict'

angular.module('portv2App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'scrollPosition'
])
.config [
  '$provide', '$urlRouterProvider', '$stateProvider','$httpProvider'
  ($provide, $urlRouterProvider, $stateProvider, $httpProvider) ->
    
    $urlRouterProvider.otherwise("/home");

    $stateProvider
      .state('portfolio'
        url: '/home'
        templateUrl : 'views/main.html'
        controller  : 'MainCtrl'
      )
]
