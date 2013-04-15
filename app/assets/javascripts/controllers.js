'use strict';

angular.module('parkFind.controllers', [

])

  .controller('ApplicationCtrl', [
    '$scope',
    '$location',

    function ($scope, $location) {
      $scope.search = [];
      $scope.q = '';

      $scope.parks = [];

      $scope.zoom = 13;
      $scope.center = {
        lat: 33.7489,
        lng: -84.3881
      };

      $scope.amenities = {
        'pavilions': {
          'translation': 'Pavilions',
          'active': false
        },
        'playgrounds': {
          'translation': 'Playgrounds',
          'active': false
        },
        'picnic_tables': {
          'translation': 'Picnic Tables',
          'active': false
        },
        'picnic_shelters': {
          'translation': 'Picnic Shelters',
          'active': false
        },
        'gazebos': {
          'translation': 'Gazebo',
          'active': false
        },
        'restrooms': {
          'translation': 'Restrooms',
          'active': false
        },
        'parking_spaces': {
          'translation': 'Parking Spaces',
          'active': false
        },
        'grill': {
          'translation': 'Grills',
          'active': false
        },
        'ball_fields': {
          'translation': 'Baseball',
          'active': false
        },
        'soccer_fields': {
          'translation': 'Soccer',
          'active': false
        },
        'tennis_courts': {
          'translation': 'Tennis',
          'active': false
        },
        'basketball_courts': {
          'translation': 'Basketball',
          'active': false
        },
        'volleyball_courts': {
          'translation': 'Volleyball',
          'active': false
        },
        'pool': {
          'translation': 'Pool',
          'active': false
        },
        'gym': {
          'translation': 'Gym/Rec Center',
          'active': false
        },
        'dog_park': {
          'translation': 'Dog Park',
          'active': false
        },
        'track': {
          'translation': 'Track',
          'active': false
        },
        'nat': {
          'translation': 'Natatorium',
          'active': false
        },
        'golf': {
          'translation': 'Golf Course',
          'active': false
        },
        'unpaved_trails': {
          'translation': 'Unpaved Trails',
          'active': false
        },
        'paved_trails': {
          'translation': 'Paved Trails',
          'active': false
        }
      };

      $scope.amenityToggled = function (name) {
        $location.path('/parks');

        if ($scope.amenities[name]['active']) {
          $location.search(name, 'true');
        } else {
          $location.search(name, null);
        }

        $scope.search = $location.search();
      }

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
    'Parks',

    function ($scope, $rootScope, $location, Parks) {
      if (!angular.equals($scope.search, $location.search())) {
        $scope.search = $location.search();
        angular.forEach($scope.search, function (value, amenity) {
          if ($scope.amenities[amenity] !== undefined && value === 'true') {
            $scope.amenities[amenity].active = true;
          }
        })
      }
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