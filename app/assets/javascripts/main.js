'use strict';

var App = angular.module('parkFind', [
  'google-maps',
  'ngResource'
]);

App.config([
  '$routeProvider',
  '$locationProvider',
  function ($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: "/assets/templates/home.html",
      })
      .when('/:parkId', {
        templateUrl: '/assets/templates/park.html',
      })
      .when('/parks', {
        templateUrl: '/assets/templates/parks.html',
      })
      .otherwise({
        redirectTo: '/'
      });

    $locationProvider.html5Mode(true);
  }
]);