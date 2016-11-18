
class NodeConstructor


	def initialize
		@nodeCount = 0
	end

	def newNode(fb_id, fb_name)

		_newNode = {
			"id" => @nodeCount,
			"fb_id" => fb_id,
			"fb_name" => fb_name
		}
		@nodeCount+=1
		return _newNode
	end

	def getNodeCount()
		return @nodeCount
	end
end