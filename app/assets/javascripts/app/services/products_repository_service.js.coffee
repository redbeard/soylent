class window.ProductsRepositoryService
  constructor: ($http, $elements)->
    @http = $http
    @elements = $elements
    @products = []
    @loadDefaults()

  findBySubstring: (substring)->
    @products.filter (i) -> (i.name.toLowerCase().indexOf(substring.toLowerCase()) >= 0)
    #@products

  loadDefaults: ()->
    @products.push new Product @elements, "Oat Bran (Australia)",
      [
        new ProductSource("woolworthsonline.com.au (Homebrand 500g package)", "http://www2.woolworthsonline.com.au/#url=/Shop/ProductDetails%3FStockcode%3D203867%26name%3Dhomebrand-bran%26search%3Dbran", new Qty("500g"), new Qty("4.06 AUD/kg")),
      ],
      new Qty("100g"), [
        @elements.Carbohydrates.in_quantity("46.3g"),
        @elements.Energy.in_quantity("1500 kJ"),
        @elements["Fats (saturated)"].in_quantity("1.7g"),
        @elements.Fats.in_quantity("8.7g"),
        @elements.Protein.in_quantity("17.1g"),
        @elements.Sodium.in_quantity("31mg"),
        @elements["Carbohydrates (sugars)"].in_quantity("1.6g"),
        @elements.Fibre.in_quantity("18.6g"),
      ]

    @products.push new Product @elements, "Fine Powdered Oats",
      [
        new ProductSource("BulkNutrients.com.au (1kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("1kg"), new Qty("9 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (2kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("2kg"), new Qty("8.5 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (5kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("5kg"), new Qty("7.8 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (10kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("10kg"), new Qty("7.5 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (15kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("15kg"), new Qty("7.33 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (20kg package)", "http://www.bulknutrients.com.au/buy/fine-powdered-oats/FPO", new Qty("20kg"), new Qty("6.95 AUD/kg")),
      ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("1608 kJ"),
        @elements.Protein.in_quantity("12.1g"),
        @elements.Carbohydrates.in_quantity("58.1g"),
        @elements["Carbohydrates (sugars)"].in_quantity("1.2g"),
        @elements.Fats.in_quantity("8.5g"),
        @elements["Fats (saturated)"].in_quantity("1.6g"),
        @elements.Fibre.in_quantity("10.2g"),
        @elements.Sodium.in_quantity("2.6mg"),
        # Estimates
        @elements.Potassium.in_quantity("429 mg"),
        @elements.Calcium.in_quantity("54 mg"),
        @elements.Iron.in_quantity("4.72 mg"),
        @elements.Magnesium.in_quantity("177 mg"),
        @elements.Phosphorus.in_quantity("523 mg"),
        @elements.Zinc.in_quantity("3.97 mg"),
        @elements.Copper.in_quantity("0.626 mg"),
        @elements.Manganese.in_quantity("4.916 mg"),
        @elements.Thiamin.in_quantity("0.763 mg"),
        @elements.Riboflavin.in_quantity("0.139 mg"),
        @elements.Niacin.in_quantity("0.961 mg"),
        @elements["Pantothenic acid"].in_quantity("1.349 mg"),
        @elements["Vitamin B6"].in_quantity("0.119 mg"),
        @elements.Folate.in_quantity("56 microgram"),
        @elements.Tryptophan.in_quantity("0.234 g"),
        @elements.Threonine.in_quantity("0.575 g"),
        @elements.Isoleucine.in_quantity("0.694 g"),
        @elements.Leucine.in_quantity("1.284 g"),
        @elements.Lysine.in_quantity("0.701 g"),
        @elements.Methionine.in_quantity("0.312 g"),
        @elements.Cystine.in_quantity("0.408 g"),
        @elements.Phenylalanine.in_quantity("0.895 g"),
        @elements.Tyrosine.in_quantity("0.573 g"),
        @elements.Valine.in_quantity("0.937 g"),
        @elements.Arginine.in_quantity("1.192 g"),
        @elements.Histidine.in_quantity("0.405 g"),
        @elements.Alanine.in_quantity("0.881 g"),
        @elements["Aspartic acid"].in_quantity("1.448 g"),
        @elements["Glutamic acid"].in_quantity("3.712 g"),
        @elements.Glycine.in_quantity("0.841 g"),
        @elements.Proline.in_quantity("0.934 g"),
        @elements.Serine.in_quantity("0.750 g"),
      ]

    @products.push new Product @elements, "Lowan Wholefoods Quick Oats",
      [ new ProductSource("Woolworths Online (1kg package)", "http://www2.woolworthsonline.com.au/Shop/ProductDetails?Stockcode=321862&name=lowan-oats-quick-wholegrain", new Qty("1kg"), new Qty("4.14 AUD/kg")) ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("1610 kJ"),
        @elements.Protein.in_quantity("10.5g"),
        @elements.Carbohydrates.in_quantity("61g"),
        @elements["Carbohydrates (sugars)"].in_quantity("0.9g"),
        @elements.Fats.in_quantity("8.5g"),
        @elements["Fats (saturated)"].in_quantity("1.5g"),
        @elements.Fibre.in_quantity("10g"),
        @elements.Sodium.in_quantity("3mg"),
        @elements.Potassium.in_quantity("0.5mg"),
      ]

    @products.push new Product @elements, "Oats (generic)",
      [ new ProductSource("Wikipedia", "http://en.wikipedia.org/wiki/Oats", new Qty("1kg"), new Qty("5 AUD/kg")) ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("389 kcal"),
        @elements.Protein.in_quantity("16.89 g"),
        @elements.Fats.in_quantity("6.90 g"),
        @elements.Ash.in_quantity("1.72 g"),
        @elements.Carbohydrates.in_quantity("66.27 g"),
        @elements.Fibre.in_quantity("10.6 g"),
        @elements.Calcium.in_quantity("54 mg"),
        @elements.Iron.in_quantity("4.72 mg"),
        @elements.Magnesium.in_quantity("177 mg"),
        @elements.Phosphorus.in_quantity("523 mg"),
        @elements.Potassium.in_quantity("429 mg"),
        @elements.Sodium.in_quantity("2 mg"),
        @elements.Zinc.in_quantity("3.97 mg"),
        @elements.Copper.in_quantity("0.626 mg"),
        @elements.Manganese.in_quantity("4.916 mg"),
        @elements["Vitamin C"].in_quantity("0.0 mg"),
        @elements.Thiamin.in_quantity("0.763 mg"),
        @elements.Riboflavin.in_quantity("0.139 mg"),
        @elements.Niacin.in_quantity("0.961 mg"),
        @elements["Pantothenic acid"].in_quantity("1.349 mg"),
        @elements["Vitamin B6"].in_quantity("0.119 mg"),
        @elements.Folate.in_quantity("56 microgram"),
        @elements.Cholesterol.in_quantity("0 mg"),
        @elements.Tryptophan.in_quantity("0.234 g"),
        @elements.Threonine.in_quantity("0.575 g"),
        @elements.Isoleucine.in_quantity("0.694 g"),
        @elements.Leucine.in_quantity("1.284 g"),
        @elements.Lysine.in_quantity("0.701 g"),
        @elements.Methionine.in_quantity("0.312 g"),
        @elements.Cystine.in_quantity("0.408 g"),
        @elements.Phenylalanine.in_quantity("0.895 g"),
        @elements.Tyrosine.in_quantity("0.573 g"),
        @elements.Valine.in_quantity("0.937 g"),
        @elements.Arginine.in_quantity("1.192 g"),
        @elements.Histidine.in_quantity("0.405 g"),
        @elements.Alanine.in_quantity("0.881 g"),
        @elements["Aspartic acid"].in_quantity("1.448 g"),
        @elements["Glutamic acid"].in_quantity("3.712 g"),
        @elements.Glycine.in_quantity("0.841 g"),
        @elements.Proline.in_quantity("0.934 g"),
        @elements.Serine.in_quantity("0.750 g"),
      ]

    @products.push new Product @elements, "Whey Protein Isolate - Natural", [
        new ProductSource("BulkNutrients.com.au (1kg package)", "http://www.bulknutrients.com.au/buy/wpi-natural-1kg-10kg/WPI", new Qty("1kg"), new Qty("35 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (2kg package)", "http://www.bulknutrients.com.au/buy/wpi-natural-1kg-10kg/WPI", new Qty("2kg"), new Qty("29.5 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (5kg package)", "http://www.bulknutrients.com.au/buy/wpi-natural-1kg-10kg/WPI", new Qty("5kg"), new Qty("25.8 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (10kg package)", "http://www.bulknutrients.com.au/buy/wpi-natural-1kg-10kg/WPI", new Qty("5kg"), new Qty("24.9 AUD/kg")),
      ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("1606 kJ"),
        @elements.Protein.in_quantity("91.4g"),
        @elements.Carbohydrates.in_quantity("0.9g"),
        @elements["Carbohydrates (sugars)"].in_quantity("0.9g"),
        @elements.Fats.in_quantity("1.0g"),
        @elements["Fats (saturated)"].in_quantity("0.7g"),
        @elements.Sodium.in_quantity("185.0mg"),
        new Ingredient "Amino Acid Profile", new Qty("30g"), [
          @elements.Isoleucine.in_quantity("1524 mg"),
          @elements.Leucine.in_quantity("3459 mg"),
          @elements.Lysine.in_quantity("2709 mg"),
          @elements.Methionine.in_quantity("580 mg"),
          @elements.Phenylalanine.in_quantity("919 mg"),
          @elements.Threonine.in_quantity("1282 mg"),
          @elements.Tryptophan.in_quantity("580 mg"),
          @elements.Valine.in_quantity("1354 mg"),
          @elements.Histidine.in_quantity("484 mg"),
          @elements.Alanine.in_quantity("1379 mg"),
          @elements.Arginine.in_quantity("726 mg"),
          @elements["Aspartic acid"].in_quantity("3023 mg"),
          @elements.Cysteine.in_quantity("967 mg"),
          @elements["Glutamic acid"].in_quantity("4257 mg"),
          @elements.Glycine.in_quantity("435 mg"),
          @elements.Proline.in_quantity("1088 mg"),
          @elements.Serine.in_quantity("1088 mg"),
          @elements.Tyrosine.in_quantity("1016 mg"),
        ]
      ]

    @products.push new Product @elements, "L Leucine", [
        new ProductSource("BulkNutrients.com.au (250g package)", "http://www.bulknutrients.com.au/buy/l-leucine/LLEUC", new Qty("250g"), new Qty("60 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (1kg package)", "http://www.bulknutrients.com.au/buy/l-leucine/LLEUC", new Qty("1kg"), new Qty("39 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (4kg package)", "http://www.bulknutrients.com.au/buy/l-leucine/LLEUC", new Qty("4kg"), new Qty("34.75 AUD/kg")),
      ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("1700 kJ"),
        @elements.Protein.in_quantity("100g"),
        new Ingredient "Amino Acid Profile", new Qty("100g"), [
          @elements.Leucine.in_quantity("100g"),
        ]
      ]

    @products.push new Product @elements, "Ascorbic Acid Powder",
      [
        new ProductSource("PureBulk.com (100g package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("100g"), new Qty("55 USD/kg")),
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("250g"), new Qty("47 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("500g"), new Qty("42.5 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("1kg"), new Qty("38.25 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", new Qty("1.5kg"), new Qty("36.33 USD/kg")),
      ],
      new Qty("1g"), [ @elements["Vitamin C"].in_quantity("1000mg") ]

    @products.push new Product @elements, "Calcium Carbonate (Oyster Shell)",
      [
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/calcium-carbonate-powder-oyster-shell.html", new Qty("500g"), new Qty("22 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/calcium-carbonate-powder-oyster-shell.html", new Qty("1kg"), new Qty("20 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/calcium-carbonate-powder-oyster-shell.html", new Qty("1.5kg"), new Qty("19 USD/kg")),
      ],
      new Qty("1250mg"), [ @elements.Calcium.in_quantity("500mg") ]

    @products.push new Product @elements, "Pantothenic Acid / Vitamin B5 / Calcium Pantothenate",
      [
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("250g"), new Qty("54 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("500g"), new Qty("49 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("1kg"), new Qty("44.25 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html", new Qty("1.5kg"), new Qty("42 USD/kg")),
      ],
      new Qty("550mg"), [
        @elements["Pantothenic acid"].in_quantity("506mg"),
        @elements.Calcium.in_quantity("44mg"),
      ]

    @products.push new Product @elements, "Maltodextrin (Honeyville)",
      [
        new ProductSource("Honeyville Grain (4-9 lb)", "http://store.honeyvillegrain.com/maltodextrin50lb.aspx", new Qty("4lb"), new Qty("57.94 USD/lb")),
        new ProductSource("Honeyville Grain (10-50 lb)", "http://store.honeyvillegrain.com/maltodextrin50lb.aspx", new Qty("10lb"), new Qty("55.50 USD/lb")),
      ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("380 kilocalories"),
        @elements.Carbohydrates.in_quantity("94g"),
        @elements["Carbohydrates (sugars)"].in_quantity("4g"),
        @elements.Sodium.in_quantity("100mg"),
      ]

    @products.push new Product @elements, "Maltodextrin (BulkNutrients.com.au)",
      [
        new ProductSource("BulkNutrients.com.au (2kg package)", "http://www.bulknutrients.com.au/buy/maltodextrin/MALDEX", new Qty("2kg"), new Qty("6 AUD/kg")),
        new ProductSource("BulkNutrients.com.au (5kg package)", "http://www.bulknutrients.com.au/buy/maltodextrin/MALDEX", new Qty("5kg"), new Qty("4.8 AUD/kg")),
      ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("1600 kilojoules"),
        @elements.Carbohydrates.in_quantity("95g"),
        @elements["Carbohydrates (sugars)"].in_quantity("12.5g"),
        @elements.Sodium.in_quantity("50mg"),
      ]

    @products.push new Product @elements, "Bertolli Extra Light Olive Oil",
      [
        new ProductSource("Amazon.com (51 ounce bottle)", "http://www.amazon.com/Bertolli-Extra-Tasting-51-Ounce-Bottle/dp/B000WHR2MU", new Qty("51 floz"), new Qty("0.35 USD/floz")),
        new ProductSource("doorbuster.com.au (2 x 2L bottles)", "http://www.doorbuster.com.au/bertolli-2l-olive-oil-extra-light.html", new Qty("4 litres"), new Qty("9 AUD/litre")),
        new ProductSource("Woolworths Online (1l bottle)", "http://www2.woolworthsonline.com.au/#url=/Shop/ProductDetails%3FStockcode%3D12339%26name%3Dbertolli-extra-virgin-olive-oil%26search%3Dextra%2Bvirgin%2Boil%2Bolive", new Qty("1 litres"), new Qty("8 AUD/litre")),
      ],
      new Qty("15 ml"), [
        @elements.Energy.in_quantity("120 kilocalories"),
        @elements.Fats.in_quantity("14g"),
        @elements["Fats (saturated)"].in_quantity("2g"),
        @elements["Fats (polyunsaturated)"].in_quantity("2g"),
        @elements["Fats (monounsaturated)"].in_quantity("10g"),
      ]

    @products.push new Product @elements, "Hain Pure Foods Sea Salt Iodized",
      [
        new ProductSource("Amazon.com (26 oz package)", "http://www.amazon.com/gp/customer-media/product-gallery/B000MDACSK", new Qty("26 oz"), new Qty("0.075769231 USD/oz")),
        new ProductSource("iHerb.com (26 oz package)", "http://au.iherb.com/Hain-Pure-Foods-Iodized-Sea-Salt-26-oz-737-g/33293", new Qty("26 oz"), new Qty("0.075769231 USD/oz")),
      ],
      new Qty("1.5 g"), [
        @elements.Sodium.in_quantity("590mg"),
        @elements.Chlorine.in_quantity("909.62mg"),
        @elements.Iodine.in_quantity("67.5 microgram"),
      ]

    @products.push new Product @elements, "Salt Iodized (Generic)",
      [
        new ProductSource("Woolworths Online (Homebrand 500g package)", "http://www2.woolworthsonline.com.au/#url=/Shop/ProductDetails%3FStockcode%3D204373%26name%3Dhomebrand-iodised-salt-drum%26search%3Diodized", new Qty("500g"), new Qty("1.92 AUD/kg")),
        new ProductSource("Woolworths Online (SAXA Cooking Salt Iodized 1kg package)", "http://www2.woolworthsonline.com.au/Shop/ProductDetails?Stockcode=306494&name=saxa-salt-cooking-iodised&search=iodized", new Qty("1kg"), new Qty("1.8 AUD/kg")),
        new ProductSource("Amazon.com (Hain Pure Foods Sea Salt Iodized 26 oz package)", "http://www.amazon.com/gp/customer-media/product-gallery/B000MDACSK", new Qty("26 oz"), new Qty("0.075769231 USD/oz")),
        new ProductSource("iHerb.com (Hain Pure Foods Sea Salt Iodized 26 oz package)", "http://au.iherb.com/Hain-Pure-Foods-Iodized-Sea-Salt-26-oz-737-g/33293", new Qty("26 oz"), new Qty("0.075769231 USD/oz")),
      ],
      new Qty("1.5 g"), [
        @elements.Sodium.in_quantity("590mg"),
        @elements.Chlorine.in_quantity("909.62mg"),
        @elements.Iodine.in_quantity("67.5 microgram"), # Estimated
      ]

    @products.push new Product @elements, "NOW Foods Calcium/magnesium 1000/500 mg",
      [
        new ProductSource("Amazon.com (100 tablets)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("100 count"), new Qty(".0811 USD/each")),
        new ProductSource("Amazon.com (120 capsules)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("120 count"), new Qty(".05025 USD/each")),
        new ProductSource("Amazon.com (240 capsules)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("240 count"), new Qty(".06492 USD/each")),
        new ProductSource("iHerb.com (240 capsules)", "http://www.iherb.com/Now-Foods-Calcium-Magnesium-240-Softgels/461", new Qty("240 count"), new Qty(".06366 USD/each")),
        new ProductSource("Amazon.com (250 tablets)", "http://www.amazon.com/Now-Foods-Calcium-Magnesium-Tablets/dp/B00028LZ9A", new Qty("250 count"), new Qty(".05192 USD/each")),
      ],
      new Qty("1 count"), [
        @elements.Calcium.in_quantity("1000mg"),
        @elements.Magnesium.in_quantity("500mg"),
        @elements.Zinc.in_quantity("10mg"),
        @elements["Vitamin D"].in_quantity("600 IU"),
      ]

    @products.push new Product @elements, "Butter (unsalted)",
      [
        new ProductSource("Generic", "https://www.google.com.au/search?q=unsalted+butter", new Qty("1 lb"), new Qty("12.34 USD/lb")),
      ],
      new Qty("100g"), [
        @elements.Energy.in_quantity("717 kcal"),
        @elements.Fats.in_quantity("81 g"),
        @elements["Fats (saturated)"].in_quantity("51g"),
        @elements["Fats (monounsaturated)"].in_quantity("21 g"),
        @elements["Fats (polyunsaturated)"].in_quantity("3 g"),
        @elements["Omega-3 Fatty Acids"].in_quantity("315 mg"),
        @elements["Omega-6 Fatty Acids"].in_quantity("2728 mg"),
        @elements.Cholesterol.in_quantity("215 mg"),
        @elements.Sodium.in_quantity("11 mg"),
        @elements.Protein.in_quantity("1 g"),
        @elements.Calcium.in_quantity("24 mg"),
        @elements.Phosphorus.in_quantity("24 mg"),
        @elements.Potassium.in_quantity("24 mg"),
        @elements.Selenium.in_quantity("1.0 microgram"),
        @elements["Vitamin A"].in_quantity("2499 IU"),
        @elements["Vitamin K"].in_quantity("7 microgram"),
        @elements.Folate.in_quantity("3 microgram"),
        @elements["Vitamin B12"].in_quantity("0.2 microgram"),
        @elements["Pantothenic acid"].in_quantity("0.1 mg"),
        @elements.Choline.in_quantity("18.8 mg"),
      ]

    @products.push new Product @elements, "NOW Foods Choline & Inositol 500mg 100 Capsules",
      [
        new ProductSource("Amazon.com (100 capsules)", "http://www.amazon.com/Choline-Inositol-500mg-100-Capsules/dp/B000JN4GBC", new Qty("100 count"), new Qty(".0638 USD/each")),
        new ProductSource("iHerb.com (100 capsules)", "http://www.iherb.com/Now-Foods-Choline-Inositol-500-mg-100-Capsules/513", new Qty("100 count"), new Qty(".0827 USD/each")),
      ],
      new Qty("1 count"), [
        @elements.Choline.in_quantity("250mg"),
        @elements.Inositol.in_quantity("250mg"),
      ]

    @products.push new Product @elements, "Copper Gluconate Anhydrous 1%",
      [
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/copper-gluconate-anhydrous-1.html", new Qty("1kg"), new Qty("32.50 USD/kg")),
      ],
      new Qty("160mg"), [
        @elements.Copper.in_quantity("1.6mg"),
      ]

    @products.push new Product @elements, "Potassium Citrate Powder",
      [
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("250g"), new Qty("40 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("500g"), new Qty("36 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("1kg"), new Qty("32.50 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/potassium-citrate-powder.html", new Qty("1.5kg"), new Qty("30.83 USD/kg")),
      ],
      new Qty("275mg"), [
        @elements.Potassium.in_quantity("99mg"),
      ]

    @products.push new Product @elements, "NOW Foods Potassium Gluconate Powder",
      [
        new ProductSource("iHerb.com (1lb package)", "http://au.iherb.com/now-foods-potassium-gluconate-100-pure-powder-1-lb-454-g/13939", new Qty("1lb"), new Qty("12.1 AUD/lb")),
        new ProductSource("Amazin.com (1lb package)", "http://www.amazon.com/Now-Foods-Potassium-Gluconate-1-pound/dp/B0015C2ZI2", new Qty("1lb"), new Qty("14.47 USD/lb")),
        new ProductSource("VitaminLife.com (1lb package)", "http://www.vitaminlife.com/product-exec/PNAME/Potassium-Gluconate-Powder-/product_id/52846", new Qty("1lb"), new Qty("12.34 USD/lb")),
      ],
      new Qty("3.48g"), [
        @elements.Potassium.in_quantity("540mg"),
      ]

    @products.push new Product @elements, "NOW Foods Potassium Chloride Powder",
      [
        new ProductSource("iHerb.com (8oz package)", "http://www.iherb.com/Now-Foods-Potassium-Chloride-Powder-8-oz-227-g/777", new Qty("8 oz"), new Qty("0.55625 USD/oz")),
        new ProductSource("Amazon.com (8oz package)", "http://www.amazon.com/Potassium-Chloride-Powder-From-Foods/dp/B009K6T7OA", new Qty("8 oz"), new Qty("0.55625 USD/oz")),
        new ProductSource("VitaminLife.com (8oz package)", "http://www.vitaminlife.com/product-exec/PNAME/Potassium-Chloride-Powder/product_id/14215", new Qty("8 oz"), new Qty("0.5675 USD/oz")),
      ],
      new Qty("1.4g"), [
        @elements.Potassium.in_quantity("730mg"),
        @elements.Chlorine.in_quantity("654mg"),
      ]

    @products.push new Product @elements, "NOW Foods Iron 18mg",
      [
        new ProductSource("Amazon.com (120 caps package)", "http://www.amazon.com/dp/B000WQDD2O", new Qty("120 count"), new Qty("0.064833333 USD/each")),
        new ProductSource("iHerb.com (120 caps package)", "http://www.iherb.com/Now-Foods-Iron-18-mg-120-Veggie-Caps/10481", new Qty("120 count"), new Qty("0.058333333 USD/each")),
      ],
      new Qty("1 count"), [
        @elements.Iron.in_quantity("18mg"),
      ]

    @products.push new Product @elements, "Swanson Potassium Citrate (capsules)",
      [
        new ProductSource("MyDailyVita.com", "http://mydailyvita.com/a/index.php?main_page=product_info&cPath=32&products_id=738", new Qty("120 count"), new Qty("0.132916667 AUD/each")),
      ],
      new Qty("1 count"), [
        @elements.Potassium.in_quantity("99mg"),
      ]

    @products.push new Product @elements, "Potassium Gluconate",
      [
        new ProductSource("iHerb.com (1lb package)", "http://www.iherb.com/Now-Foods-Potassium-Gluconate-100-Pure-Powder-1-lb-454-g/13939", new Qty("1lb"), new Qty("12.10 USD/lb")),
        new ProductSource("Amazon.com (1lb package)", "http://www.amazon.com/Now-Foods-Potassium-Gluconate-1-pound/dp/B0015C2ZI2", new Qty("1lb"), new Qty("9.48 USD/lb")),
      ],
      new Qty("3.48g"), [
        @elements.Potassium.in_quantity("540mg"),
      ]

    @products.push new Product @elements, "Optimum Nutrition Fitness Fiber",
      [
        new ProductSource("Amazon.com (6.87oz package)", "http://www.amazon.com/Optimum-Nutrition-Fitness-Fiber-6-87/dp/B003VUHU0O", new Qty("6.87oz"), new Qty("1.15720524 USD/oz")),
        new ProductSource("Bodybuilding.com (195g package)", "http://au.bodybuilding.com/store/opt/fitness-fiber.html", new Qty("195g"), new Qty("0.029435897 AUD/g")),
        new ProductSource("ProteinKing.com.au (195g package)", "http://www.proteinking.com.au/Bodybuilding-Supplements/Optimum-Fitness-Fiber", new Qty("195g"), new Qty("0.071538462 AUD/g")),
      ],
      new Qty("6.5g"), [
        @elements.Energy.in_quantity("10 kcal"),
        @elements.Carbohydrates.in_quantity("6g"),
        @elements.Fibre.in_quantity("5g"),
      ]

    @products.push new Product @elements, "Myogenix Pro Fiber",
      [
        new ProductSource("Vitamin Grocer (AU) (500g package)", "http://www.vitamingrocer.com.au/Pro-Fiber-plus-Enzymes-Digestive-Support-p/143237.htm", new Qty("500g"), new Qty("93.56 AUD/kg")),
        new ProductSource("BodyBuilding.com (500g package)", "http://au.bodybuilding.com/store/myo/profiber.html", new Qty("500g"), new Qty("54.02 AUD/kg")),
      ],
      new Qty("10g"), [
        @elements.Energy.in_quantity("20 kcal"),
        @elements.Carbohydrates.in_quantity("9g"),
        @elements.Fibre.in_quantity("9g"),
      ]

    @products.push new Product @elements, "Natures First Fibre Cleanse",
      [
        new ProductSource("Aussie Health Products (AU) (285g package)", "http://www.aussiehealthproducts.com.au/digestion-gut-health.php?id=411650&Natures-First-Fibre-Cleanse-Shaker-285g", new Qty("285g"), new Qty("28.245614035 AUD/kg")),
        new ProductSource("Aussie Health Products (AU) (400g package)", "http://www.aussiehealthproducts.com.au/cereals.php?id=7003243&Natures-First-Fibre-Cleanse-400g", new Qty("400g"), new Qty("23 AUD/kg")),
      ],
      new Qty("10g"), [
        @elements.Energy.in_quantity("20 kcal"),
        @elements.Carbohydrates.in_quantity("9g"),
        @elements.Fibre.in_quantity("9g"),
      ]

    @products.push new Product @elements, "Fish Oil (Omega 3) EPA/DHA",
      [
        new ProductSource("PureBulk.com (8.45oz package)", "http://purebulk.com/fish-oil-high-omega-3-liquid.html", new Qty("8.45floz"), new Qty("2.071005917 USD/floz")),
        new ProductSource("PureBulk.com (16.9oz package)", "http://purebulk.com/fish-oil-high-omega-3-liquid.html", new Qty("16.9floz"), new Qty("1.863905325 USD/floz")),
        new ProductSource("PureBulk.com (33.8oz package)", "http://purebulk.com/fish-oil-high-omega-3-liquid.html", new Qty("33.8floz"), new Qty("1.686390533 USD/floz")),
      ],
      new Qty("5 ml"), [
        @elements.Energy.in_quantity("41 kcal"),
        @elements.Fats.in_quantity("4.5g"),
        @elements["Omega-3 Fatty Acids"].in_quantity("1206mg"),
        @elements["Eicosapentaenoic acid"].in_quantity("617mg"),
        @elements["Docosahexaenoic acid"].in_quantity("351mg"),
      ]

    @products.push new Product @elements, "Biotin 1% (Vitamin B7) Powder",
      [
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1kg"), new Qty("65.50 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1.5kg"), new Qty("62.33 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", new Qty("1.5kg"), new Qty("62.33 USD/kg")),
      ],
      new Qty("77mg"), [ @elements.Biotin.in_quantity("1mg") ]

    @products.push new Product @elements, "Biotin 1% (Vitamin B7) Tablets",
      [
        new ProductSource("Thompsons Biotin 150mcg Tablets 100", "http://www.chemistwarehouse.com.au/product.asp?id=63325", new Qty("100 count"), new Qty("0.1199 AUD/count")),
      ],
      new Qty("1 count"), [ @elements.Biotin.in_quantity("150ug") ]

    @products.push new Product @elements, "Creatine Monohydrate",
      [
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("250g"), new Qty("28 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("500g"), new Qty("25.5 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("1kg"), new Qty("23 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("1.5kg"), new Qty("21.83 USD/kg")),
        new ProductSource("Mushashi.com.au (700g package)", "http://www.chemistwarehouse.com.au/product.asp?id=66063", new Qty("700g"), new Qty("61.4142 AUD/kg")),
        new ProductSource("GNClivewell.com.au (500g package)", "http://purebulk.com/creatine-monohydrate-powder.html", new Qty("500g"), new Qty("81.9 AUD/kg")),
      ],
      new Qty("2500mg"), [ @elements.Creatine.in_quantity("2500mg") ]

    @products.push new Product @elements, "Monosodium Phosphate (NaH2PO)",
      [
        new ProductSource("Green Harmony Living - MSP (3 x 4 oz jars)", "http://www.greenharmonyliving.com/store/index.php?main_page=product_info&products_id=1167", new Qty("4oz"), new Qty("8.4783 USD/oz")),
        new ProductSource("Green Harmony Living - MSP (6 x 4 oz jars)", "http://www.greenharmonyliving.com/store/index.php?main_page=product_info&cPath=21_179&products_id=667", new Qty("4oz"), new Qty("6.1558 USD/oz")),
        new ProductSource("Swanson Vitamins (4oz package)", "http://www.swansonvitamins.com/swanson-premium-pure-monosodium-phosphate-4-oz-113-grams-pwdr", new Qty("4oz"), new Qty("0.9975 USD/oz")),
        new ProductSource("eBay.com ChemistryConnection (1lb package)", "http://www.ebay.com/itm/Monosodium-Phosphate-1-Lb-/290399787079", new Qty("1lb"), new Qty("17.70 USD/lb")),
      ],
      new Qty("1g"), [
        @elements.Phosphorus.in_quantity("258mg"),
        @elements.Sodium.in_quantity("192mg"),
      ]

    @products.push new Product @elements, "Methylsulfonylmethane (MSM)",
      [
        new ProductSource("PureBulk.com (250g package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("250g"), new Qty("36 USD/kg")),
        new ProductSource("PureBulk.com (500g package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("500g"), new Qty("32.5 USD/kg")),
        new ProductSource("PureBulk.com (1kg package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("1kg"), new Qty("29.25 USD/kg")),
        new ProductSource("PureBulk.com (1.5kg package)", "http://purebulk.com/msm-methylsulfonylmethane-powder.html", new Qty("1.5kg"), new Qty("27.83 USD/kg")),
        new ProductSource("Mismo.com.au (1kg package)", "http://www.mismo.com.au/mismo-products/msm-powder", new Qty("1kg"), new Qty("45 AUD/kg")),
        new ProductSource("Mismo.com.au (500g package)", "http://www.mismo.com.au/mismo-products/msm-powder", new Qty("500g"), new Qty("52 AUD/kg")),
        new ProductSource("Mismo.com.au (250g package)", "http://www.mismo.com.au/mismo-products/msm-powder", new Qty("250g"), new Qty("60 AUD/kg")),
      ],
      new Qty("1300mg"), [
        @elements.Sulfur.in_quantity("442mg"),
        @elements.Methylsulfonylmethane.in_quantity("1300mg"),
      ]

    @products.push new Product @elements, "Nature's Way Alive! Men's Multi Max Potency",
      [
        new ProductSource("Amazon.com (90 tablets)", "http://www.amazon.com/Alive-Mens-Potency-Multivitamin-tablets/dp/B003B3OOO6", new Qty("90 count"), new Qty(".145222222 USD/count")),
      ],
      new Qty("3 count"), [
        @elements.Energy.in_quantity("5 kcal"),
        @elements.Carbohydrates.in_quantity("1g"),
        @elements["Vitamin A"].in_quantity("10000IU"),
        @elements["Vitamin C"].in_quantity("300mg"),
        @elements["Vitamin D"].in_quantity("1000IU"),
        @elements["Vitamin E"].in_quantity("120IU"),
        @elements["Vitamin K"].in_quantity("80 microgram"),
        @elements.Thiamin.in_quantity("50mg"),
        @elements.Riboflavin.in_quantity("50mg"),
        @elements.Niacin.in_quantity("100mg"),
        @elements["Vitamin B6"].in_quantity("50mg"),
        @elements.Folate.in_quantity("400 microgram"),
        @elements["Vitamin B12"].in_quantity("500 microgram"),
        @elements.Biotin.in_quantity("325 microgram"),
        @elements["Pantothenic acid"].in_quantity("125mg"),
        @elements.Calcium.in_quantity("250mg"),
        @elements.Iron.in_quantity("370 microgram"),
        @elements.Iodine.in_quantity("150 microgram"),
        @elements.Magnesium.in_quantity("125mg"),
        @elements.Zinc.in_quantity("30mg"),
        @elements.Selenium.in_quantity("250 microgram"),
        @elements.Copper.in_quantity("4mg"),
        @elements.Manganese.in_quantity("5mg"),
        @elements.Chromium.in_quantity("250 microgram"),
        @elements.Molybdenum.in_quantity("75 microgram"),
        @elements.Sodium.in_quantity("15mg"),
        @elements.Potassium.in_quantity("50mg"),
        @elements.Inositol.in_quantity("50mg"),
        @elements.Choline.in_quantity("30mg"),
        @elements.Rutin.in_quantity("25mg"),
        @elements.Boron.in_quantity("1mg"),
        @elements.Lutein.in_quantity("500 microgram"),
        @elements.Ginseng.in_quantity("100 mg"),
        @elements.Lycopene.in_quantity("2 mg"),
      ]

    @products.push new Product @elements, "Optimum Nutrition Opti Men",
      [
        new ProductSource("a1supplements.com (180 tablets)", "http://www.a1supplements.com/Opti-Men-180-Tablets-p-2504.html", new Qty("180 count"), new Qty(".133055556 USD/each")),
        new ProductSource("mydailyvita.com (180 tablets)", "http://mydailyvita.com/a/index.php?main_page=product_info&cPath=59&products_id=884", new Qty("180 count"), new Qty(".294166667 AUD/each")),
        new ProductSource("supplementsdirect.com.au (180 tablets)", "http://www.supplementsdirect.com.au/optimum-nutrition-opti-men-180-tablets/?utm_source=myshopping&utm_medium=cpc&utm_campaign=Vitamins+and+Nutrition&utm_term=Optimum+Nutrition+Opti+Men+180+Tablets", new Qty("180 count"), new Qty("0.333055556 AUD/each")),
      ],
      new Qty("3 count"), [
        @elements["Vitamin A"].in_quantity("10000 IU"),
        @elements["Vitamin C"].in_quantity("300 mg"),
        @elements["Vitamin D"].in_quantity("300 IU"),
        @elements["Vitamin E"].in_quantity("200 IU"),
        @elements["Vitamin K"].in_quantity("75 microgram"),
        @elements.Thiamin.in_quantity("75 mg"),
        @elements.Riboflavin.in_quantity("75 mg"),
        @elements.Niacin.in_quantity("75 mg"),
        @elements.Folate.in_quantity("600 microgram"),
        @elements["Vitamin B6"].in_quantity("50 mg"),
        @elements["Vitamin B12"].in_quantity("100 microgram"),
        @elements.Biotin.in_quantity("300 microgram"),
        @elements["Pantothenic acid"].in_quantity("75 mg"),
        @elements.Calcium.in_quantity("200 mg"),
        @elements.Iodine.in_quantity("150 microgram"),
        @elements.Magnesium.in_quantity("100 mg"),
        @elements.Zinc.in_quantity("30 mg"),
        @elements.Selenium.in_quantity("200 microgram"),
        @elements.Copper.in_quantity("2 mg"),
        @elements.Manganese.in_quantity("5 mg"),
        @elements.Chromium.in_quantity("120 microgram"),
        @elements.Molybdenum.in_quantity("80 microgram"),
        @elements["Alpha Lipoic acid"].in_quantity("25 mg"),
        @elements.PABA.in_quantity("10 mg"),
        @elements.Choline.in_quantity("10 mg"),
        @elements.Inositol.in_quantity("10 mg"),
        @elements.Silica.in_quantity("5 mg"),
        @elements.Boron.in_quantity("2 mg"),
        @elements.Lycopene.in_quantity("500 microgram"),
        @elements.Lutein.in_quantity("500 microgram"),
        @elements["Alpha Carotene"].in_quantity("140 microgram"),
        @elements.Vanadium.in_quantity("100 microgram"),
        @elements.Cryptoxanthin.in_quantity("34 microgram"),
        @elements.Zeaxanthin.in_quantity("28 microgram"),
        # Estimated:
        @elements.Ginseng.in_quantity("50 microgram"),
        @elements["Gingko Biloba"].in_quantity("100 microgram"),
      ]

    @products.push new Product @elements, "Nature's Way Alive! Once Daily Multi-Vitamin",
      [
        new ProductSource("Amazon.com (60 tablets)", "http://www.amazon.com/Natures-Way-Alive-Daily-Multi-Vitamin/dp/B003UEFUA8", new Qty("60 count"), new Qty(".216 USD/count")),
      ],
      new Qty("1 count"), [
        @elements["Vitamin A"].in_quantity("10000 IU"),
        @elements["Vitamin C"].in_quantity("250mg"),
        @elements["Vitamin D"].in_quantity("1000 IU"),
        @elements["Vitamin E"].in_quantity("120 IU"),
        @elements["Vitamin K"].in_quantity("80 microgram"),
        @elements.Thiamin.in_quantity("25mg"),
        @elements.Riboflavin.in_quantity("25mg"),
        @elements.Niacin.in_quantity("50mg"),
        @elements["Vitamin B6"].in_quantity("40mg"),
        @elements.Folate.in_quantity("400 microgram"),
        @elements["Vitamin B12"].in_quantity("120 microgram"),
        @elements.Biotin.in_quantity("325 microgram"),
        @elements["Pantothenic acid"].in_quantity("50mg"),
        @elements.Calcium.in_quantity("100mg"),
        @elements.Iron.in_quantity("18mg"),
        @elements.Iodine.in_quantity("150 microgram"),
        @elements.Magnesium.in_quantity("50mg"),
        @elements.Zinc.in_quantity("15mg"),
        @elements.Selenium.in_quantity("200 microgram"),
        @elements.Copper.in_quantity("2mg"),
        @elements.Manganese.in_quantity("5mg"),
        @elements.Chromium.in_quantity("250 microgram"),
        @elements.Molybdenum.in_quantity("75 microgram"),
        @elements.Potassium.in_quantity("5mg"),
        @elements.Choline.in_quantity("20mg"),
        @elements.Inositol.in_quantity("20mg"),
        @elements.Rutin.in_quantity("5mg"),
        @elements.Boron.in_quantity("1mg"),
        @elements.Lutein.in_quantity("500 microgram"),
        @elements.Lycopene.in_quantity("200 microgram"),
      ]

    @products.push new Product @elements, "Swisse Men's Ultivite F1",
      [
        new ProductSource("Chemist Warehouse (Australia) 120 Tablets", "http://www.chemistwarehouse.com.au/product.asp?id=55511&source=GS&gclid=CMer-6b1hbcCFURcpQodjywAEQ", new Qty("120 count"), new Qty("0.20825 AUD/count")),
      ],
      new Qty("1 count"), [
        @elements.Betacarotene.in_quantity("5 mg"),
        @elements["Vitamin D"].in_quantity("200 IU"),
        @elements.Cholecalciferol.in_quantity("5 microgram"),
        @elements["Vitamin E"].in_quantity("50 IU"),
        @elements["D-alpha tocopheryl acid succinate"].in_quantity("41.3 mg"),
        @elements.Thiamin.in_quantity("30 mg"),
        @elements.Riboflavin.in_quantity("30 mg"),
        @elements.Nicotinamide.in_quantity("30 mg"),
        @elements["Pantothenic acid"].in_quantity("64.13 mg"),
        @elements["Vitamin B6"].in_quantity("24.68 mg"),
        @elements["Vitamin B12"].in_quantity("30 microgram"),
        @elements.Biotin.in_quantity("50 microgram"),
        @elements.Folate.in_quantity("500 microgram"),
        @elements["Vitamin C"].in_quantity("165.2 mg"),
        @elements.Choline.in_quantity("25 mg"),
        @elements.Inositol.in_quantity("25 mg"),
        @elements["Citrus bioflavonoids extract"].in_quantity("40 mg"),
        @elements.Tyrosine.in_quantity("1 mg"),
        @elements["Lysine hydrochloride"].in_quantity("50 mg"),
        @elements.Calcium.in_quantity("21 mg"),
        @elements.Magnesium.in_quantity("57.89 mg"),
        @elements.Potassium.in_quantity("4 mg"),
        @elements.Iron.in_quantity("3 mg"),
        @elements.Chromium.in_quantity("6.2 microgram"),
        @elements.Manganese.in_quantity("1.2 mg"),
        @elements.Copper.in_quantity("28 microgram"),
        @elements.Iodine.in_quantity("50 microgram"),
        @elements.Zinc.in_quantity("6 mg"),
        @elements.Selenium.in_quantity("26 microgram"),
        @elements["Co-Enzyme Q10"].in_quantity("1 mg"),
        @elements["Spearmint oil"].in_quantity("1.5mg"),
        @elements.Parsley.in_quantity("10 mg"),
        @elements.Papaya.in_quantity("10 mg"),
        @elements.Lutein.in_quantity("200 microgram"),
        @elements.Celery.in_quantity("20 mg"),
        @elements.Astragalus.in_quantity("50 mg"),
        @elements.Buchu.in_quantity("10 mg"),
        @elements.Barberry.in_quantity("15 mg"),
        @elements["Gotu kola"].in_quantity("50 mg"),
        @elements.Hawthorn.in_quantity("100 mg"),
        @elements.Horsetail.in_quantity("30 mg"),
        @elements.Fennel.in_quantity("15 mg"),
        @elements.Sarsaparilla.in_quantity("50 mg"),
        @elements.Damiana.in_quantity("120 mg"),
        @elements.Ginger.in_quantity("5 mg"),
        @elements["Globe artichoke"].in_quantity("50 mg"),
        @elements.Oats.in_quantity("500 mg"),
        @elements.Bilberry.in_quantity("25 mg"),
        @elements.Grapeseed.in_quantity("1.0 g"),
        @elements["St. Mary’s thistle"].in_quantity("50 mg"),
        @elements.Ginseng.in_quantity("50 mg"),
        @elements["Gingko Biloba"].in_quantity("100 mg"),
        @elements["Saw palmetto"].in_quantity("200 mg"),
        @elements["Green tea"].in_quantity("20 mg"),
        @elements.Tomato.in_quantity("700 mg"),
      ]
