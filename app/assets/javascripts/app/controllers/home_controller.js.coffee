window.HomeCtrl = ($scope, $http, $routeParams) ->
  $scope.fpo = new Product "Fine Powdered Oats (1kg)", new Qty("1kg"), 
    [ new ProductSource("BulkNutrients", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("9 AUD")) ], 
    new Qty("100g"), [ 
      new IngredientElement("Energy", new Qty("1608 kJ")), 
      new IngredientElement("Protein", new Qty("12.1g")), 
      new IngredientElement("Carbohydrates", new Qty("58.1g")),
      new IngredientElement("Carbohydrates (sugars)", new Qty("1.2g")),
      new IngredientElement("Fats", new Qty("8.5g")),
      new IngredientElement("Fats (saturated)", new Qty("1.6g")),
      new IngredientElement("Fibre", new Qty("10.2g")),
      new IngredientElement("Sodium", new Qty("2.6mg")),    
    ]

  $scope.wpi_aap = new Ingredient "Amino Acid Profile", new Qty("30g"), [
      new IngredientElement("Isoleucine", new Qty("1524 mg")), 
      new IngredientElement("Leucine", new Qty("3459 mg")), 
      new IngredientElement("Lysine", new Qty("2709 mg")), 
      new IngredientElement("Methionine", new Qty("580 mg")), 
      new IngredientElement("Phenylalanine", new Qty("919 mg")), 
      new IngredientElement("Threonine", new Qty("1282 mg")), 
      new IngredientElement("Tryptophan", new Qty("580 mg")), 
      new IngredientElement("Valine", new Qty("1354 mg")), 
      new IngredientElement("Histidine", new Qty("484 mg")), 
      new IngredientElement("Alanine", new Qty("1379 mg")), 
      new IngredientElement("Arginine", new Qty("726 mg")), 
      new IngredientElement("Aspartic acid", new Qty("3023 mg")),
      new IngredientElement("Cysteine", new Qty("967 mg")), 
      new IngredientElement("Glutamic acid", new Qty("4257 mg")),
      new IngredientElement("Glycine", new Qty("435 mg")), 
      new IngredientElement("Proline", new Qty("1088 mg")), 
      new IngredientElement("Serine", new Qty("1088 mg")), 
      new IngredientElement("Tyrosine", new Qty("1016 mg")), 
      ]

  $scope.wpi = new Product "Whey Protein Isolate - Natural (1kg)", new Qty("1kg"), 
    [ new ProductSource("BulkNutrients.com.au", "http://www.bulknutrients.com.au/buy/wpi-natural-1kg-10kg/WPI", new Qty("35 AUD")) ], 
    new Qty("100g"), [
      new IngredientElement("Energy", new Qty("1606 kJ")), 
      new IngredientElement("Protein", new Qty("91.4g")), 
      new IngredientElement("Carbohydrates", new Qty("0.9g")),
      new IngredientElement("Carbohydrates (sugars)", new Qty("0.9g")),
      new IngredientElement("Fats", new Qty("1.0g")),
      new IngredientElement("Fats (saturated)", new Qty("0.7g")),
      new IngredientElement("Sodium", new Qty("185.0mg")),
      $scope.wpi_aap.in_quantity(new Qty("100g"))
    ]

  this
