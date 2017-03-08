require_relative '_anilist_module'
require 'sinatra'
require 'json'
require 'httparty'

set :views, settings.root + '/html'


get('/') do 
  @titles = []
  @time = []
  @@my_favourites_id.each do |id|
   if Anilist.anime_airing(id) != nil
     @titles << Anilist.anime_info(id)["title_romaji"]	
     @time << Anilist.anime_info(id)["airing"]["time"]
     @new_hash = Hash[@titles.zip(@time)]
   #@new_time << Time.parse(@time).strftime("%m/%d/%Y")
end
end

  erb:'_index'
 
end


