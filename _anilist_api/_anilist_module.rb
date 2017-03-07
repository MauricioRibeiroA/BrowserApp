require_relative '_get_token_app'
require 'httparty'

module Anilist
#create an array with the id of all my favourites so I can iterate inside the method
#make action buttons to call the methods

	def self.anime_airing(anime_id)
		response_airing = HTTParty.get("https://anilist.co/api/anime/#{anime_id}/airing?access_token=OevsUqiuGoe0JDaZMCXaALaY0XtECg0zKFm10hv2").to_a.last
	end

	def self.anime_info(anime_id)
		response_info = HTTParty.get("https://anilist.co/api/anime/#{anime_id}/?access_token=OevsUqiuGoe0JDaZMCXaALaY0XtECg0zKFm10hv2").to_hash
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



airing = Anilist.anime_info(21).select do |k, v|
	#if Anilist.anime_info(21).has_value?("currently airing") an option to iterate through all currently airing episodes
	if v == "currently airing"
	  p Anilist.anime_info(21)["title_romaji"]	
	  p Anilist.anime_info(21)["airing"]["time"]
	end
end





