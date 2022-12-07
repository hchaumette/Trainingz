require 'uri'
require 'net/http'
require 'openssl'
require 'json'

puts "Destroy all"
puts"workout exercise"
WorkoutExercise.destroy_all
puts"exercise"
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
user4 = User.create(email: "hugo@mail.com", password: "000000", name: "hugo", coach: true, avatar: "https://i.pinimg.com/474x/00/1c/aa/001caaa4daa43764dcfb61b804cc918d.jpg")
User.create(email: "frederic@gmal.fr", password: "password", name: "Bili", avatar: "https://i.pinimg.com/474x/d4/57/ca/d457ca828a03d20c8a722992634d70a4.jpg")
puts "Done"



puts "Create 4 workouts"
workout1 = Workout.create(title: "Workout 1", user_id: user4)
puts "Done"

puts "Create 4 rounds "
round1 = Round.create(name: "Premier", workout_id: workout1)
puts "Done"


WorkoutExercise.create(round_id: round1, exercise: Exercise.last)
