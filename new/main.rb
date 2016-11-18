require_relative 'lib/mygraph'
require_relative 'lib/fbgraph'
require_relative 'lib/nodeConstructor'
require_relative 'fileController'

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
	abort
else
	puts "UserId:"
	userID = gets.chomp
	puts "Access Token"
	aToken = gets.chomp
	FBGraph::setUserId(userID)
	FBGraph::setUserAccessToken(aToken)
	friends =  (FBGraph::getFriends)["data"]

	nConstructor = NodeConstructor.new
	friendNodes = []
	friends.each do |friend|
		friendNodes<<nConstructor.newNode(friend)
	end

	friends.each do |friend|
		puts FBGraph::getMutualFriends(friend["id"])
	end

	abort
end

afairness = {}

for i in 1..graph.getOrder-1
	afairness.store(i, graph.getCloseness(i));
	haf = afairness.sort_by(&:last).reverse
end

puts haf