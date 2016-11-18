class FBController

	def self.run

		puts "UserId:"
		userID = gets.chomp
		puts "Access Token"
		aToken = gets.chomp
		FBGraph::setUserId(userID)
		FBGraph::setUserAccessToken(aToken)
		friends =  (FBGraph::getFriends)["data"]

		nConstructor = NodeConstructor.new
		friendNodes = nConstructor.newNodeList(friends)

		graph = MyGraph.new(nConstructor.getNodeCount)
		friends.each do |friend|
			friendID = nConstructor.nodeIdForData({:name=>'id', :value=>friend["id"]}, friendNodes)
			mFriends = FBGraph::getMutualFriends(friend["id"])['data']
			unless mFriends.empty?
				mFriends.each do |mFriend|
					mFriendID = nConstructor.nodeIdForData({:name=>'id', :value=>mFriend["id"]}, friendNodes)
					graph.setEdge(friendID, mFriendID)
				end
			end
		end

		print graph.listByCloseness(friendNodes)

	end



end