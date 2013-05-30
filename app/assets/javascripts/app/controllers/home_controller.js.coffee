window.HomeCtrl = [ '$scope', '$http', '$timeout', '$products_repository', '$elements_repository', ($scope, $http, $timeout, $products_repository, $elements) ->

  $scope.days_for_shopping_list = 90

  $scope.products_repository = $products_repository
  $scope.elements = $elements

  $scope.recommendation = new Recommendation [
    $elements.Energy.in_quantity("1817 kcal"), 
    $elements.Carbohydrates.in_quantity("90.2 g"), 
    $elements.Protein.in_quantity("274 g"), 
    $elements.Fats.in_quantity("40.1 g"), 
    $elements.Sodium.in_quantity("2.4 g"), 
    $elements.Potassium.in_quantity("4.5 g"), 
    $elements.Chlorine.in_quantity("3.4 g"), 
    $elements.Fibre.in_quantity("40 g"), 
    $elements.Calcium.in_quantity("1 g"), 
    $elements.Iron.in_quantity("9 mg"), 
    $elements.Phosphorus.in_quantity("1g"), 
    $elements.Iodine.in_quantity("150 microgram"), 
    $elements.Magnesium.in_quantity("400mg"), 
    $elements.Zinc.in_quantity("15mg"), 
    $elements.Selenium.in_quantity("7 microgram"), 
    $elements.Copper.in_quantity("2 mg"), 
    $elements.Manganese.in_quantity("2 mg"), 
    $elements.Chromium.in_quantity("12 microgram"), 
    $elements.Molybdenum.in_quantity("75 microgram"), 
    $elements["Vitamin A"].in_quantity("5000 IU"), 
    $elements["Vitamin B6"].in_quantity("2 mg"), 
    $elements["Vitamin B12"].in_quantity("6 microgram"), 
    $elements["Vitamin C"].in_quantity("0.06g"), 
    $elements["Vitamin D"].in_quantity("400 IU"), 
    $elements["Vitamin E"].in_quantity("30 IU"), 
    $elements["Vitamin K"].in_quantity("8 microgram"), 
    $elements.Thiamin.in_quantity("1.5 mg"), 
    $elements.Riboflavin.in_quantity("1.7 mg"), 
    $elements.Niacin.in_quantity("20 mg"), 
    $elements.Folate.in_quantity("400 microgram"), 
    $elements.Biotin.in_quantity("300 microgram"), 
    $elements["Pantothenic acid"].in_quantity("10 mg"), 
    $elements.Choline.in_quantity("550mg"), 
    $elements.Sulfur.in_quantity("2g"),
    $elements.Lithium.in_quantity("1000 microgram"), # Based on http://www.jacn.org/content/21/1/14.full
    $elements.Creatine.in_quantity("5g"),
    $elements.Lycopene.in_quantity("500 microgram"),
    $elements["Omega-3 Fatty Acids"].in_quantity("750 mg"),
    $elements.Ginseng.in_quantity("50 microgram"),
    $elements["Gingko Biloba"].in_quantity("100 microgram"),
    $elements.Lutein.in_quantity("500 microgram"),
    $elements["Alpha Carotene"].in_quantity("140 microgram"),
    $elements.Vanadium.in_quantity("100 microgram"),
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
    $scope.recipeTreeTableModel.add_product(product_to_add)

  $scope.refreshAfterTimeout = ()->
    if ($scope.timeoutPromise)
      $timeout.cancel($scope.timeoutPromise)
      $scope.timeoutPromise = null

    $scope.timeoutPromise = $timeout ( ()-> $scope.recipeTreeTableModel.refresh() ), 500

  $scope.recipe = new Recipe [ 
#    $products_repository.findBySubstring("Butter")[0].in_quantity( new Qty("33g") ),
    $products_repository.findBySubstring("Bertolli")[0].in_quantity( new Qty("29ml") ),
#    $products_repository.findBySubstring("Maltodextrin (Bulk")[0].in_quantity( new Qty("200g") ),
#    $products_repository.findBySubstring("Oat Bran")[0].in_quantity( new Qty("45.0g") ), 
    $products_repository.findBySubstring("Fine Powdered Oats")[0].in_quantity( new Qty("90.0g") ), 
    $products_repository.findBySubstring("Whey Protein Isolate")[0].in_quantity( new Qty("285g") ),
    $products_repository.findBySubstring("Leucine")[0].in_quantity( new Qty("5g") ),
    $products_repository.findBySubstring("Fibre Cleanse")[0].in_quantity( new Qty("39 g") ),
#    $products_repository.findBySubstring("Ascorbic Acid Powder")[0].in_quantity( new Qty("60mg") ),
#    $products_repository.findBySubstring("Biotin")[0].in_quantity( new Qty("23 mg") ),
#    $products_repository.findBySubstring("Calcium Carbonate")[0].in_quantity( new Qty("2.5 g") ),
#    $products_repository.findBySubstring("Pantothenic acid")[0].in_quantity( new Qty("10 mg") ),
#    $products_repository.findBySubstring("Potassium Gluconate Powder")[0].in_quantity( new Qty("29 g") ),
    $products_repository.findBySubstring("Potassium Chloride")[0].in_quantity( new Qty("7 g") ),
    $products_repository.findBySubstring("Salt Iodized (Generic)")[0].in_quantity( new Qty("0.5 g") ),
#    $products_repository.findBySubstring("Copper Gluconate")[0].in_quantity( new Qty("200 mg") ),
#    $products_repository.findBySubstring("Swisse")[0].in_quantity( new Qty("1 count") ),
#    $products_repository.findBySubstring("Max Potency")[0].in_quantity( new Qty("3 count") ),
#    $products_repository.findBySubstring("Multi-Vitamin")[0].in_quantity( new Qty("1 count") ),
    $products_repository.findBySubstring("Opti Men")[0].in_quantity( new Qty("3 count") ),
    $products_repository.findBySubstring("Iron")[0].in_quantity( new Qty("1 count") ),
    $products_repository.findBySubstring("Calcium/magnesium")[0].in_quantity( new Qty("0.75 count") ),
    $products_repository.findBySubstring("Inositol")[0].in_quantity( new Qty("2 count") ),
    $products_repository.findBySubstring("Creatine")[0].in_quantity( new Qty("5g") ),
    $products_repository.findBySubstring("MSM")[0].in_quantity( new Qty("6g") ),
    $products_repository.findBySubstring("Healthy Essentials High Strength")[0].in_quantity( new Qty("1.5ml") ),
    $products_repository.findBySubstring("Monosodium Phosphate")[0].in_quantity( new Qty("4g") ),
    $products_repository.findBySubstring("Lithium Orotate")[0].in_quantity( new Qty("0.5 count") ),
  ]

  # Limit sources:
  # http://www.medicalonline.com.au/medical/nutrition/rdi.htm
  $scope.recipeTreeTableModel = new IngredientsTreeTableModel($scope.elements, $scope.recommendation, $scope.recipe)

  this
]