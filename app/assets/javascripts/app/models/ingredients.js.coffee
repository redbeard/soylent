class window.IngredientElement
  constructor: (name, quantity)->
    @name = name
    @quantity = quantity

  contents: ()->
    [ this ]

  in_quantity: (desired_quantity)->
    throw "Incompatible quantities, element's: #{@quantity}, given: #{desired_quantity}" unless @quantity.isCompatible(desired_quantity)
    new IngredientElement(@name, desired_quantity)

  in_scale: (scale)->
    new IngredientElement(@name, @quantity.mul(scale))

  totals: ()->
    totals = new IngredientElements()
    totals[@name] = this
    totals

  add: (ingredient_element)->
    return this if (ingredient_element == null) or (ingredient_element == undefined)
    throw "Incompatible element to add. This is (#{@toString()}). Tried adding: (#{ingredient_element.toString()})" unless (ingredient_element.name == @name and ingredient_element.quantity.isCompatible(@quantity))
    new IngredientElement(@name, @quantity.add(ingredient_element.quantity))

  mul: (scale)->
    @in_scale(scale)

  toString: ()->
    "#{@name}:\t#{@quantity.toString()}"

class window.IngredientElements 
  constructor: ()->

  add: (ingredient_elements)-> 
    rhs = ingredient_elements.totals()

    _sum = new IngredientElements()
    for k,v of this
      _sum[k] = v if (v.totals)
    for k,v of rhs
      if (_sum[k] and _sum[k].totals)
        _sum[k] = _sum[k].add(v)
      else 
        _sum[k] = v if (v.totals)

    _sum 

  mul: (scale)->
    r = new IngredientElements()
    for k,v of this
      r[k] = v.mul(scale) if (v.mul)
    r

  totals: ()->
    this

  elements: ()->
    r = []
    for k,v of this
      r.push(v) if (v.totals)
    r

  toString: ()->
    @elements().join("\n")

class window.Ingredient
  constructor: (name, quantity, serving_contents)->
    @name = name
    @quantity = quantity
    @serving_contents = serving_contents

  totals: ()->
    @contents().reduce ( (accumulator, i)-> accumulator.add(i) ), new IngredientElements()

  unique_element_names: ()->
    Object.keys(@totals())

  contents_in_scale: (scale)->
    @contents().map (content)-> content.in_scale(scale)

  contents: ()->
    @serving_contents

  remove: (ingredient)->
    @serving_contents = @serving_contents.filter (i) -> (i != ingredient)

  in_quantity: (desired_quantity)->
    throw "Incompatible quantities, ingredient's: #{@quantity}, given: #{desired_quantity}" unless @quantity.isCompatible(desired_quantity)
    scale = desired_quantity.div(@quantity)
    @in_scale(scale)

  in_scale: (scale)->
    new Ingredient(@name, @quantity.mul(scale), @contents_in_scale(scale))

  toString: ()->
    "#{@name}: Serving #{@quantity} contains:\n\t#{ @serving_contents.map( (i)-> i.toString() ).join("\n\t") }"

class window.Recipe extends Ingredient
  constructor: (serving_contents)->
    super "Recipe", new Qty("1 day"), serving_contents

class window.Recommendation extends Ingredient
  constructor: (serving_contents)->
    super "Recommended", new Qty("1 day"), serving_contents

class window.Product extends Ingredient
  constructor: (name, sources, serving_quantity, serving_contents)->
    super(name, serving_quantity, serving_contents)
    @sources = sources
    @serving_contents = [ @best_price().as_ingredient().mul( serving_quantity ) ].concat(@serving_contents)

  in_scale: (scale)->
    new ProductInQuantity(@product, "#{scale}")

  best_price: ()->
    @sources.reduce ((a, i)-> 
      if a == null
        i
      else if a.price <= i.price
        a
      else
        i
      ), null

  in_quantity: (desired_quantity)->
    new ProductInQuantity(this, desired_quantity)

  toString: ()->
    "#{@name}: Serving #{@quantity} contains:\n\t#{ @serving_contents.map( (i)-> i.toString() ).join("\n\t") }\n\tAvailable from:\n\t\t#{ @sources.map( (i)-> i.toString() ).join("\n\t\t") }"

class window.ProductInQuantity
  constructor: (product, desired_quantity)->
    throw "Incompatible quantities, product's: #{product.quantity}, given: #{desired_quantity}" unless product.quantity.isCompatible(desired_quantity)
    @product = product
    @name = @product.name
    @quantity = desired_quantity

  scale: () -> @quantity.div(@product.quantity)

  best_price: ()-> @product.best_price()

  toString: ()->
    "#{@quantity.toString()} (#{scale()}x) serving of #{@product.name}"

  totals: ()->
    @product.totals().mul(@scale())

  in_scale: (scale)->
    new ProductInQuantity(@product, "#{scale * @scale()}")

  in_quantity: (desired_quantity)->
    new ProductInQuantity(@product, desired_quantity)

class window.ProductSource
  constructor: (name, url, quantity_in_package, price)->
    @name = name
    @url = url
    @quantity_in_package = quantity_in_package
    @price = price

  as_ingredient: ()->
    new IngredientElement("Price", @price)

  toString: ()->
    "#{@name} #{@url} for #{@price.toString()} per #{@quantity_in_package.toString()} package"

  in_scale: (scale)->
    new ProductSource(@name, @url, @price * scale)
