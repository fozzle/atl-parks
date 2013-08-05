'use strict';

angular.module('parkFind.services', [

])

  .config([
    '$httpProvider',

    function ($httpProvider) {
      $httpProvider.responseInterceptors.push('httpInterceptor');
      var spinnerFunction = function (data, headersGetter) {
        return data;
      };
      
      $httpProvider.defaults.transformRequest.push(spinnerFunction);
    }
  ])
      
  //register the interceptor as a service, intercepts ALL angular ajax http calls
  .factory('httpInterceptor', [
    '$q',
    '$window',
    '$rootScope',

    function ($q, $window, $rootScope) {
      $rootScope.network = {
        polling: false,
        error: false
      }

      return function (promise) {
        $rootScope.network.polling = true;
        
        return promise.then(function (response) {
          $rootScope.network.polling = false;
          return response;
        }, function (response) {
          $rootScope.network.polling = false;
          $rootScope.network.error = true;
          return $q.reject(response);
        });
      };
    }
  ])

  .factory('Parks', [
    '$resource',
    function ($resource) {
      return $resource('/parks.json');
    }
  ])

  .factory('Park', [
    '$resource',
    function ($resource) {
      return $resource('/parks/:parkId.json');
    }
  ]);