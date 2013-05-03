class window.IngredientsTreeTableNode
  constructor: (recipe, parent_node, ingredient)->
    @recipe = recipe
    @parent_node = parent_node
    @ingredient = ingredient

  children: ()->
    _t = this
    @_children ||= @ingredient.contents().map (i)-> new IngredientsTreeTableNode(@recipe, _t, i)

  total_for: (element_name)->
    @ingredient.totals()[element_name]

class window.IngredientsTreeTableModel
  constructor: (recipe, preferred_units)->
    @recipe = recipe
    @preferred_units = preferred_units
    @root_node = new IngredientsTreeTableNode(@recipe, null, @recipe)

  rows: ()->
    [ @root_node ].concat( @root_node.children() )

  columns: ()->
    return @_columns if @_columns
    nameColumn = new IngredientsTreeTableColumn("Name", 'name-column-cell')

    quantityColumn = new IngredientsTreeTableColumn("Qty", 'quantity-column-cell')

    _units = @preferred_units

    @_columns = [ quantityColumn, nameColumn ].concat( 
        @recipe.unique_element_names().map (element_name)-> new IngredientsTreeTableColumn(element_name, 'element-column-cell')
      )
    @_columns

class window.IngredientsTreeTableColumn
  constructor: (name, template)->
    @name = name
    @template = template

