class RoundsController < ApplicationController
  def create
    @workout = Workout.find(params[:workout_id])
    name = "Round #{@workout.rounds.count + 1}"
    @round = Round.new(name:name)
    @round.workout = @workout
    @round.save
    redirect_to round_workout_exercises_path(@round)
  end

  def update
    @round = Round.find(params[:id])
    @workout = @round.workout
    if @round.update(round_params)
      respond_to do |format|
        format.html { redirect_to edit_workout_path(@workout) }
        format.text { render "workouts/edit", locals: { workout: @workout }, formats: [:html] }
      end
    else
      render "workouts/edit", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def round_params
    params.require(:round).permit(:sets, :exercises_reps, :exercises_rest, :exercises_time)
  end
end
