require 'httparty'
#don't run this doc all the time, try to avoid update the token before it reachs 60min
#write a method to autoexec after 59min

module CallTokenable

def self.update_token
response = HTTParty.post('https://anilist.co/api/auth/access_token?grant_type=client_credentials&client_id=mauribeiro-ps8tt&client_secret=QiUkcTJ3Ma9PdRcQC5LCw0sHE61p7').to_hash
@@token = response.values.first
p @@token

end
end




=begin
<form action='/atividades/<%= atividade.id %>' method='POST' class='pull-right'>
         <input type='hidden' name='_method' value='DELETE'/>
          <button type='submit' class='super-sport'>X</button>
=end




=begin 

<form action="/update_token" method="post">
  <button type="submit" >Get a new token</button>
</form>
=end