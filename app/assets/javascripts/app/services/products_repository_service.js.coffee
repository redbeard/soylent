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
        new IngredientElement("Iodine", new Qty("67.5 microgram")),
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

    @products.push new Product "Biotin 1% (Vitamin B7) Powder", 
      [ 
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1kg"), new Qty("65.50 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1.5kg"), new Qty("62.33 USD/kg")),
      ], 
      new Qty("77mg"), [ new IngredientElement("Biotin", new Qty("1mg")) ]
