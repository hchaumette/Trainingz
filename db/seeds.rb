require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require "open-uri"


puts "Destroy all"
puts "workout exercise"
WorkoutExercise.destroy_all
puts "exercise"
Exercise.destroy_all
puts "round"
Round.destroy_all
puts"user workout"
UserWorkout.destroy_all
puts "workout"
Workout.destroy_all
Coaching.destroy_all
Notification.destroy_all
puts "user"
Coaching.destroy_all
Notification.destroy_all
User.destroy_all
puts "Done"


url = URI("https://exercisedb.p.rapidapi.com/exercises")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = ENV["API_SPORT"]
request["X-RapidAPI-Host"] = 'exercisedb.p.rapidapi.com'

response = http.request(request)

exercises = JSON.parse(response.read_body)

puts "Create 9 Exercises"


exercises.first(9).each do |exercise|
  Exercise.create!(
    title: exercise["name"],
    equipment: exercise["equipment"],
    demonstration: exercise["gifUrl"],
    body_part: exercise["bodyPart"]
  )
end

puts "Done"
puts "Create 4 users"
user1 = User.create(email: "jean@wagon.org", password: "password", name: "Joe", avatar: "https://i.pinimg.com/474x/0b/39/16/0b3916c82c77b7e6530b1988ecdf4667.jpg")
user2 = User.create(email: "julien@wagon.org", password: "password", name: "Eve", avatar: "https://i.pinimg.com/474x/65/58/16/655816a097d496fcfc1d0ff551df1679.jpg")
user3 = User.create(email: "etienne@mail.com", password: "password", coach: true, name: "théo", avatar: "https://i.pinimg.com/474x/45/32/12/45321286c4f7c76b8b5c24fffaac9b0b.jpg")
user4 = User.create!(email: "hugo@mail.com", password: "000000", name: "hugo", coach: true, avatar: "https://i.pinimg.com/474x/00/1c/aa/001caaa4daa43764dcfb61b804cc918d.jpg")
User.create(email: "frederic@gmal.fr", password: "password", name: "Bili", avatar: "https://i.pinimg.com/474x/d4/57/ca/d457ca828a03d20c8a722992634d70a4.jpg")
puts "Done"



puts "Create 4 workouts"

file1 = URI.open("https://i.pinimg.com/474x/9d/86/7f/9d867ffb3125f6fa980c714b31a6210a.jpg")
workout1 = Workout.new(title: "Peter's prep", user: user4)
workout1.photo.attach(io: file1, filename: "workout.png", content_type: "image/png")
workout1.save

file2 = URI.open("https://i.pinimg.com/474x/3c/89/fc/3c89fc84c8d22c6c6243ee548160e4e6.jpg")
workout2 = Workout.new(title: "running", user: user4)
workout2.photo.attach(io: file2, filename: "workout.png", content_type: "image/png")
workout2.save

file3 = URI.open("https://i.pinimg.com/474x/d9/bf/63/d9bf63ce7049903d00cc516d39b91639.jpg")
workout3 = Workout.new(title: "Gym", user: user4)
workout3.photo.attach(io: file3, filename: "workout.png", content_type: "image/png")
workout3.save

file4 = URI.open("https://i.pinimg.com/474x/e5/7f/3d/e57f3db3b0e877331247b8a94a0d716d.jpg")
workout4 = Workout.new(title: "Eve workout", user: user4)
workout4.photo.attach(io: file4, filename: "workout.png", content_type: "image/png")
workout4.save

puts "Done"
