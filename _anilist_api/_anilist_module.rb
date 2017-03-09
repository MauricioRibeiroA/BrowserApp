require_relative '_get_token_app'
require 'httparty'
require 'json'



module Anilist
#create an array with the id of all my favourites so I can iterate inside the method
#make action buttons to call the methods

	def self.anime_airing(anime_id)
		response_airing = HTTParty.get("https://anilist.co/api/anime/#{anime_id}/airing?access_token=p8mNaENGEyah59ypG5l5xc8v9MApilvb9YaRX6z6
").to_a.last
	end

	def self.anime_info(anime_id)
		response_info = HTTParty.get("https://anilist.co/api/anime/#{anime_id}/?access_token=p8mNaENGEyah59ypG5l5xc8v9MApilvb9YaRX6z6
").to_hash
	end

	def self.anime_info_and_airing(id)
	  Anilist.anime_info(id).each do |k, v|
	    if v == "currently airing"
	      p Anilist.anime_info(id)["title_romaji"]	
	      p Anilist.anime_info(id)["airing"]["time"]
	      end
        end
	end

	#def self.update_manually_favourite_anime(id)
      #@@my_favourites_id = []
      #@@my_favourites_id << id
    #end
	
end




#import from my profile on the website
@@my_favourites_id = [1, 21, 16498, 1735, 21744]


=begin
my_favourites_id.each do |id|
	if Anilist.anime_airing(id) == nil
		p "Status: not airing"
	else
		p Anilist.anime_airing(id)
end
end
=end

=begin 
my_favourites_id.each do |id|
	if Anilist.anime_airing(id) == nil
		p "Status: not airing"
	else
Anilist.anime_info_and_airing(id)
end
end
=end
