require_relative '_anilist_module'
require_relative '_get_token_app'
require 'sinatra'
require 'json'
require 'httparty'

set :views, settings.root + '/html'


get('/') do 
  @titles = []
  @time = []
  @pics = []
  @@my_favourites_id.each do |id|
   if Anilist.anime_airing(id) != nil
     @titles << Anilist.anime_info(id)["title_romaji"]	
     @time << Anilist.anime_info(id)["airing"]["time"]
     @pics << Anilist.anime_info(id)["image_url_med"]	
      
 @new_hash_2 = Hash[@time.zip(@pics)]
     @new_hash = Hash[@titles.zip(@new_hash_2)]
   #@new_time << Time.parse(@time).strftime("%m/%d/%Y")
end
end

  erb:'_index'
 
end


post '/runMethod' do
  CallTokenable.update_token
redirect '/'
end