angular.module('Soylent', [ ]).
  directive('quantity', ()->
    return {
      restrict: 'A',
      require: 'ngModel',
      link: (scope, element, attr, ctrl)->      
        ctrl.$formatters.unshift( ( modelValue )->
          modelValue.toString()
        )
        ctrl.$parsers.unshift( ( viewValue )->
          new Qty( viewValue )
        )
      
    };
  ).
  config [ '$routeProvider', '$httpProvider', ($routeProvider, $httpProvider) ->
      $routeProvider.
        when('/home',                             { templateUrl: 'assets/app/views/home/index.html',         controller: HomeCtrl }).
        otherwise( {redirectTo: '/home'} )
    ]
