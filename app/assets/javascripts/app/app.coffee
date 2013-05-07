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
  directive('autoComplete', ($timeout) ->
    return (scope, $element, $attrs)->
      $element.autocomplete({
          source: scope[$attrs.uiItems],
          select: ()-> 
            $timeout( (() -> $element.trigger('input')), 0)
      })
  ).
  factory('$products_repository', ['$http', ($http)->
    new ProductsRepositoryService($http)
  ]).
  config [ '$routeProvider', '$httpProvider', ($routeProvider, $httpProvider) ->
      $routeProvider.
        when('/',                             { templateUrl: 'assets/app/views/home/index.html',         controller: HomeCtrl }).
        otherwise( {redirectTo: '/'} )
    ]
