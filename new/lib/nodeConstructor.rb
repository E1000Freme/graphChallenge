
class NodeConstructor


	def initialize
		@nodeCount = 0
	end

	def newNode(data)

		_newNode = {
			"id" => @nodeCount,
			"data"=>data
		}
		@nodeCount+=1
		return _newNode
	end

	def newNodeList(dataset)
		nodelist = []
			dataset.each do |data|
				nodelist<<newNode(data)
			end
			return nodelist
	end

	def getNodeCount()
		return @nodeCount
	end

	def nodeIdForData(data, nodesList)
		name = data[:name]
		value = data[:value]
		return nodesList.select {|node| node['data'][name] == value}[0][name]
	end
end