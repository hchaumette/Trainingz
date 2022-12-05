require 'json'
require 'open-uri'
class WorkoutExercisesController < ApplicationController

  def index
    @round = Round.find(params[:round_id])
    @workout = @round.workout
    @exercises = Exercise.all
    @workout_exercise = WorkoutExercise.new
    if params[:query].present?
      sql_query = "title ILIKE :query OR equipment ILIKE :query"
      @exercises = Exercise.where(sql_query, query: "%#{params[:query]}%")
    else
      @exercises = Exercise.all

    end
  end

  def create
    @round = Round.find(params[:round_id])
    request.body.string.split(',').drop(1).each do |exercise_id|
      WorkoutExercise.create!(round: @round, exercise_id: exercise_id.to_i)
    end
  end
end
