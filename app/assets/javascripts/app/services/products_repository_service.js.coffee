class window.ProductsRepositoryService
  constructor: ($http)->
    @http = $http
    @products = []
    @loadDefaults()

  findBySubstring: (substring)->
    @products.filter (i) -> (i.name.toLowerCase().indexOf(substring.toLowerCase()) >= 0)
    #@products

  loadDefaults: ()->
    @products.push new Product "Fine Powdered Oats", 
      [ new ProductSource("BulkNutrients.com.au (1kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("1kg"), new Qty("9 AUD/kg")) ], 
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

    @products.push new Product "Whey Protein Isolate - Natural", 
      [ new ProductSource("BulkNutrients.com.au (1kg package)", "http://www.bulknutrients.com.au/buy/wpi-natural-1kg-10kg/WPI", new Qty("1kg"), new Qty("35 AUD/kg")) ], 
      new Qty("100g"), [
        new IngredientElement("Energy", new Qty("1606 kJ")), 
        new IngredientElement("Protein", new Qty("91.4g")), 
        new IngredientElement("Carbohydrates", new Qty("0.9g")),
        new IngredientElement("Carbohydrates (sugars)", new Qty("0.9g")),
        new IngredientElement("Fats", new Qty("1.0g")),
        new IngredientElement("Fats (saturated)", new Qty("0.7g")),
        new IngredientElement("Sodium", new Qty("185.0mg")),
        new Ingredient "Amino Acid Profile", new Qty("30g"), [
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
      ]

    @products.push new Product "Ascorbic Acid Powder", 
      [ 
        new ProductSource("PureBulk.com (100g package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("100g"), new Qty("55 USD/kg")),
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("250g"), new Qty("47 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("500g"), new Qty("42.5 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("1kg"), new Qty("38.25 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("1.5kg"), new Qty("36.33 USD/kg")),
      ], 
      new Qty("1g"), [ new IngredientElement("Vitamin C", new Qty("1000mg")) ]

    @products.push new Product "Calcium Carbonate (Oyster Shell)", 
      [ 
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/calcium-carbonate-powder-oyster-shell.html", new Qty("500g"), new Qty("22 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/calcium-carbonate-powder-oyster-shell.html", new Qty("1kg"), new Qty("20 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/calcium-carbonate-powder-oyster-shell.html", new Qty("1.5kg"), new Qty("19 USD/kg")),
      ], 
      new Qty("1250mg"), [ new IngredientElement("Calcium", new Qty("500mg")) ]

    @products.push new Product "Pantothenic Acid / Vitamin B5 / Calcium Pantothenate", 
      [ 
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("250g"), new Qty("54 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("500g"), new Qty("49 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("1kg"), new Qty("44.25 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("1.5kg"), new Qty("42 USD/kg")),
      ], 
      new Qty("550mg"), [ 
        new IngredientElement("Pantothenic acid", new Qty("506mg")),
        new IngredientElement("Calcium", new Qty("44mg")),
      ]

    @products.push new Product "Maltodextrin (Honeyville)", 
      [ 
        new ProductSource("Honeyville Grain (4-9 lb)", "http://store.honeyvillegrain.com/maltodextrin50lb.aspx", new Qty("4lb"), new Qty("57.94 USD/lb")),
        new ProductSource("Honeyville Grain (10-50 lb)", "http://store.honeyvillegrain.com/maltodextrin50lb.aspx", new Qty("10lb"), new Qty("55.50 USD/lb")),
      ], 
      new Qty("100g"), [ 
        new IngredientElement("Energy", new Qty("380 kilocalories")),
        new IngredientElement("Carbohydrates", new Qty("94g")),
        new IngredientElement("Carbohydrates (sugars)", new Qty("4g")),
        new IngredientElement("Sodium", new Qty("100mg")),
      ]
      
    @products.push new Product "Maltodextrin (BulkNutrients.com.au)", 
      [ 
        new ProductSource("BulkNutrients.com.au (2kg package)", "http://www.bulknutrients.com.au/buy/maltodextrin/MALDEX", new Qty("2kg"), new Qty("6 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (5kg package)", "http://www.bulknutrients.com.au/buy/maltodextrin/MALDEX", new Qty("5kg"), new Qty("4.8 AUD/kg")),
      ], 
      new Qty("100g"), [ 
        new IngredientElement("Energy", new Qty("1600 kilojoules")),
        new IngredientElement("Carbohydrates", new Qty("95g")),
        new IngredientElement("Carbohydrates (sugars)", new Qty("12.5g")),
        new IngredientElement("Sodium", new Qty("50mg")),
      ]      

    @products.push new Product "Bertolli Extra Light Olive Oil", 
      [ 
        new ProductSource("Amazon.com (51 ounce bottle)", "http://www.amazon.com/Bertolli-Extra-Tasting-51-Ounce-Bottle/dp/B000WHR2MU", new Qty("51 floz"), new Qty("0.35 USD/floz")),
        new ProductSource("doorbuster.com.au (2 x 2L bottles)", "http://www.doorbuster.com.au/bertolli-2l-olive-oil-extra-light.html", new Qty("4 litres"), new Qty("9 AUD/litre")),
      ], 
      new Qty("15 ml"), [ 
        new IngredientElement("Energy", new Qty("120 kilocalories")),
        new IngredientElement("Fats", new Qty("14g")),
        new IngredientElement("Fats (saturated)", new Qty("2g")),
        new IngredientElement("Fats (polyunsaturated)", new Qty("2g")),
        new IngredientElement("Fats (monounsaturated)", new Qty("10g")),
      ]

    @products.push new Product "Hain Pure Foods Sea Salt Iodized", 
      [ 
        new ProductSource("Amazon.com (26 oz package)", "http://www.amazon.com/gp/customer-media/product-gallery/B000MDACSK", new Qty("26 oz"), new Qty("0.075769231 USD/oz")),
        new ProductSource("iHerb.com (26 oz package)", "http://au.iherb.com/Hain-Pure-Foods-Iodized-Sea-Salt-26-oz-737-g/33293", new Qty("26 oz"), new Qty("0.075769231 USD/oz")),
      ], 
      new Qty("1.5 g"), [ 
        new IngredientElement("Sodium", new Qty("590mg")),
        new IngredientElement("Chloride", new Qty("909.62mg")),
        new IngredientElement("Iodine", new Qty("67.5 microgram")),
      ]

    @products.push new Product "NOW Foods Calcium/magnesium 1000/500 mg", 
      [ 
        new ProductSource("Amazon.com (100 tablets)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("100 count"), new Qty(".0811 USD/each")),
        new ProductSource("Amazon.com (120 capsules)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("120 count"), new Qty(".05025 USD/each")),
        new ProductSource("Amazon.com (240 capsules)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("240 count"), new Qty(".06492 USD/each")),
        new ProductSource("iHerb.com (240 capsules)", "http://www.iherb.com/Now-Foods-Calcium-Magnesium-240-Softgels/461", new Qty("240 count"), new Qty(".06366 USD/each")),
        new ProductSource("Amazon.com (250 tablets)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("250 count"), new Qty(".05192 USD/each")),
      ], 
      new Qty("1 count"), [ 
        new IngredientElement("Calcium", new Qty("1000mg")),
        new IngredientElement("Magnesium", new Qty("500mg")),
        new IngredientElement("Zinc", new Qty("10mg")),
        new IngredientElement("Vitamin D", new Qty("600 IU")),
      ]

    @products.push new Product "Butter (unsalted)", 
      [ 
        new ProductSource("Generic", "https://www.google.com.au/search?q=unsalted+butter", new Qty("1 lb"), new Qty("12.34 USD/lb")),
      ], 
      new Qty("100g"), [ 
        new IngredientElement("Energy", new Qty("717 kcal")),
        new IngredientElement("Fats", new Qty("81 g")),
        new IngredientElement("Fats (saturated)", new Qty("51g")),
        new IngredientElement("Fats (monounsaturated)", new Qty("21 g")),
        new IngredientElement("Fats (polyunsaturated)", new Qty("3 g")),
        new IngredientElement("Omega-3 Fatty Acids", new Qty("315 mg")),
        new IngredientElement("Omega-6 Fatty Acids", new Qty("2728 mg")),
        new IngredientElement("Cholesterol", new Qty("215 mg")),
        new IngredientElement("Sodium", new Qty("11 mg")),
        new IngredientElement("Protein", new Qty("1 g")),
        new IngredientElement("Calcium", new Qty("24 mg")),
        new IngredientElement("Phosphorus", new Qty("24 mg")),
        new IngredientElement("Potassium", new Qty("24 mg")),
        new IngredientElement("Selenium", new Qty("1.0 microgram")),
        new IngredientElement("Vitamin A", new Qty("2499 IU")),
        new IngredientElement("Vitamin K", new Qty("7 microgram")),
        new IngredientElement("Folate", new Qty("3 microgram")),
        new IngredientElement("Vitamin B12", new Qty("0.2 microgram")),
        new IngredientElement("Pantothenic acid", new Qty("0.1 mg")),
        new IngredientElement("Choline", new Qty("18.8 mg")),
      ]

    @products.push new Product "NOW Foods Choline & Inositol 500mg 100 Capsules", 
      [ 
        new ProductSource("Amazon.com (100 capsules)", "http://www.amazon.com/Choline-Inositol-500mg-100-Capsules/dp/B000JN4GBC", new Qty("100 count"), new Qty(".0638 USD/each")),
        new ProductSource("iHerb.com (100 capsules)", "http://www.iherb.com/Now-Foods-Choline-Inositol-500-mg-100-Capsules/513", new Qty("100 count"), new Qty(".0827 USD/each")),
      ], 
      new Qty("1 count"), [ 
        new IngredientElement("Choline", new Qty("250mg")),
        new IngredientElement("Inositol", new Qty("250mg")),
      ]

    @products.push new Product "Copper Gluconate Anhydrous 1%", 
      [ 
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/copper-gluconate-anhydrous-1.html", new Qty("1kg"), new Qty("32.50 USD/kg")),
      ], 
      new Qty("160mg"), [ 
        new IngredientElement("Copper", new Qty("1.6mg")),
      ]

    @products.push new Product "Potassium Citrate", 
      [ 
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("250g"), new Qty("40 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("500g"), new Qty("36 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("1kg"), new Qty("32.50 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("1.5kg"), new Qty("30.83 USD/kg")),
      ], 
      new Qty("275mg"), [ 
        new IngredientElement("Potassium", new Qty("99mg")),
      ]

    @products.push new Product "Potassium Gluconate", 
      [ 
        new ProductSource("iHerb.com (1lb package)", "http://www.iherb.com/Now-Foods-Potassium-Gluconate-100-Pure-Powder-1-lb-454-g/13939", new Qty("1lb"), new Qty("12.10 USD/lb")),
        new ProductSource("Amazon.com (1lb package)", "http://www.amazon.com/Now-Foods-Potassium-Gluconate-1-pound/dp/B0015C2ZI2", new Qty("1lb"), new Qty("9.48 USD/lb")),
      ], 
      new Qty("3.48g"), [ 
        new IngredientElement("Potassium", new Qty("540mg")),
      ]

    @products.push new Product "Optimum Nutrition Fitness Fiber", 
      [ 
        new ProductSource("Amazon.com (6.87oz package)", "http://www.amazon.com/Optimum-Nutrition-Fitness-Fiber-6-87/dp/B003VUHU0O", new Qty("6.87oz"), new Qty("1.15720524 USD/oz")),
        new ProductSource("au.Bodybuilding.com (195g package)", "http://au.bodybuilding.com/store/opt/fitness-fiber.html", new Qty("195g"), new Qty("0.029435897 AUD/g")),
      ], 
      new Qty("6.5g"), [ 
        new IngredientElement("Energy", new Qty("10 kcal")),
        new IngredientElement("Carbohydrates", new Qty("6g")),
        new IngredientElement("Fibre", new Qty("5g")),
      ]

    @products.push new Product "Fish Oil (Omega 3) EPA/DHA", 
      [ 
        new ProductSource("PureBulk.com (8.45oz package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("8.45floz"), new Qty("2.071005917 USD/floz")),
        new ProductSource("PureBulk.com (16.9oz package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("16.9floz"), new Qty("1.863905325 USD/floz")),
        new ProductSource("PureBulk.com (33.8oz package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("33.8floz"), new Qty("1.686390533 USD/floz")),
      ], 
      new Qty("5 ml"), [ 
        new IngredientElement("Energy", new Qty("41 kcal")),
        new IngredientElement("Fats", new Qty("4.5g")),
        new IngredientElement("Omega-3 Fatty Acids", new Qty("1206mg")),
        new IngredientElement("Eicosapentaenoic acid", new Qty("617mg")),
        new IngredientElement("Docosahexaenoic acid", new Qty("351mg")),
      ]

    @products.push new Product "Biotin 1% (Vitamin B7) Powder", 
      [ 
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1kg"), new Qty("65.50 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1.5kg"), new Qty("62.33 USD/kg")),
      ], 
      new Qty("77mg"), [ new IngredientElement("Biotin", new Qty("1mg")) ]

    @products.push new Product "Creatine Monohydrate", 
      [ 
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("250g"), new Qty("28 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("500g"), new Qty("25.5 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("1kg"), new Qty("23 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("1.5kg"), new Qty("21.83 USD/kg")),
      ], 
      new Qty("2500mg"), [ new IngredientElement("Creatine", new Qty("2500mg")) ]

    @products.push new Product "Swanson Premium Monosodium Phosphate", 
      [ 
        new ProductSource("Swanson Vitamins (4oz package)", "http://www.swansonvitamins.com/swanson-premium-pure-monosodium-phosphate-4-oz-113-grams-pwdr", new Qty("4oz"), new Qty("0.9975 USD/oz")),
      ], 
      new Qty("1g"), [ 
        new IngredientElement("Phosphorus", new Qty("250mg")),
        new IngredientElement("Sodium", new Qty("190mg")),
      ]

    @products.push new Product "Methylsulfonylmethane (MSM)", 
      [ 
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("250g"), new Qty("36 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("500g"), new Qty("32.5 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("1kg"), new Qty("29.25 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("1.5kg"), new Qty("27.83 USD/kg")),
      ], 
      new Qty("1300mg"), [ 
        new IngredientElement("Sulfur", new Qty("442mg")),
        new IngredientElement("Methylsulfonylmethane", new Qty("1300mg")),
      ]

    @products.push new Product "Nature's Way Alive! Men's Multi Max Potency", 
      [ 
        new ProductSource("Amazon.com (90 tablets)", "http://www.amazon.com/Alive-Mens-Potency-Multivitamin-tablets/dp/B003B3OOO6", new Qty("90 count"), new Qty(".145222222 USD/count")),
      ], 
      new Qty("3 count"), [ 
        new IngredientElement("Calories", new Qty("5 kcal")),             
        new IngredientElement("Carbohydrates", new Qty("1g")),             
        new IngredientElement("Vitamin A", new Qty("10000IU")),             
        new IngredientElement("Vitamin C", new Qty("300mg")),             
        new IngredientElement("Vitamin D", new Qty("1000IU")),             
        new IngredientElement("Vitamin E", new Qty("120IU")),             
        new IngredientElement("Vitamin K", new Qty("80 microgram")),             
        new IngredientElement("Thiamin", new Qty("50mg")),             
        new IngredientElement("Riboflavin", new Qty("50mg")),             
        new IngredientElement("Niacin", new Qty("100mg")),             
        new IngredientElement("Vitamin B6", new Qty("50mg")),             
        new IngredientElement("Folate", new Qty("400 microgram")),             
        new IngredientElement("Vitamin B12", new Qty("500 microgram")),             
        new IngredientElement("Biotin", new Qty("325 microgram")),             
        new IngredientElement("Pantothenic acid", new Qty("125mg")),             
        new IngredientElement("Calcium", new Qty("250mg")),             
        new IngredientElement("Iron", new Qty("370 microgram")),             
        new IngredientElement("Iodine", new Qty("150 microgram")),             
        new IngredientElement("Magnesium", new Qty("125mg")),             
        new IngredientElement("Zinc", new Qty("30mg")),             
        new IngredientElement("Selenium", new Qty("250 microgram")),             
        new IngredientElement("Copper", new Qty("4mg")),             
        new IngredientElement("Manganese", new Qty("5mg")),             
        new IngredientElement("Chromium", new Qty("250 microgram")),             
        new IngredientElement("Molybdenum", new Qty("75 microgram")),             
        new IngredientElement("Sodium", new Qty("15mg")),             
        new IngredientElement("Potassium", new Qty("50mg")),             
        new IngredientElement("Inositol", new Qty("50mg")),             
        new IngredientElement("Choline", new Qty("30mg")),             
        new IngredientElement("Rutin", new Qty("25mg")),             
        new IngredientElement("Boron", new Qty("1mg")),             
        new IngredientElement("Lutein", new Qty("500 microgram")),             
        new IngredientElement("Ginseng", new Qty("100 mg")),             
        new IngredientElement("Lycopene", new Qty("2 mg")),             
      ]   

    @products.push new Product "Nature's Way Alive! Once Daily Multi-Vitamin", 
      [ 
        new ProductSource("Amazon.com (60 tablets)", "http://www.amazon.com/Natures-Way-Alive-Daily-Multi-Vitamin/dp/B003UEFUA8", new Qty("60 count"), new Qty(".216 USD/count")),
      ], 
      new Qty("1 count"), [ 
        new IngredientElement("Vitamin A", new Qty("10000 IU")), 
        new IngredientElement("Vitamin C", new Qty("250mg")), 
        new IngredientElement("Vitamin D", new Qty("1000 IU")), 
        new IngredientElement("Vitamin E", new Qty("120 IU")), 
        new IngredientElement("Vitamin K", new Qty("80 microgram")), 
        new IngredientElement("Thiamin", new Qty("25mg")), 
        new IngredientElement("Riboflavin", new Qty("25mg")), 
        new IngredientElement("Niacin", new Qty("50mg")), 
        new IngredientElement("Vitamin B6", new Qty("40mg")), 
        new IngredientElement("Folate", new Qty("400 microgram")), 
        new IngredientElement("Vitamin B12", new Qty("120 microgram")), 
        new IngredientElement("Biotin", new Qty("325 microgram")), 
        new IngredientElement("Pantothenic acid", new Qty("50mg")), 
        new IngredientElement("Calcium", new Qty("100mg")), 
        new IngredientElement("Iron", new Qty("18mg")), 
        new IngredientElement("Iodine", new Qty("150 microgram")), 
        new IngredientElement("Magnesium", new Qty("50mg")), 
        new IngredientElement("Zinc", new Qty("15mg")), 
        new IngredientElement("Selenium", new Qty("200 microgram")), 
        new IngredientElement("Copper", new Qty("2mg")), 
        new IngredientElement("Manganese", new Qty("5mg")), 
        new IngredientElement("Chromium", new Qty("250 microgram")), 
        new IngredientElement("Molybdenum", new Qty("75 microgram")), 
        new IngredientElement("Potassium", new Qty("5mg")), 
        new IngredientElement("Choline", new Qty("20mg")), 
        new IngredientElement("Inositol", new Qty("20mg")), 
        new IngredientElement("Rutin", new Qty("5mg")), 
        new IngredientElement("Boron", new Qty("1mg")), 
        new IngredientElement("Lutein", new Qty("500 microgram")), 
        new IngredientElement("Lycopene", new Qty("200 microgram")), 
      ]   

    @products.push new Product "Swisse Men's Ultivite F1", 
      [ 
        new ProductSource("Chemist Warehouse (Australia) 120 Tablets", "http://www.chemistwarehouse.com.au/product.asp?id=55511&source=GS&gclid=CMer-6b1hbcCFURcpQodjywAEQ", new Qty("120 count"), new Qty("0.20825 AUD/count")),
      ], 
      new Qty("1 count"), [ 
        new IngredientElement("Betacarotene", new Qty("5 mg")),
        new IngredientElement("Vitamin D", new Qty("200 IU")),
        new IngredientElement("Cholecalciferol", new Qty("5 microgram")),
        new IngredientElement("Vitamin E", new Qty("50 IU")),
        new IngredientElement("D-alpha tocopheryl acid succinate", new Qty("41.3 mg")),
        new IngredientElement("Thiamin", new Qty("30 mg")),
        new IngredientElement("Riboflavin", new Qty("30 mg")),
        new IngredientElement("Nicotinamide", new Qty("30 mg")),
        new IngredientElement("Pantothenic acid", new Qty("64.13 mg")),
        new IngredientElement("Vitamin B6", new Qty("24.68 mg")),
        new IngredientElement("Vitamin B12", new Qty("30 microgram")),
        new IngredientElement("Biotin", new Qty("50 microgram")),
        new IngredientElement("Folate", new Qty("500 microgram")),
        new IngredientElement("Vitamin C", new Qty("165.2 mg")),
        new IngredientElement("Choline", new Qty("25 mg")),
        new IngredientElement("Inositol", new Qty("25 mg")),
        new IngredientElement("Citrus bioflavonoids extract", new Qty("40 mg")),
        new IngredientElement("Tyrosine", new Qty("1 mg")),
        new IngredientElement("Lysine hydrochloride", new Qty("50 mg")),
        new IngredientElement("Calcium", new Qty("21 mg")),
        new IngredientElement("Magnesium", new Qty("57.89 mg")),
        new IngredientElement("Potassium", new Qty("4 mg")),
        new IngredientElement("Iron", new Qty("3 mg")),
        new IngredientElement("Chromium", new Qty("6.2 microgram")),
        new IngredientElement("Manganese", new Qty("1.2 mg")),
        new IngredientElement("Copper", new Qty("28 microgram")),
        new IngredientElement("Iodine", new Qty("50 microgram")),
        new IngredientElement("Zinc", new Qty("6 mg")),
        new IngredientElement("Selenium", new Qty("26 microgram")),
        new IngredientElement("Co-Enzyme Q10", new Qty("1 mg")),
        new IngredientElement("Spearmint oil", new Qty("1.5mg")),
        new IngredientElement("Parsley", new Qty("10 mg")),
        new IngredientElement("Papaya", new Qty("10 mg")),
        new IngredientElement("Lutein", new Qty("200 microgram")),
        new IngredientElement("Celery", new Qty("20 mg")),
        new IngredientElement("Astragalus", new Qty("50 mg")),
        new IngredientElement("Buchu", new Qty("10 mg")),
        new IngredientElement("Barberry", new Qty("15 mg")),
        new IngredientElement("Gotu kola", new Qty("50 mg")),
        new IngredientElement("Hawthorn", new Qty("100 mg")),
        new IngredientElement("Horsetail", new Qty("30 mg")),
        new IngredientElement("Fennel", new Qty("15 mg")),
        new IngredientElement("Sarsaparilla", new Qty("50 mg")),
        new IngredientElement("Damiana", new Qty("120 mg")),
        new IngredientElement("Ginger", new Qty("5 mg")),
        new IngredientElement("Globe artichoke", new Qty("50 mg")),
        new IngredientElement("Oats", new Qty("500 mg")),
        new IngredientElement("Bilberry", new Qty("25 mg")),
        new IngredientElement("Grapeseed", new Qty("1.0 g")),
        new IngredientElement("St. Mary’s thistle", new Qty("50 mg")),
        new IngredientElement("Ginseng", new Qty("50 mg")),
        new IngredientElement("Gingko Biloba", new Qty("100 mg")),
        new IngredientElement("Saw palmetto", new Qty("200 mg")),
        new IngredientElement("Green tea", new Qty("20 mg")),
        new IngredientElement("Tomato", new Qty("700 mg")),
      ]
