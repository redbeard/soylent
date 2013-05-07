window.HomeCtrl = ($scope, $http, $products_repository) ->
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

  $scope.product_autocomplete = (request, response)->
    products = $products_repository.findBySubstring(request.term)
    response( products.map (p)-> { label: p.name, value: p.name } )

  $scope.recipe = new Recipe [ 
    $products_repository.findBySubstring("Fine Powdered Oats")[0].in_quantity( new Qty("100g")), 
    $products_repository.findBySubstring("Whey Protein Isolate")[0].in_quantity( new Qty("100g")) ]

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
