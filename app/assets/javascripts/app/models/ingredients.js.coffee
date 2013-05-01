class window.IngredientElement
  constructor: (canonical_name, quantity)->
    @canonical_name = canonical_name
    @quantity = quantity

  elements: ()->
    [ this ]

  contents: ()->
    @elements()

  in_quantity: (desired_quantity)->
    throw "Incompatible quantities, element's: #{@quantity}, given: #{desired_quantity}" unless @quantity.isCompatible(desired_quantity)
    new IngredientElement(@canonical_name, desired_quantity)

  in_scale: (scale)->
    new IngredientElement(@canonical_name, @quantity.mul(scale))

  toString: ()->
    "#{@canonical_name}:\t#{@quantity.toString()}"

class window.Ingredient
  constructor: (name, serving_quantity, serving_contents)->
    @name = name
    @serving_quantity = serving_quantity
    @serving_contents = serving_contents

  elements: ()->
    ( @contents().map (content)-> content.elements() ).reduce (lhs, rhs) -> lhs.concat(rhs)

  contents_in_scale: (scale)->
    @contents().map (content)-> content.in_scale(scale)

  contents: ()->
    @serving_contents

  in_quantity: (desired_quantity)->
    throw "Incompatible quantities, ingredient's: #{@serving_quantity}, given: #{desired_quantity}" unless @serving_quantity.isCompatible(desired_quantity)
    scale = desired_quantity.div(@serving_quantity)
    @in_scale(scale)

  in_scale: (scale)->
    new Ingredient(@name, @serving_quantity.mul(scale), @contents_in_scale(scale))

  toString: ()->
    "#{@name}: Serving #{@serving_quantity} contains:\n\t#{ @serving_contents.map( (i)-> i.toString() ).join("\n\t") }"

class window.Product extends Ingredient
  constructor: (name, quantity_in_package, sources, serving_quantity, serving_contents)->
    super(name, serving_quantity, serving_contents)
    @quantity_in_package = quantity_in_package
    @sources = sources

  in_scale: (scale)->
    new ProductInScale(this, scale)

  in_quantity: (desired_quantity)->
    new ProductInQuantity(this, desired_quantity)

  toString: ()->
    "#{@name}: Package has: #{@quantity_in_package}. Serving #{@serving_quantity} contains:\n\t#{ @serving_contents.map( (i)-> i.toString() ).join("\n\t") }\n\tAvailable from:\n\t\t#{ @sources.map( (i)-> i.toString() ).join("\n\t\t") }"

class window.ProductInScale
  constructor: (product, scale)->
    @product = product
    @scale = scale

  toString: ()->
    "#{@scale} serving(s) of #{@product.name}"

  contents: ()->
    [ Ingredient.prototype.in_scale.apply(@product, [ @scale ]) ]

  elements: ()->
    ( @contents().map (content)-> content.elements() ).reduce (lhs, rhs) -> lhs.concat(rhs)

  in_scale: (scale)->
    new ProductInScale(@product, scale * @scale)

  in_quantity: (desired_quantity)->
    new ProductInQuantity(@product, desired_quantity)    

class window.ProductInQuantity extends ProductInScale
  constructor: (product, desired_quantity)->
    throw "Incompatible quantities, product's: #{product.serving_quantity}, given: #{desired_quantity}" unless product.serving_quantity.isCompatible(desired_quantity)
    super product, desired_quantity.div(product.serving_quantity)
    @desired_quantity = desired_quantity

  toString: ()->
    "#{@desired_quantity.toString()} (#{@scale}x) serving of #{@product.name}"

class window.ProductSource
  constructor: (name, url, price)->
    @name = name
    @url = url
    @price = price

  toString: ()->
    "#{@name} #{@url} for #{@price.toString()} per package"

  in_scale: (scale)->
    new ProductSource(@name, @url, price * scale)
