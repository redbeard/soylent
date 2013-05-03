class window.IngredientsTreeTableNode
  constructor: (model, parent_node, ingredient)->
    @model = model
    @parent_node = parent_node
    @ingredient = ingredient

  children: ()->
    _t = this
    @_children ||= @ingredient.contents().map (i)-> new IngredientsTreeTableNode(_t.model, _t, i)

  delete_child: (child_node)->
    console.log "Will delete", child_node.ingredient, "from", @ingredient
    @ingredient.remove(child_node.ingredient)
    @_children = null
    @model._columns = null

  total_for: (element_name)->
    @ingredient.totals()[element_name]

class window.IngredientsTreeTableModel
  constructor: (recipe, preferred_units)->
    @recipe = recipe
    @preferred_units = preferred_units
    @root_node = new IngredientsTreeTableNode(this, null, @recipe)

  rows: ()->
    [ @root_node ].concat( @root_node.children() )

  columns: ()->
    return @_columns if @_columns
    operationsColumn = new IngredientsTreeTableColumn("Operations", '', 'ops-column-cell')
    nameColumn = new IngredientsTreeTableColumn("Name", 'Name', 'name-column-cell')
    quantityColumn = new IngredientsTreeTableColumn("Quantity", 'Qty', 'quantity-column-cell')

    _units = @preferred_units

    @_columns = [ operationsColumn, quantityColumn, nameColumn ].concat( 
        @recipe.unique_element_names().map (element_name)-> new IngredientsTreeTableColumn(element_name, element_name, 'element-column-cell')
      )
    @_columns

class window.IngredientsTreeTableColumn
  constructor: (name, title, template)->
    @name = name
    @title = title
    @template = template

