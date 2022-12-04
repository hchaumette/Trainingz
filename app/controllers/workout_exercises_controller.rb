require 'json'

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
    @exercise = Exercise.find(params[:workout_exercise][:exercise])
    @workout_exercise = WorkoutExercise.new(round: @round, exercise: @exercise)
    if @workout_exercise.save
      respond_to do |format|
        format.html { redirect_to edit_workout_path(@round.workout) }
        format.text { render "workouts/edit", locals: { workout: @round.workout }, formats: [:html] }
      end
    end
  end
end
