window.HomeCtrl = ($scope, $http, $routeParams) ->
  fpo = new Ingredient "Fine Powdered Oats (1kg)", new Qty("1kg"), new Qty("100g"), [ 
    new IngredientElement("Energy", new Qty("1608 kJ")), 
    new IngredientElement("Protein", new Qty("12.1g")), 
    new IngredientElement("Carbohydrates", new Qty("58.1g")),
    new IngredientElement("Carbohydrates (sugars)", new Qty("1.2g")),
    new IngredientElement("Fats", new Qty("8.5g")),
    new IngredientElement("Fats (saturated)", new Qty("1.6g")),
    new IngredientElement("Fibre", new Qty("10.2g")),
    new IngredientElement("Sodium", new Qty("2.6mg")),    
    ]

  $scope.fpo = fpo

  this
