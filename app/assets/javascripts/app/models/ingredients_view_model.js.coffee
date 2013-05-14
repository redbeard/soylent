class window.IngredientsTreeTableNode
  constructor: (model, parent_node, ingredient, row_class)->
    @model = model
    @row_class = row_class
    @parent_node = parent_node
    @ingredient = ingredient

  children: ()->
    _t = this
    @_children ||= @ingredient.contents().map (i)-> new IngredientsTreeTableNode(_t.model, _t, i, "ingredient")

  delete_child: (child_node)->
    @ingredient.remove(child_node.ingredient)
    @_children = @_children.filter (ch)-> ch != child_node
    @refresh()

  refresh: ()->
    #@_children = null
    #@model._columns = null
    @_cached_totals = null

  total_for: (element_name)->
    @cached_totals()[element_name]

  template_for: (column)->
    column.template

  cached_totals: ()->
    @_cached_totals ||= @ingredient.totals()

class window.IngredientsTreeTableModel
  constructor: (recommendation, recipe, column_order_and_preferences)->
    @recommendation = recommendation
    @recipe = recipe
    @column_order_and_preferences = column_order_and_preferences

    @recommendation_node = new IngredientsTreeTableNode(this, null, @recommendation, 'no-quantity')
    @recipe_node = new IngredientsTreeTableNode(this, null, @recipe, 'no-quantity')

    @root_ingredient = new Ingredient("Root", new Qty("1 day"), [ @recommendation, @recipe ])

    @show = { major: true, minor: true, breakdown: false, ops: true, name: true, quantity: true, unknown: true }

  refresh: ()->
    @recipe_node.refresh()
    @_percent_difference = null

  template_for: (row, column)->
    column.template

  rows: ()->
    [ @recommendation_node, @recipe_node ].concat( @recipe_node.children() )

  percent_difference: ()->
    return @_percent_difference if @_percent_difference

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

        percent_difference[element_name] = new IngredientElement(element_name, percent_difference_for_element.to("percent"))

    @_percent_difference = percent_difference

  percent_difference_for: (column)->
    percent_difference_for = @percent_difference()[column.name]

  difference_class_for: (column)->
    percent_difference_for = @percent_difference_for(column)

    return "none" unless percent_difference_for
    need_less_or_more = "need_more" if percent_difference_for.quantity.scalar < 0
    need_less_or_more = "need_less" if percent_difference_for.quantity.scalar > 0

    return "#{need_less_or_more} good" if (Math.abs(percent_difference_for.quantity.scalar) <= 5.0)
    return "#{need_less_or_more} warning" if (Math.abs(percent_difference_for.quantity.scalar) <= 15.0)
    return "#{need_less_or_more} bad"

  columns: ()->
    return @_columns if @_columns

    operationsColumn = new IngredientsTreeTableColumn("Operations", '', 'ops-column-cell', { column_class: 'ops' })
    nameColumn = new IngredientsTreeTableColumn("Name", 'Name', 'name-column-cell',  { column_class: 'name' })
    quantityColumn = new IngredientsTreeTableColumn("Quantity", 'Qty', 'quantity-column-cell',  { column_class: 'quantity' })

    @_columns = [ operationsColumn, quantityColumn, nameColumn ];

    for name, preferences of @column_order_and_preferences
      @_columns.push new IngredientsTreeTableColumn(name, name, "element-column-cell", preferences)

    for element_name, ingredient_element of @recipe.totals()
      unless @column_order_and_preferences[element_name]
        @_columns.push(new IngredientsTreeTableColumn(element_name, element_name, "element-column-cell", { column_class: 'unknown', preferred_unit: ingredient_element.quantity })) if ingredient_element.quantity

    @_columns

class window.IngredientsTreeTableColumn
  constructor: (name, title, template, column_preferences)->
    @name = name
    @title = title
    @template = template
    @preferences = column_preferences

