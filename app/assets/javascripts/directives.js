'use strict';

angular.module('parkFind.directives', [

])
      
  .directive('onFocus', function() {
      return {
          restrict: 'A',
          link: function(scope, elm, attrs) {
              elm.bind('focus', function() {
                  scope.$apply(attrs.onFocus);
              });
          }
      };        
  })

  .directive('onBlur', function() {
      return {
          restrict: 'A',
          link: function(scope, elm, attrs) {
              elm.bind('blur', function() {
                  scope.$apply(attrs.onBlur);
              });
          }
      };        
  });