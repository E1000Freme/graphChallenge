class FileController

def self.parse(input)

	graphAdjList = {}
	higher_node = 0;
	input.each do |edge|

		edge_pair = edge.split(" ").map(&:to_i)

		if !graphAdjList.has_key?(edge_pair[0])
			graphAdjList[edge_pair[0]] = [edge_pair[1]]
		else
			graphAdjList[edge_pair[0]] << edge_pair[1]
		end

		if higher_node < edge_pair[0]
			higher_node = edge_pair[0]
		end
		if higher_node < edge_pair[1]
			higher_node = edge_pair[1]
		end
	end
	return {:adjList => graphAdjList, :order =>higher_node+1}
end

end