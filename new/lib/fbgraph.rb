require 'net/http'
require 'json'
#require_relative 'fbgraph/fbsetup'
class FBGraph

	@@appId = nil
	@@userId = nil
	@@appSecret = nil
	@@apiPrefix = "https://graph.facebook.com/v2.8/"
	@@userAccessToken = nil

	def self.setAppId(apiID)
		@@appId = apiID
	end

	def self.getAppId()
		return @@appId
	end

	def self.setAppSecret(appSecret)
		@@appSecret = appSecret
	end

	def self.getAppSecret(appSecret)
		@@appSecret = appSecret
	end

	def self.setUserId(userId)
		@@userId = userId
	end

	def self.getUserId(userId)
		@@userId = userId
	end

	def self.setUserAccessToken(userAccessToken)
		@@userAccessToken = userAccessToken
	end

	def self.getUserAccessToken(userAccessToken)
		@@userAccessToken = userAccessToken
	end

	def self.getFriends()
		api_call = "#{@@userId}/friends"
		raise "User Access Token not set" if @@userAccessToken.nil?
		raise "User Id not set" if @@userId.nil?
		params = {
			:access_token => @@userAccessToken,
			:limit => 999
		}

		uri = URI(@@apiPrefix + api_call)
		uri.query = URI.encode_www_form(params)

		resp = Net::HTTP.get_response(uri)

		return JSON.parse(resp.body) if resp.is_a?(Net::HTTPSuccess)
	end

	def self.getMutualFriends(user_id)
		api_call = "#{user_id}"
		params = {
			:fields => 'context.fields(mutual_friends)',
			:access_token => @@userAccessToken,
			:limit => 999
		}

		uri = URI(@@apiPrefix + api_call)
		uri.query = URI.encode_www_form(params)

		resp = Net::HTTP.get_response(uri)

		return JSON.parse(resp.body)["context"]["mutual_friends"] if resp.is_a?(Net::HTTPSuccess)

	end

end