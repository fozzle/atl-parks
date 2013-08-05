'use strict';

angular.module('parkFind.filters', [

])
      
  .filter('truncateDecimal', function () {
    return function (number) {
      var digits = 2,
          n = number - Math.pow(10, -digits)/2;
      
      n += n / Math.pow(2, 53);
      return n.toFixed(digits)
    }
  });