require 'net/http'
require 'json'
require_relative 'nodeConstructor'
require_relative 'mygraph'

def findIdByFbId(fb_id, friend_list)
	friend_list.each do |friend|
		if friend["fb_id"].to_i == fb_id.to_i
			return friend["id"]
		end
	end
	warn "Friend not found"
	return nil
end


user_id = 116728622143539
atoken = "EAAFSJHyfRe8BAE9IVZBSToA1ONUC88WSX6e9JxU9e0C2l6aXnEPgReUKXtfJhqQKM21IFRbQJtNVxBGXvYfNntGHCi0owI7e0YwMZCGlEjhVZAVWXwpLZCTD9eSmDfX1tacSovTUP0sr9p3um8AtHBNS1XGLumbupmNXXjRZABcmFYk600ZCxj"
prefix = "https://graph.facebook.com/v2.8/"

friends = "/friends?access_token=#{atoken}&limit=999"


mutual_friends_query = "?fields=context.fields%28mutual_friends%29&access_token=#{atoken}&limit=999"

friendsUri = URI(prefix + user_id.to_s + friends)


friendsResp = Net::HTTP.get(friendsUri)

resp = JSON.parse(friendsResp)["data"]
nodeContructor = NodeConstructor.new
friends = []

#nodes<<nodeContructor.newNode(user_id, "Wololo")

resp.each do |friend|
	friends << nodeContructor.newNode(friend["id"], friend["name"])
end

graph = MyGraph.new(nodeContructor.getNodeCount)

friends.each do |friend|
	mutualUri = URI(prefix + friend["fb_id"] + mutual_friends_query)
	mutualResp = JSON.parse(Net::HTTP.get(mutualUri))
	mutual_friends = mutualResp["context"]["mutual_friends"]["data"]
	friend_id = findIdByFbId(friend["fb_id"],friends)
	if !mutual_friends.empty?
		mutual_friends.each do |mutual|
			mutual_id = findIdByFbId(mutual['id'], friends)
			if mutual_id != nil
				graph.setEdge(friend_id, mutual_id)
			end
		end
	else
		puts "No Mutual"
	end
end


hfairness = {}

for i in 1..graph.getOrder-1
	hfairness.store(friends[i], graph.getCloseness(i));
	haf = hfairness.sort_by(&:last).reverse
end

puts haf