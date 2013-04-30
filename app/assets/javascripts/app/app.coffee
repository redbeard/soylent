angular.module('Soylent', [ ]).
  config [ '$routeProvider', '$httpProvider', ($routeProvider, $httpProvider) ->
      $routeProvider.
        when('/home',                             { templateUrl: 'assets/app/views/home/index.html',         controller: HomeCtrl }).
        otherwise( {redirectTo: '/home'} )
    ]
