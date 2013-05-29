'use strict';

angular.module('parkFind.controllers', [

])

  .controller('ApplicationCtrl', [
    '$scope',
    '$rootScope',
    '$location',
    'Parks',

    function ($scope, $rootScope, $location, Parks) {
      $scope.state = {};
      $scope.state.search = [];
      $scope.state.q = '';

      $scope.state.parks = [];

      $scope.state.zoom = 13;
      $scope.state.center = {
        lat: 33.7489,
        lng: -84.3881
      };

      $scope.state.amenities = {
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

      if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          function (position) {
            $scope.state.center = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            }

            $scope.$apply();
          }
        )
      }

      $scope.doSearch = function() {
        $scope.state.search['q'] = $scope.state.q;
        $location.search('q', $scope.state.q);

        $location.path('/parks');
        $scope.$broadcast('search:changed');
      };

      $scope.amenityToggled = function (name) {
        $location.path('/parks');

        if ($scope.state.amenities[name].active) {
          $location.search(name, 'true');
        } else {
          $location.search(name, null);
        }

        $scope.state.search = $location.search();
        $scope.$broadcast('search:changed');
      }

      $scope.$on('search:changed', function() {
        $scope.state.parks = Parks.query($scope.state.search);
      })
    }
  ])

  .controller('ParkListCtrl', [
    '$scope',
    '$rootScope',
    '$location',
    'Parks',

    function ($scope, $rootScope, $location, Parks) {
      if (!angular.equals($scope.state.search, $location.search())) {
        $scope.state.search = $location.search();
        $scope.state.q = $location.search()['q'];
        $rootScope.$broadcast('search:changed');

        angular.forEach($scope.state.search, function (value, amenity) {
          if ($scope.state.amenities[amenity] !== undefined && value === 'true') {
            $scope.state.amenities[amenity].active = true;
          }
        });
      } else if ($scope.state.parks.length == 0) {
        $rootScope.$broadcast('search:changed');
      }
    }
  ])

  .controller('ParkDetailsCtrl', [
    '$scope',
    '$rootScope',
    '$routeParams',
    '$location',
    'Park',

    function ($scope, $rootScope, $routeParams, $location, Park) {
      var parksEmpty = ($scope.state.parks.length == 0);
      
      $scope.state.park = Park.get({
        parkId: $routeParams.parkId
      }, function (data) {
        $scope.state.center = {
          lat: data.latitude,
          lng: data.longitude
        }
      });

      if ($scope.state.parks.length == 0) {
        $scope.state.parks = [$scope.state.park];
      }
    }
  ]);