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
puts "user"
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
user1 = User.create(email: "jean@wagon.org", password: "password", name: "Joe", coach: true)
user2 = User.create(email: "julien@wagon.org", password: "password", name: "lucas")
user3 = User.create(email: "etienne@mail.com", password: "password", coach: true, name: "théo")
user4 = User.create(email: "hugo@mail.com", password: "000000", name: "hugo")
User.create(email: "frederic@gmal.fr", password: "password", name: "Maxence")
puts "Done"



puts "Create 4 workouts"
workout1 = Workout.create(title: "Workout 1", user: user1)
puts "Done"




puts "Create 4 rounds "
round1 = Round.create(name: "Premier", workout: workout1)
puts "Done"


WorkoutExercise.create(round: round1, exercise: Exercise.last)
