'use strict';

var App = angular.module('parkFind', [
  'google-maps',
  'ngResource',
  'parkFind.services',
  'parkFind.controllers'
]);

App.config([
  '$routeProvider',
  '$locationProvider',

  function ($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '/assets/templates/home.html',
      })
      .when('/parks/:parkId', {
        templateUrl: '/assets/templates/park.details.html',
        controller: 'ParkDetailsCtrl'
      })
      .when('/parks', {
        templateUrl: '/assets/templates/park.list.html',
        controller: 'ParkListCtrl',
        reloadOnSearch: false
      })
      .otherwise({
        redirectTo: '/'
      });

    $locationProvider.html5Mode(true);
  }
]);