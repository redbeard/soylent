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
    console.log "Will delete", child_node.ingredient, "from", @ingredient
    @ingredient.remove(child_node.ingredient)
    @refresh()

  refresh: ()->
    @_children = null
    @model._columns = null

  total_for: (element_name)->
    @ingredient.totals()[element_name]

class window.IngredientsTreeTableModel
  constructor: (recommendation, recipe, column_order_and_preferences)->
    @recommendation = recommendation
    @recipe = recipe
    @column_order_and_preferences = column_order_and_preferences

    @recommendation_node = new IngredientsTreeTableNode(this, null, @recommendation, 'no-quantity')
    @recipe_node = new IngredientsTreeTableNode(this, null, @recipe, 'no-quantity')

    @root_ingredient = new Ingredient("Root", new Qty("1 day"), [ @recommendation, @recipe ])

    @show = { major: true, minor: true, breakdown: false, ops: true, name: true, quantity: true }

  refresh: ()->
    @recipe_node.refresh()

  rows: ()->
    [ @recommendation_node, @recipe_node ].concat( @recipe_node.children() )

  columns: ()->
    return @_columns if @_columns

    operationsColumn = new IngredientsTreeTableColumn("Operations", '', 'ops-column-cell', { column_class: 'ops' })
    nameColumn = new IngredientsTreeTableColumn("Name", 'Name', 'name-column-cell',  { column_class: 'name' })
    quantityColumn = new IngredientsTreeTableColumn("Quantity", 'Qty', 'quantity-column-cell',  { column_class: 'quantity' })

    @_columns = [ operationsColumn, quantityColumn, nameColumn ];

    for name, preferences of @column_order_and_preferences
      @_columns.push new IngredientsTreeTableColumn(name, name, "element-column-cell", preferences)

    @_columns

class window.IngredientsTreeTableColumn
  constructor: (name, title, template, column_preferences)->
    @name = name
    @title = title
    @template = template
    @preferences = column_preferences

