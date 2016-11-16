class MyGraph

	def initialize(order)

		@graph_adj_table = Array.new(order){ Array.new(order) {0}}
		@graph_order = order
	end

	##
	#Print a well formated Adjacent Table
	#
	def printAdjTable()

		@graph_adj_table.each do |line|
			line.each do |element|
				print element, " "
			end
			print "\n"
		end
	end

	##
	#Add an edge on Adjecent table for the give nodes
	#
	def setEdge(node1, node2)
		if(node1 == node2)
			warn "The nodes can'n be the same: setEdge(#{node1},#{node2})"
		else
			@graph_adj_table[node1][node2] = 1
		end

	end

	##
	#Remove the edge on Adjacent table for the given nodes
	#
	def removeEdge(node1, node2)
		if(node1 == node2)
			warn "The nodes can'n be the same: removeEdge(#{node1},#{node2})"
		else
			@graph_adj_table[node1][node2] = 0
		end

	end

	def isEdge(node1, node2)
		_isEdge = false
		if 	@graph_adj_table[node1][node2] == 1 ||
			@graph_adj_table[node2][node1] == 1
			_isEdge = true
		end
		return _isEdge
	end

	##
	#Return the smalest distence between two given nodes
	# Based on:https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
	# with some modifications
	#
	def dist(source,  target)

		if source == target
			#warn "Source and target is same node"
			return 0
		end

		#cheking node exixtence
		node_exists = false
		for i in 0..@graph_adj_table.size-1
			if @graph_adj_table[target][i] == 1 || @graph_adj_table[i][target] == 1
				node_exists = true;
				break;
			end
		end
		if !node_exists
			warn "Node #{target} doesn't exist on this graph: dist(#{source},#{target})"
			return nil
		end

		distance = 0
		node_path = [[source]]
		node_found = false;
		while !node_found && distance < @graph_order
			adjacents = []
			node_path[distance].each do |start|
				for adj_node in 1..@graph_order-1
					if isEdge(start, adj_node)
						adjacents << adj_node
						if adj_node == target
							node_found = true
						end
					end
				end
			end
			if !node_found
				distance += 1
				node_path<<adjacents
			end
		end
		if distance >= @graph_order
			warn "Path not Found for #{source}, #{target}"
		end
		return distance+1
	end

	def getFarness(node)
		farness = 0

		for i in 1..@graph_order-1
			farness+= dist(node, i)
		end
		return farness
	end

	def getCloseness(node)
		return 1.0/getFarness(node)
	end

	def getOrder()
		return @graph_order
	end
end