window.HomeCtrl = ($scope, $http, $timeout, $products_repository) ->
  $scope.products_repository = $products_repository

  $scope.recommendation = new Recommendation [
    new IngredientElement("Energy", new Qty("1817 kcal")), 
    new IngredientElement("Carbohydrates", new Qty("90.2 g")), 
    new IngredientElement("Protein", new Qty("274 g")), 
    new IngredientElement("Fats", new Qty("40.1 g")), 
    new IngredientElement("Sodium", new Qty("2.4 g")), 
    new IngredientElement("Potassium", new Qty("4.5 g")), 
    new IngredientElement("Chloride", new Qty("3.4 g")), 
    new IngredientElement("Fibre", new Qty("40 g")), 
    new IngredientElement("Calcium", new Qty("1 g")), 
    new IngredientElement("Iron", new Qty("9 mg")), 
    new IngredientElement("Phosphorous ", new Qty("1g")), 
    new IngredientElement("Iodine", new Qty("150 microgram")), 
    new IngredientElement("Magnesium", new Qty("400mg")), 
    new IngredientElement("Zinc", new Qty("15mg")), 
    new IngredientElement("Selenium", new Qty("7 microgram")), 
    new IngredientElement("Copper", new Qty("2 mg")), 
    new IngredientElement("Manganese", new Qty("2 mg")), 
    new IngredientElement("Chromium", new Qty("12 microgram")), 
    new IngredientElement("Molybdenum", new Qty("75 microgram")), 
    new IngredientElement("Vitamin A", new Qty("5000 IU")), 
    new IngredientElement("Vitamin B6", new Qty("2 mg")), 
    new IngredientElement("Vitamin B12", new Qty("6 microgram")), 
    new IngredientElement("Vitamin C", new Qty("0.06g")), 
    new IngredientElement("Vitamin D", new Qty("400 IU")), 
    new IngredientElement("Vitamin E", new Qty("30 IU")), 
    new IngredientElement("Vitamin K", new Qty("8 microgram")), 
    new IngredientElement("Thiamin", new Qty("1.5 mg")), 
    new IngredientElement("Riboflavin", new Qty("1.7 mg")), 
    new IngredientElement("Niacin", new Qty("20 mg")), 
    new IngredientElement("Folate", new Qty("400 microgram")), 
    new IngredientElement("Biotin", new Qty("300 microgram")), 
    new IngredientElement("Pantothenic acid", new Qty("10 mg")), 
    new IngredientElement("Choline", new Qty("550mg")), 
    new IngredientElement("Sulfur", new Qty("2g")),
    new IngredientElement("Lithium", new Qty("0g")),
    new IngredientElement("Creatine", new Qty("5g")),
    new IngredientElement("Lycopene", new Qty("500 microgram")),
    new IngredientElement("Omega-3 Fatty Acids", new Qty("750 mg")),
    new IngredientElement("Ginseng", new Qty("50 microgram")),
    new IngredientElement("Gingko Biloba", new Qty("100 microgram")),
    new IngredientElement("Lutein", new Qty("500 microgram")),
    new IngredientElement("Alpha Carotene", new Qty("140 microgram")),
    new IngredientElement("Vanadium", new Qty("100 microgram")),
  ]

  $scope.selected_product_to_add = null

  $scope.product_autocomplete = (request, response)->
    products = $products_repository.findBySubstring(request.term)
    response( products.map (p)-> { label: p.name, value: p.name } )

  $scope.product_to_add = ()->
    return null unless @selected_product_to_add
    products = $products_repository.findBySubstring(@selected_product_to_add)
    if products.length == 1
      products[0]
    else
      null

  $scope.product_ready_to_add = ()->
    @product_to_add() != null

  $scope.add_product = (product_to_add)->
    console.log product_to_add
    @recipe.serving_contents.push product_to_add.in_quantity( product_to_add.quantity )
    $scope.recipeTreeTableModel.refresh()

  $scope.refreshAfterTimeout = ()->
    if ($scope.timeoutPromise)
      $timeout.cancel($scope.timeoutPromise)
      $scope.timeoutPromise = null

    $scope.timeoutPromise = $timeout ( ()-> $scope.recipeTreeTableModel.refresh() ), 500

  $scope.recipe = new Recipe [ 
    $products_repository.findBySubstring("Bertolli")[0].in_quantity( new Qty("25ml") ),
#    $products_repository.findBySubstring("Maltodextrin (Bulk")[0].in_quantity( new Qty("200g") ),
    $products_repository.findBySubstring("Fine Powdered Oats")[0].in_quantity( new Qty("151.0g") ), 
    $products_repository.findBySubstring("Whey Protein Isolate")[0].in_quantity( new Qty("280g") ),
#    $products_repository.findBySubstring("Ascorbic Acid Powder")[0].in_quantity( new Qty("60mg") ),
    $products_repository.findBySubstring("Biotin")[0].in_quantity( new Qty("23 mg") ),
    $products_repository.findBySubstring("Calcium Carbonate")[0].in_quantity( new Qty("2.5 g") ),
    $products_repository.findBySubstring("Pantothenic acid")[0].in_quantity( new Qty("10 mg") ),
    $products_repository.findBySubstring("Potassium")[0].in_quantity( new Qty("12.5 g") ),
    $products_repository.findBySubstring("Sea Salt")[0].in_quantity( new Qty("2.3 g") ),
    $products_repository.findBySubstring("Copper Gluconate")[0].in_quantity( new Qty("200 mg") ),
    $products_repository.findBySubstring("Swisse")[0].in_quantity( new Qty("1 count") ),
  ]

  $scope.recipeTreeTableModel = new IngredientsTreeTableModel($scope.recommendation, $scope.recipe, {
    "Price": { "preferred_unit": "AUD", "column_class": "major" }, 
    "Energy": { "preferred_unit": "kilocalorie", "column_class": "macro" }, 
    "Protein": { "preferred_unit": "g", "column_class": "macro" }, 
    "Carbohydrates": { "preferred_unit": "g", "column_class": "macro" }, 
    "Fats": { "preferred_unit": "g", "column_class": "macro" }, 
    "Fibre": { "preferred_unit": "g", "column_class": "major" }, 
    "Sodium": { "preferred_unit": "mg", "column_class": "major" }, 
    "Potassium": { "preferred_unit": "g", "column_class": "major" }, 
    "Calcium": { "preferred_unit": "g", "column_class": "major" }, 
    "Chloride": { "preferred_unit": "g", "column_class": "minor" }, 
    "Iron": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Phosphorous ": { "preferred_unit": "g", "column_class": "minor" }, 
    "Iodine": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Magnesium": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Zinc": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Selenium": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Copper": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Manganese": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Chromium": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Molybdenum": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Vitamin A": { "preferred_unit": "IU", "column_class": "minor" }, 
    "Vitamin B6": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Vitamin B12": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Vitamin C": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Vitamin D": { "preferred_unit": "IU", "column_class": "minor" }, 
    "Vitamin E": { "preferred_unit": "IU", "column_class": "minor" }, 
    "Vitamin K": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Thiamin": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Riboflavin": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Niacin": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Folate": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Biotin": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Pantothenic acid": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Choline": { "preferred_unit": "g", "column_class": "minor" }, 
    "Sulfur": { "preferred_unit": "g", "column_class": "minor" }, 
    "Lithium": { "preferred_unit": "g", "column_class": "minor" }, 
    "Creatine": { "preferred_unit": "g", "column_class": "minor" }, 
    "Lycopene": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Omega-3 Fatty Acids": { "preferred_unit": "mg", "column_class": "minor" }, 
    "Ginseng": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Gingko Biloba": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Lutein": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Alpha Carotene": { "preferred_unit": "microgram", "column_class": "minor" }, 
    "Vanadium": { "preferred_unit": "microgram", "column_class": "minor" },     
    "Carbohydrates (sugars)": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Fats (saturated)": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Isoleucine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Leucine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Lysine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Methionine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Phenylalanine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Threonine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Tryptophan": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Valine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Histidine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Alanine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Arginine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Aspartic acid": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Cysteine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Glutamic acid": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Glycine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Proline": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Serine": { "preferred_unit": "g", "column_class": "breakdown" }, 
    "Tyrosine": { "preferred_unit": "g", "column_class": "breakdown" }, 
  } )

  this
