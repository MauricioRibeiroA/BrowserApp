require 'httparty'
#don't run this doc all the time, try to avoid update the token before it reachs 60min
#write a method to autoexec after 59min
response = HTTParty.post('https://anilist.co/api/auth/access_token?grant_type=client_credentials&client_id=mauribeiro-ps8tt&client_secret=QiUkcTJ3Ma9PdRcQC5LCw0sHE61p7').to_hash


$token = response.values.first


