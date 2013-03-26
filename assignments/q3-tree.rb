class Tree
  attr_accessor :children, :node_name

  def initialize(tree)
    @children = []
    if tree.size == 1
      @node_name = tree.keys[0]
      tree[@node_name].each do |child, grandchildren|
        @children << Tree.new({ child => grandchildren })
      end
    end
  end

  def initializeAlternative(tree)
    @node_name = tree.keys.first
    if not @node_name.nil?
      root = tree[@node_name]
      @children = root.map {| key, value |
        Tree.new({ key => value})
      }
    else
      @children = []
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each {|c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
})

tree.visit_all {|node| p node.node_name}
