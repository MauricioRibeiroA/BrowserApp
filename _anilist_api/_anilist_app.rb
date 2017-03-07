require_relative '_anilist_module'
require 'sinatra'
require 'json'
require 'httparty'

set :views, settings.root + '/html'

get('/') do 
  @title = Anilist.anime_info(21)["title_romaji"]	
  @time = Anilist.anime_info(21)["airing"]["time"]
  @new_time = Time.parse(@time).strftime("%m/%d/%Y")

  erb :'_index'
  #  erb(:index, locals: { atividades: atividades })
end

