require 'sinatra'
require 'json'


#set :bind, '127.0.0.1'
#set :port, 4567
set :views, settings.root + '/html'

require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.setup(:default, 'sqlite:atividade.db')

class Atividade
  include DataMapper::Resource

  property :id, Serial
  property :descricao, Text, required: true
  #property :user_name, Text, required: true
  #property :status, Boolean
  property :created_at, Date
  property :updated_at, Date
  #belongs_to :user

  
end

=begin 
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text, required: true
  property :atividade_id, Integer, required: true
  has n, :atividades, :constraint => :destroy    
end
=end 


DataMapper.finalize()
DataMapper.auto_upgrade!()

# application root
get('/') do
	#use later for the authentication
  @name = 'Mauricio'
  @atividades = Atividade.all
  erb :'index'
  #  erb(:index, locals: { atividades: atividades })
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
  redirect('/')
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
  redirect('/')
end

# delete activity
delete('/atividades/:id') do
  Atividade.get(params[:id]).destroy
  redirect('/')
end