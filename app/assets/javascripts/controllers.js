'use strict';

angular.module('parkFind.controllers', [

])

  .controller('ApplicationCtrl', [
    '$scope',
    '$location',

    function ($scope, $location) {
      $scope.parks = [];

      $scope.zoom = 13;
      $scope.center = {
        lat: 33.7489,
        lng: -84.3881
      };

      $scope.amenities = [
        {
          'name': 'pavilions',
          'active': false,
          'translation': 'Pavilions'
        },
        {
          'name': 'playgrounds',
          'active': false,
          'translation': 'Playgrounds'
        },
        {
          'name': 'picnic_tables',
          'active': false,
          'translation': 'Picnic Tables'
        },
        {
          'name': 'picnic_shelters',
          'active': false,
          'translation': 'Picnic Shelters'
        },
        {
          'name': 'gazebos',
          'active': false,
          'translation': 'Gazebo'
        },
        {
          'name': 'restrooms',
          'active': false,
          'translation': 'Restrooms'
        },
        {
          'name': 'parking_spaces',
          'active': false,
          'translation': 'Parking Spaces'
        },
        {
          'name': 'grill',
          'active': false,
          'translation': 'Grills'
        },
        {
          'name': 'ball_fields',
          'active': false,
          'translation': 'Baseball'
        },
        {
          'name': 'soccer_fields',
          'active': false,
          'translation': 'Soccer'
        },
        {
          'name': 'tennis_courts',
          'active': false,
          'translation': 'Tennis'
        },
        {
          'name': 'basketball_courts',
          'active': false,
          'translation': 'Basketball'
        },
        {
          'name': 'volleyball_courts',
          'active': false,
          'translation': 'Volleyball'
        },
        {
          'name': 'pool',
          'active': false,
          'translation': 'Pool'
        },
        {
          'name': 'gym',
          'active': false,
          'translation': 'Gym/Rec Center'
        },
        {
          'name': 'dog_park',
          'active': false,
          'translation': 'Dog Park'
        },
        {
          'name': 'track',
          'active': false,
          'translation': 'Track'
        },
        {
          'name': 'nat',
          'active': false,
          'translation': 'Natatorium'
        },
        {
          'name': 'golf',
          'active': false,
          'translation': 'Golf Course'
        },
        {
          'name': 'unpaved_trails',
          'active': false,
          'translation': 'Unpaved Trails'
        },
        {
          'name': 'paved_trails',
          'active': false,
          'translation': 'Paved Trails' 
        }
      ]

      if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          function (position) {
            $scope.center.lat = position.coords.latitude;
            $scope.center.lng = position.coords.latitude;
          }
        )
      }
    }
  ])

  .controller('ParkListCtrl', [
    '$scope',
    '$rootScope',
    '$location',

    function ($scope, $rootScope, $location) {

    }
  ])

  .controller('ParkDetailsCtrl', [
    '$scope',
    '$rootScope',
    '$location',
    'Park',

    function ($scope, $rootScope, $location, Park) {

    }
  ]);