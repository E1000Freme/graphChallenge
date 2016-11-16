require_relative 'mygraph.rb'

inputOpt = nil
input = nil
while !input
	puts "Chose your input file: (0 - Provided input, 1 - smallinput, 2 - tinyinput)"
	inputOpt = gets.chomp.to_i
	case inputOpt
		when 0
			input = "input"
		when 1
			input =  "smallinput"
		when 2
			input = "tinyinput"
	end
end

input = File.readlines(input)

graph_raw = {}
higher_node = 0;
##
#Parsing input file
#
input.each do |edge|

	edge_pair = edge.split(" ").map(&:to_i)

	if !graph_raw.has_key?(edge_pair[0])
		graph_raw[edge_pair[0]] = [edge_pair[1]]
	else
		graph_raw[edge_pair[0]] << edge_pair[1]
	end

	if higher_node < edge_pair[0]
		higher_node = edge_pair[0]
	end
	if higher_node < edge_pair[1]
		higher_node = edge_pair[1]
	end

end

graph = MyGraph.new(higher_node+1);

graph_raw.each do |edges|
	node1 = edges[0]
	edges[1].each do |node2|
		graph.setEdge(node1, node2)
	end
end

afairness = {}

for i in 1..graph.getOrder-1
	afairness.store(i, graph.getCloseness(i));
	haf = afairness.sort_by(&:last).reverse
end

puts haf