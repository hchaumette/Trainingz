class WorkoutExercisesController < ApplicationController

  def index
    @round = Round.find(params[:round_id])
    @workout = @round.workout
    @exercises = Exercise.all
    if params[:query].present?
      sql_query = "title ILIKE :query OR equipment ILIKE :query"
      @exercises = Exercise.where(sql_query, query: "%#{params[:query]}%")
    else
      @exercises = Exercise.all

    end
  end



  def create
    raise
    @round = Round.find(params[:round_id])
    @exercise = Exercise.find(params[:exercise_id])
    @workout_exercise = WorkoutExercise.new(duration: @exercise.duration)
    @workout_exercise.round = @round

  end

end
