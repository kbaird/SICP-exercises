###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.30 - square-tree
###

squareTree = (tree) ->
  sq = (subTree) ->
    if subTree.length > 1 then squareTree(subTree) else subTree * subTree
  sq(x) for x in tree

t1 = [1, [2, [3, 4], 5], [6, 7]]

console.log squareTree(t1)
