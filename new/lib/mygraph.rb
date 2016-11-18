class MyGraph

	def initialize(order, adjList = nil)

		@graph_adj_table = Array.new(order){ Array.new(order) {0}}
		@graph_order = order

		unless adjList.nil?
			adjList.each do |edges|
				node1 = edges[0]
				edges[1].each do |node2|
					setEdge(node1, node2)
				end
			end
		end
	end

	##
	#Print a well formated Adjacent Table
	#
	def printAdjMatrix()

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
	# Based on:https://en.wikipedia.org/wiki/Best-first_search
	#
	def dist(source,  target)

		node_q = [source]
		distance = 0

		return 0 if !node?(source)

		loop do
			if node_q.include?(target)
				return distance
			else
				distance+=1
			end
			current_node = node_q.shift
			if current_node == nil || distance >@graph_order
				return 0
			end
			neighbours = (0..@graph_adj_table.size-1).to_a.select do |i|
				@graph_adj_table[current_node][i] == 1 ||
				@graph_adj_table[i][current_node] == 1
			end
			node_q = neighbours + node_q

		end

	end

	def node?(node)

		return @graph_adj_table[node].include?(1) ||
		 @graph_adj_table.map{|row| row[node]}.include?(1)

	end

	def getFarness(node)
		farness = 0

		for i in 1..@graph_order-1
			farness+= dist(node, i)
		end
		return farness
	end

	def getCloseness(node)
		farness = getFarness(node)
		return 1.0/farness if farness>0
		return 0
	end

	def listByCloseness(dataArray = nil)
		list = {}
		dataArray = [*1..@graph_order] if dataArray.nil?

		for i in 1..@graph_order-1
			list.store(dataArray[i], getCloseness(i))
		end
			list = list.sort_by(&:last).reverse

		return list

	end

	def getOrder()
		return @graph_order
	end



end