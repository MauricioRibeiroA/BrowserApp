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
  <form method="post" action="/runMethod">
      <input class='btn btn-primary' type='submit' value='Update Token'>
    </form>
=end
