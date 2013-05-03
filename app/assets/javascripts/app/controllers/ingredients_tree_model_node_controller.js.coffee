window.IngredientsTreeModelNodeController = ($scope, $http) ->

  $scope.deleteRow = (row)->
    console.log 'deleteRow', row
    row.parent_node.delete_child(row)
    true

  this