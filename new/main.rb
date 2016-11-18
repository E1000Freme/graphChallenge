require_relative 'lib/mygraph'
require_relative 'lib/fbgraph'
require_relative 'lib/nodeConstructor'
require_relative 'fileController'
require_relative 'fbController'

inputOpt = nil
input = nil
while !input
	puts "Chose your input file: (0 - Provided input, 1 - smallinput, 2 - tinyinput, 3 - FB)"
	inputOpt = gets.chomp.to_i
	case inputOpt
		when 0
			input = "inputs/input"
		when 1
			input =  "inputs/smallinput"
		when 2
			input = "inputs/tinyinput"
		when 3
			input = "fb"
	end
end

unless input == "fb"
	graphData = FileController::parse(File.readlines(input))

	graph = MyGraph.new(graphData[:order], graphData[:adjList])
	puts graph.listByCloseness

else

	FBController::run


end