'use strict';

var App = angular.module('parkFind', [
  'google-maps',
  'ngResource'
]);

App.config([
  '$routeProvider',
  '$locationProvider'
  function ($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: "/assets/templates/park.list.html",
      })
      .when('/:parkId', {
        templateUrl: '/assets/templates/park.details.html',
      })
      .otherwise({
        redirectTo: '/'
      });

    $locationProvider.html5Mode(true);
  }
]);