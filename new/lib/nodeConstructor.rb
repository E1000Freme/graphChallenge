
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

	def getNodeCount()
		return @nodeCount
	end
end