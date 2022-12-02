class RoundsController < ApplicationController


  def create
    @workout = Workout.find(params[:workout_id])
    @round = Round.new()
    @round.workout = @workout
    if @round.save
      redirect_to round_workout_exercises_path(@round)
    else
    end
  end

  def update
    @round = Round.find(params[:id])
    @workout = @round.workout
    if @round.update(round_params)
      redirect_to edit_workout_path(@round.workout)
    else
      render "workouts/edit", status: :unprocessable_entity
    end
  end

  private

  def round_params
    params.require(:round).permit(:sets, :exercises_reps, :exercises_rest, :exercises_time)
  end
end
