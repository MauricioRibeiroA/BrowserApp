require_relative '_get_token_app'
require 'httparty'

module Anilist
#create an array with the id of all my favourites so I can iterate inside the method
#make action buttons to call the methods

	def self.anime_airing(anime_id)
		response_airing = HTTParty.get("https://anilist.co/api/anime/#{anime_id}/airing?access_token=tRo0fqha1g1zV0RK94YRzBA9hFqdYAQyrlAX6Y77").to_a
	end

	def self.anime_info(anime_id)
		response_info = HTTParty.get("https://anilist.co/api/anime/#{anime_id}/?access_token=tRo0fqha1g1zV0RK94YRzBA9hFqdYAQyrlAX6Y77").to_hash
	end

	def self.anime_info_and_airing
	  Anilist.anime_info(21).each do |k, v|
	    if v == "currently airing"
	      title = Anilist.anime_info(21)["title_romaji"]	
	      time = Anilist.anime_info(21)["airing"]["time"]
	      end
        end
	end


end
my_favourites_id = [1, 21]
airing = []

=begin
my_favourites_id.each do |id|
	if Anilist.anime_airing(id) == nil
		p "Status: not airing"
	else
		p Anilist.anime_airing(id)
end
end
=end







