class RoundsController < ApplicationController

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
