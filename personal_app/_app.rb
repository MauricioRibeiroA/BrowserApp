require 'sinatra'
require 'json'


#set :bind, '127.0.0.1'
#set :port, 4567
set :views, settings.root + '/html'

require 'data_mapper'

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
end

	