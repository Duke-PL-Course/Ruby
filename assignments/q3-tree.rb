class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = []
    if tree.size == 1
      @node_name = tree.keys[0]
      tree[@node_name].each do |child, grandchildren|
        @children << Tree.new({ child => grandchildren })
      end
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end
