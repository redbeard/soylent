class window.IngredientsTreeTableNode
  constructor: (model, parent_node, ingredient, row_class)->
    @model = model
    @row_class = row_class
    @parent_node = parent_node
    @ingredient = ingredient

  children: ()->
    _t = this
    @_children ||= @ingredient.contents().map (i)-> _t.create_child_for(i)

  create_child_for: (ingredient)->
    new IngredientsTreeTableNode(@model, this, ingredient, "ingredient")

  add_child_ingredient: (ingredient)->
    @ingredient.serving_contents.push ingredient
    @children().push @create_child_for(ingredient)

  delete_child: (child_node)->
    @ingredient.remove(child_node.ingredient)
    @_children = @_children.filter (ch)-> ch != child_node
    @model.refresh()

  total_for: (element_name)->
    @cached_totals()[element_name]

  template_for: (column)->
    column.template

  cached_totals: ()->
    cache_view_model_value(@model, this, "_cached_totals", () -> @ingredient.totals())

window.cache_view_model_value = (root_model, self, cache_key, value_func)->
    cached = self[cache_key]
    if (!cached or cached.revision < root_model.revision)
      self[cache_key] = cached = { revision: root_model.revision, value: value_func.apply(self) }
    cached.value

class window.IngredientsTreeTableModel
  constructor: ($elements, recommendation, recipe, column_order_and_preferences)->
    @recommendation = recommendation
    @recipe = recipe
    @elements = $elements

    @recommendation_node = new IngredientsTreeTableNode(this, null, @recommendation, 'no-quantity')
    @recipe_node = new IngredientsTreeTableNode(this, null, @recipe, 'no-quantity')

    @show = { macro: true, major: true, minor: true, breakdown: false, ops: true, name: true, quantity: true, unknown: true }

    @revision = 0

  refresh: ()->
    @revision = @revision + 1

  add_product: (product_to_add)->
    @recipe_node.add_child_ingredient( product_to_add.in_quantity( product_to_add.quantity ) )
    @refresh()

  template_for: (row, column)->
    if (row == @recommendation_node) && (column.preferences.column_class == 'macro')
      return "macronutrient-column-cell"
    column.template

  rows: ()->
    [ @recommendation_node, @recipe_node ].concat( @recipe_node.children() )

  percent_difference: ()->
    cache_view_model_value(this, this, "_percent_difference", ()->
      recommended_totals = @recommendation_node.cached_totals()
      recipe_totals = @recipe_node.cached_totals().filter_by(recommended_totals)

      difference = recipe_totals.sub(recommended_totals)
      percent_difference = new IngredientElements()
      for element_name, difference_for_element of difference
        if (difference_for_element.quantity) 
          recommended_for_element = recommended_totals[element_name]

          percent_difference_for_element = new Qty("1.0")
          if (difference_for_element.quantity)
            if (difference_for_element.quantity.scalar == 0.0)
              percent_difference_for_element = new Qty("0.0")
            else unless (recommended_for_element.quantity.scalar == 0.0)
              percent_difference_for_element = difference_for_element.quantity.div(recommended_for_element.quantity) 

          percent_difference[element_name] = new IngredientElement(@elements[element_name], percent_difference_for_element.to("percent"))

      percent_difference
    )

  percent_difference_for: (column)->
    percent_difference_for = @percent_difference()[column.name]

  difference_class_for: (column)->
    percent_difference_for = @percent_difference_for(column)

    return "none" unless percent_difference_for

    scalar = percent_difference_for.quantity.scalar
    scalar_s = scalar.toPrecision(2)

    need_more = scalar < 0
    need_less = scalar > 0


    return "#{scalar_s} good" if (Math.abs(scalar) <= 5.0)

    return "#{scalar_s} bad" if (scalar <= -15.0)
    return "#{scalar_s} warning" if (scalar <= -10.0)

    return "#{scalar_s} bad" if (scalar > 2000.0)
    return "#{scalar_s} warning" if (scalar > 20.0)

    return "#{scalar_s} good"

  columns: ()->
    return @_columns if @_columns

    operationsColumn = new IngredientsTreeTableColumn("Operations", '', 'ops-column-cell', { column_class: 'ops' })
    nameColumn = new IngredientsTreeTableColumn("Name", 'Name', 'name-column-cell',  { column_class: 'name' })
    quantityColumn = new IngredientsTreeTableColumn("Quantity", 'Qty', 'quantity-column-cell',  { column_class: 'quantity' })

    @_columns = [ operationsColumn, quantityColumn, nameColumn ];

    for name, preferences of @elements
      @_columns.push new IngredientsTreeTableColumn(name, name, "element-column-cell", preferences)

    @_columns

class window.IngredientsTreeTableColumn
  constructor: (name, title, template, column_preferences)->
    @name = name
    @title = title
    @template = template
    @preferences = column_preferences

