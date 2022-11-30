require 'uri'
require 'net/http'
require 'openssl'
require 'json'

Exercise.destroy_all

url = URI("https://exercisedb.p.rapidapi.com/exercises")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'cbd2cc8781msh965ef8f274c9a90p197ee1jsn8f68e546e7db'
request["X-RapidAPI-Host"] = 'exercisedb.p.rapidapi.com'

response = http.request(request)

exercises = JSON.parse(response.read_body)

exercises.first(10).each do |exercise|
  Exercise.create!(
    title: exercise["name"],
    equipment: exercise["equipment"],
    demonstration: exercise["gifUrl"],
    body_part: exercise["bodyPart"]
  )
end

# t.integer "duration"
# t.integer "rest_time"
# t.integer "repetitions"
# t.string "demonstration"
# t.string "title"
# t.string "equipment"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
