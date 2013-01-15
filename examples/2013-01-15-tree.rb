class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new("root", [
Tree.new('child_a'),
Tree.new('child_b'),
Tree.new('child_c', [
  Tree.new('child_d', [
    Tree.new('child_e')
  ]),
  Tree.new('child_f')
])

puts "visit single node"
tree.visit {|node| puts node.node_name}

puts "visit tree"
tree.visit_all {|node| puts node.node_name}