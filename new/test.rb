require_relative 'lib/fbgraph'

FBGraph::setUserAccessToken('EAAFSJHyfRe8BAE7OoZCOOrqkKJWh9TC9epwlCUNCZAbILS9DdJAy6iY7Vyny9XbludxL0FUYa6vffTB7n8N5h2n3F6dUfhficoMK6tJEbMKqadjh1WaSdjPg57Adj4ZAOa9ZB3jZBinx3DH6fUgPx50GlyvYMCSZBXJkJ1V2i82urE4PDzMK75')

puts friends = FBGraph::getFriends(116728622143539)

f_id = friends["data"][0]['id']

#puts FBGraph::getMutualFriends(f_id)
