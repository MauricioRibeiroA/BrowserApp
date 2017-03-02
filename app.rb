require 'rubygems'
require 'sinatra'

#Para iniciar com o servidor atraves do Rack - utilizar o gancho com o config.ru e 
#digitar rackup no terminal para pegar a porta.

#Para iniciar atraves do Sinatra - rodar o arquivo do ruby com o root no terminal e pegar
# a porta.

#Fazer interface com o Anilist

class HiSinatra < Sinatra::Base
  get "/" do
	@name = "Mauricio"
	"Hello, " + @name
  end

  get "/:user_code" do 
  	"Hi, don't forget your password #{params[:user_code]}"
  end
end


