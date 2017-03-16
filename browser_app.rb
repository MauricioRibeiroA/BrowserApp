
require_relative '_anilist_module'
require 'sinatra'
require 'json'
require 'httparty'
require 'data_mapper'

set :views, settings.root + '/html'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.setup(:default, 'sqlite:atividade.db')

class Atividade
  include DataMapper::Resource

  property :id, Serial
  property :descricao, Text, required: true
  property :created_at, Date
  property :updated_at, Date
end

DataMapper.finalize()
DataMapper.auto_upgrade!()

get('/') do
  erb :'_main_page'
end

get('/anime') do
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
  erb :'_index'
end

get('/agenda') do
  @name = 'Mauricio'
  @atividades = Atividade.all
  erb :'index'
end

# render the activity form
get('/atividades/create') do
  erb(:create_atividade)
end

# create a new activity
post('/atividades') do
  new_activity = Atividade.new
  new_activity.descricao = params[:descricao]
  new_activity.save
  redirect('/agenda')
end

# render the activity
get('/atividades/:id/edit') do
  @activity = Atividade.get(params[:id])
  erb(:edit_atividade)
end

put('/atividades/:id') do
  atividade = Atividade.get(params[:id])
  atividade.descricao = params[:descricao]
  atividade.save
  redirect('/agenda')
end

# delete activity
delete('/atividades/:id') do
  Atividade.get(params[:id]).destroy
  redirect('/agenda')
end
