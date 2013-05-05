window.HomeCtrl = ($scope, $http, $routeParams) ->
  $scope.recommendation = new Recommendation [
    new IngredientElement("Carbohydrates", new Qty("409 g")), 
    new IngredientElement("Protein", new Qty("102 g")), 
    new IngredientElement("Fats", new Qty("65 g")), 
    new IngredientElement("Sodium", new Qty("2.4 g")), 
    new IngredientElement("Potassium", new Qty("3.5 g")), 
    new IngredientElement("Chloride", new Qty("3.4 g")), 
    new IngredientElement("Fiber", new Qty("40 g")), 
    new IngredientElement("Calcium", new Qty("1 g")), 
    new IngredientElement("Iron", new Qty("0.009 g")), 
    new IngredientElement("Phosphorous ", new Qty("1g")), 
    new IngredientElement("Iodine", new Qty("0.00015g")), 
    new IngredientElement("Magnesium", new Qty("400mg")), 
    new IngredientElement("Zinc", new Qty("15mg")), 
    new IngredientElement("Selenium", new Qty("0.00007g")), 
    new IngredientElement("Copper", new Qty("0.002g")), 
    new IngredientElement("Manganese", new Qty("0.002g")), 
    new IngredientElement("Chromium", new Qty("0.00012g")), 
    new IngredientElement("Molybdenum", new Qty("0.000075g")), 
    new IngredientElement("Vitamin A", new Qty("5000 IU")), 
    new IngredientElement("Vitamin B6", new Qty("0.002g")), 
    new IngredientElement("Vitamin B12", new Qty("0.000006g")), 
    new IngredientElement("Vitamin C", new Qty("0.06g")), 
    new IngredientElement("Vitamin D", new Qty("400 IU")), 
    new IngredientElement("Vitamin E", new Qty("30 IU")), 
    new IngredientElement("Vitamin K", new Qty("0.00008g")), 
    new IngredientElement("Thiamin", new Qty("0.0015g")), 
    new IngredientElement("Riboflavin", new Qty("0.0017g")), 
    new IngredientElement("Niacin", new Qty("0.02g")), 
    new IngredientElement("Folate", new Qty("0.0004g")), 
    new IngredientElement("Biotin", new Qty("0.0003g")), 
    new IngredientElement("Panthothenic acid", new Qty("0.01g")), 
    new IngredientElement("Choline", new Qty("0g")), 
    new IngredientElement("Sulfur", new Qty("2g")),
  ]

  $scope.fpo = new Product "Fine Powdered Oats (1kg)", new Qty("1kg"), 
    [ new ProductSource("BulkNutrients.com.au", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("9 AUD")) ], 
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

  $scope.recipe = new Recipe [ $scope.fpo.in_quantity(new Qty("200g")), $scope.wpi.in_quantity(new Qty("200g")) ]
  
  $scope.recipeTreeTableModel = new IngredientsTreeTableModel($scope.recommendation, $scope.recipe, {
    "Price": {
      "preferred_unit": "AUD",
      "column_class": "major"
    },
    "Energy": {
      "preferred_unit": "kilocalorie",
      "column_class": "major"
    },
    "Protein": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Carbohydrates": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Fats": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Fibre": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Sodium": {
      "preferred_unit": "mg",
      "column_class": "major"
    },
    "Potassium": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Fiber": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Calcium": {
      "preferred_unit": "g",
      "column_class": "major"
    },
    "Chloride": {
      "preferred_unit": "g",
      "column_class": "minor"
    },
    "Iron": {
      "preferred_unit": "g",
      "column_class": "minor"
    },
    "Phosphorous ": {
      "preferred_unit": "g",
      "column_class": "minor"
    },
    "Iodine": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Magnesium": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Zinc": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Selenium": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Copper": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Manganese": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Chromium": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Molybdenum": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Vitamin A": {
      "preferred_unit": "IU",
      "column_class": "minor"
    },
    "Vitamin B6": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Vitamin B12": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Vitamin C": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Vitamin D": {
      "preferred_unit": "IU",
      "column_class": "minor"
    },
    "Vitamin E": {
      "preferred_unit": "IU",
      "column_class": "minor"
    },
    "Vitamin K": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Thiamin": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Riboflavin": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Niacin": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Folate": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Biotin": {
      "preferred_unit": "microgram",
      "column_class": "minor"
    },
    "Panthothenic acid": {
      "preferred_unit": "mg",
      "column_class": "minor"
    },
    "Choline": {
      "preferred_unit": "g",
      "column_class": "minor"
    },
    "Sulfur": {
      "preferred_unit": "g",
      "column_class": "minor"
    },
    "Carbohydrates (sugars)": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Fats (saturated)": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Isoleucine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Leucine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Lysine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Methionine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Phenylalanine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Threonine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Tryptophan": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Valine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Histidine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Alanine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Arginine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Aspartic acid": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Cysteine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Glutamic acid": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Glycine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Proline": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Serine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
    "Tyrosine": {
      "preferred_unit": "g",
      "column_class": "breakdown"
    },
  } )

  this
