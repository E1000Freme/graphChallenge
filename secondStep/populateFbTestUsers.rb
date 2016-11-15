require 'net/http'
require 'json'

uri = URI("https://graph.facebook.com/v2.8/371791639823855/accounts/test-users")
params = {
	:access_token=>"371791639823855|n8JjcYgrCAvgNQW5zmffU3uRaH4",
	:installed=>true,
	:permissions=>"read_stream, public_profile, user_friends"
	}

#uri.query = URI.encode_www_form(params)

testUsers = []
for i in 1..2
	response = Net::HTTP.post_form(uri, params)
	print response, "\n\n\n"
	testUsers<<JSON.parse(response.body)
end

for i in 0..testUsers.size-2
	id1 = testUsers[i]["id"]
	id2 = testUsers[i+1]["id"]
	uri2 = URI("https://graph.facebook.com/v2.8/#{id1}/friends/#{id2}")
	uri3 = URI("https://graph.facebook.com/v2.8/#{id2}/friends/#{id1}")

	puts Net::HTTP.post_form(uri2, {:access_token=>"371791639823855|n8JjcYgrCAvgNQW5zmffU3uRaH4"}).body
	puts Net::HTTP.post_form(uri3, {:access_token=>"371791639823855|n8JjcYgrCAvgNQW5zmffU3uRaH4"}).body


end
print testUsers