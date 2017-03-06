require 'sinatra'
require 'json'

#set :bind, '127.0.0.1'
#set :port, 4567
#set :views, settings.root + '/html'

require 'data_mapper'

DataMapper.setup(:default, 'sqlite:atividade.db')

class Atividade
  include DataMapper::Resource

  property :id, Serial
  property :descricao, Text, required: true
  property :created_at, Date
  property :updated_at, Date
  #has n, :orders, :constraint => :destroy  
end

DataMapper.finalize()
DataMapper.auto_upgrade!()

 #property :created_at, Date, :default => Time.now
  #property :updated_at, Date, :default => Time.now

