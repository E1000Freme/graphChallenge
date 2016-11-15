require 'net/http'
require 'json'
require_relative 'nodeConstructor'
require_relative 'mygraph'



user_id = 116728622143539

user_id2 = 131036157373897

prefix = "https://graph.facebook.com/v2.8/"

request = "/friends?access_token=EAAFSJHyfRe8BADtZCD2yC0XWUfEhL6LoYYAcyMs01oNueOu4iyg4B50AOTGAMZAsPnoCxSe0mqZBRU5eYE1BrohZCQgQqj70hWT6ycr8a0igBegQZAetQiVwhSyX8bjzerrmcj3JjGapYh1BIcdFgbnRFUZC77E1Sdf4oUkjYW7irI3VupZAffA&limit=999"


request2 = "?fields=context.fields%28mutual_friends%29&access_token=EAAFSJHyfRe8BADtZCD2yC0XWUfEhL6LoYYAcyMs01oNueOu4iyg4B50AOTGAMZAsPnoCxSe0mqZBRU5eYE1BrohZCQgQqj70hWT6ycr8a0igBegQZAetQiVwhSyX8bjzerrmcj3JjGapYh1BIcdFgbnRFUZC77E1Sdf4oUkjYW7irI3VupZAffA&limit=999"

uri = URI(prefix + user_id.to_s + request)
uri2 = URI(prefix + user_id2.to_s + request2)

jsonresponse = Net::HTTP.get(uri2)

puts jsonresponse

resp = JSON.parse(jsonresponse)["data"]

nodeContructor = NodeConstructor.new
nodes = []

nodes<<nodeContructor.newNode(user_id, "Wololo")

resp.each do |friend|
	nodes << nodeContructor.newNode(friend["id"], friend["name"])
end

graph = MyGraph.new(nodeContructor.getNodeCount)

for i in 0..5
	node1_id = nodes[0]["id"]
	node2_id = nodes[i]["id"]
	graph.setEdge(node1_id, node2_id)
end

print nodes

puts "_---_"

graph.printAdjTable