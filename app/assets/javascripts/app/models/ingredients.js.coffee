String.prototype.as_qty = ()->
  new Qty(this)

Qty.prototype.as_qty = ()->
  this

class window.Element
  constructor: (name, preferred_unit, column_class = "unknown", lower_limit = null, upper_limit = null)->
    @name = name
    @preferred_unit = preferred_unit
    @column_class = column_class 
    @lower_limit = lower_limit 
    @upper_limit = upper_limit

  in_quantity: (desired_quantity)->
    new IngredientElement(this, desired_quantity.as_qty())

  toString: ()->
    "#{@name}"

class window.IngredientElement
  constructor: (element, quantity)->
    @element = element
    throw "Element parameter is not an element! It is a #{element.__proto__.constructor.name}. '#{element.toString()}'" if (element.__proto__.constructor != Element)
    @name = element.name
    @quantity = quantity.as_qty()

  contents: ()->
    [ this ]

  in_quantity: (desired_quantity)->
    throw "Incompatible quantities, element's: #{@quantity}, given: #{desired_quantity}" unless @quantity.isCompatible(desired_quantity)
    new IngredientElement(@element, desired_quantity.as_qty())

  mul: (scale)->
    scaled_quantity = @quantity.mul(scale)
    scaled_quantity = scaled_quantity.to(@quantity.units()) if scaled_quantity.isCompatible(@quantity)
    new IngredientElement @element, scaled_quantity

  in_scale: IngredientElement.prototype.mul

  div: (scale)->
    scaled_quantity = @quantity.div(scale)
    scaled_quantity = scaled_quantity.to(@quantity.units()) if scaled_quantity.isCompatible(@quantity)
    new IngredientElement @element, scaled_quantity

  add: (ingredient_element)->
    return this if (ingredient_element == null) or (ingredient_element == undefined)
    throw "Incompatible element to add. This is (#{@toString()}). Tried adding: (#{ingredient_element.toString()})" unless (ingredient_element.name == @name and ingredient_element.quantity.isCompatible(@quantity))
    new IngredientElement(@element, @quantity.add(ingredient_element.quantity))

  sub: (ingredient_element)->
    return this if (ingredient_element == null) or (ingredient_element == undefined)
    throw "Incompatible element to subtract. This is (#{@toString()}). Tried subtracting: (#{ingredient_element.toString()})" unless (ingredient_element.name == @name and ingredient_element.quantity.isCompatible(@quantity))
    new IngredientElement(@element, @quantity.sub(ingredient_element.quantity))

  totals: ()->
    _totals = new IngredientElements()
    _totals[@element.name] = this
    _totals

  toString: ()->
    "#{@element.toString()}:\t#{@quantity.toString()}"

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

  sub: (ingredient_elements)-> 
    rhs = ingredient_elements.totals()

    _sum = new IngredientElements()
    for k,v of this
      _sum[k] = v if (v.totals)
    for k,v of rhs
      if (_sum[k] and _sum[k].totals)
        _sum[k] = _sum[k].sub(v)
      else 
        _sum[k] = v.mul(new Qty("-1.0")) if (v.totals)

    _sum

  mul: (scale)->
    r = new IngredientElements()
    for k,v of this
      r[k] = v.mul(scale) if (v.mul)
    r

  div: (scale)->
    r = new IngredientElements()
    for k,v of this
      r[k] = v.div(scale) if (v.div)
    r

  filter_by: (other)->
    r = new IngredientElements()
    for k,rhs_v of other
      lhs_v = this[k]
      if (rhs_v.totals)
        if lhs_v and (lhs_v.totals)
          r[k] = lhs_v 
        else
          r[k] = rhs_v.mul(new Qty("0.0"))
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
    @quantity = quantity.as_qty()
    @serving_contents = serving_contents

  totals: ()->
    @contents().reduce ( (accumulator, i)-> accumulator.add(i) ), new IngredientElements()

  contents_in_scale: (scale)->
    @contents().map (content)-> content.in_scale(scale)

  ingredient_by_name: (name)->
    found = @serving_contents.filter((i)-> (i.name == name))
    throw "Couldn't find ingredient with name '#{name}'." if found.length <= 0
    throw "More than one ingredient with name '#{name}'." if found.length > 1
    found[0]

  contents: ()->
    @serving_contents

  remove: (ingredient)->
    @serving_contents = @serving_contents.filter (i) -> (i != ingredient)

  in_quantity: (desired_quantity)->
    throw "Incompatible quantities, ingredient's: #{@quantity}, given: #{desired_quantity}" unless @quantity.isCompatible(desired_quantity.as_qty())
    scale = desired_quantity.as_qty().div(@quantity)
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
  constructor: ($elements, name, sources, serving_quantity, serving_contents)->
    super(name, serving_quantity.as_qty(), serving_contents)
    @elements = $elements
    @sources = sources
    #@serving_contents = [ @best_price().as_ingredient(@elements).mul( serving_quantity.as_qty() ) ].concat(@serving_contents)
    @preferred_source = @best_price()

  contents: ()->
    [ @preferred_source.as_ingredient(@elements).mul( @quantity ) ].concat(@serving_contents)

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
    new ProductInQuantity(this, desired_quantity.as_qty())

  toString: ()->
    "#{@name}: Serving #{@quantity} contains:\n\t#{ @serving_contents.map( (i)-> i.toString() ).join("\n\t") }\n\tAvailable from:\n\t\t#{ @sources.map( (i)-> i.toString() ).join("\n\t\t") }"

class window.ProductInQuantity
  constructor: (product, desired_quantity)->
    throw "Incompatible quantities, product's: #{product.quantity}, given: #{desired_quantity}" unless product.quantity.isCompatible(desired_quantity)
    @product = product
    @name = @product.name
    @quantity = desired_quantity.as_qty()

  scale: () -> @quantity.div(@product.quantity)

  best_price: ()-> @product.best_price()

  quantity_for_period: (days)-> 
    @quantity.mul(days)

  packages_for_period_exact: (days)->
    @quantity_for_period(days).div(@product.preferred_source.quantity_in_package)

  packages_for_period: (days)->
    Math.ceil(@packages_for_period_exact(days).scalar)

  toString: ()->
    "#{@quantity.toString()} (#{scale()}x) serving of #{@product.name}"

  totals: ()->
    @product.totals().mul(@scale())

  in_scale: (scale)->
    new ProductInQuantity(@product, "#{scale * @scale()}")

  in_quantity: (desired_quantity)->
    new ProductInQuantity(@product, desired_quantity.as_qty())

class window.ProductSource
  constructor: (name, url, quantity_in_package, price)->
    @name = name
    @url = url
    @quantity_in_package = quantity_in_package
    @price = price

  as_ingredient: (elements)->
    new IngredientElement(elements.Price, @price)

  price_per_package: ()->
    @price.mul(@quantity_in_package).toString(2)

  toString: ()->
    "#{@name} for #{@price.toString(2)} / #{@price_per_package().toString(2)} per package"

  in_scale: (scale)->
    new ProductSource(@name, @url, @price * scale)
