class window.IngredientElement
  constructor: (canonical_name, quantity)->
    @canonical_name = canonical_name
    @quantity = quantity

  elements: ()->
    [ this ]

class window.Ingredient
  constructor: (name, total_quantity_in_packaging, serving_quantity, serving_contents)->
    @name = name
    @total_quantity_in_packaging = total_quantity_in_packaging
    @serving_quantity = serving_quantity
    @serving_contents = serving_contents

  elements: ()->
    (@serving_contents.map (content)-> content.elements() ).reduce (lhs, rhs) -> lhs.concat(rhs)

