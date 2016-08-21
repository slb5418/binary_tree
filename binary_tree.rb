class BinaryTree

	def initialize(root = nil)
		@root = root
	end

	def build_tree(arr)
		arr.each do |data|
			if @root.nil?
				@root = Node.new(data)
			else
				add_node(Node.new(data), @root)
			end
		end
	end

	def add_node(node, current)
		if node.value < current.value
			if current.left.nil?
				current.left = node
				node.parent = current
			else
				add_node(node, current.left)
			end
		else
			if current.right.nil?
				current.right = node
				node.parent = current
			else
				add_node(node, current.right)
			end
		end
	end

	def breadth_first_search(data)
		queue = [@root]
		# queue.each do |node|
		until queue == []
			node = queue.shift
			return node if node.value == data
			queue << node.left if not node.left.nil?
			queue << node.right if not node.right.nil?
		end
		return nil
	end

	def depth_first_search(data)
		stack = [@root]
		until stack == []
			node = stack.pop
			return node if node.value == data
			stack << node.left if not node.left.nil?
			stack << node.right if not node.right.nil?
		end
		return nil
	end

	def dfs_rec(data, node = @root)
		return node if node.value == data
		if data < node.value
			dfs_rec(data, node.left) if not node.left.nil?
		else
			dfs_rec(data, node.right) if not node.right.nil?
		end
	end

	def print_tree(node = @root)
		node.parent.nil? ? parent = "None" : parent = node.parent.value
		node.left.nil? ? left = "None" : left = node.left.value
		node.right.nil? ? right = "None" : right = node.right.value
		puts left.to_s.ljust(4)+" "*4+node.value.to_s.ljust(4)+" "*4+right.to_s.ljust(4)
		print_tree(node.left) if not node.left.nil?
		print_tree(node.right) if not node.right.nil?
	end

	def print_node(node)
		return nil if node.nil?
		node.parent.nil? ? parent = "None" : parent = node.parent.value
		node.left.nil? ? left = "None" : left = node.left.value
		node.right.nil? ? right = "None" : right = node.right.value
		puts "Left    Data    Right"
		puts left.to_s.ljust(4)+" "*4+node.value.to_s.ljust(4)+" "*4+right.to_s.ljust(4)
	end

	class Node
		attr_accessor :value, :parent, :left, :right

		def initialize(value = nil, parent = nil, left = nil, right = nil)
			@value = value
			@parent = parent
			@left = left
			@right = right
		end
	end
end


tree = BinaryTree.new()
tree.build_tree([1,3,0,-1,-2,5,2,4])
# puts "Left    Data    Right"
# tree.print_tree
tree.print_node(tree.breadth_first_search(1))
tree.print_node(tree.breadth_first_search(0))
tree.print_node(tree.breadth_first_search(5))

tree.print_node(tree.breadth_first_search(654))

tree.print_node(tree.dfs_rec(1))
tree.print_node(tree.dfs_rec(0))
tree.print_node(tree.dfs_rec(5))
tree.print_node(tree.breadth_first_search(3645))


tree.print_node(tree.depth_first_search(1))
tree.print_node(tree.depth_first_search(0))
tree.print_node(tree.depth_first_search(5))

tree.print_node(tree.breadth_first_search(3465))
