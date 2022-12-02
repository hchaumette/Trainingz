class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    if @workout.save
      redirect_to edit_workout_path(@workout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @workout = Workout.find(params[:id])

    @round = Round.new
  end

  def update
  end

  def destroy
  end

  def index
  end

  private

  def workout_params
    params.require(:workout).permit(:title)
  end
end
