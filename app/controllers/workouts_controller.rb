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
    @workout = Workout.find(params[:id])
    @exercises = Exercise.all
  end

  def edit
    @workout = Workout.find(params[:id])

    @round = Round.new
  end

  def update
    @workout = Workout.find(params[:id])
    time = 0
    body_part = []
    @workout.rounds.each do |round|
      round.workout_exercises.each do |workout_exercise|
        time += workout_exercise.duration + workout_exercise.rest_duration
        unless body_part.include?(workout_exercise.exercise.body_part)
          body_part << workout_exercise.exercise.body_part
        end
      end
    end
    @workout.duration = time
    @workout.body_focus = body_part.join(',')
    redirect_to created_path(@workout)
  end

  def created
    @workout = Workout.find(params[:id])
    @user = @workout.user
    @title = @workout.title
    @workout.duration = @workout.duration / 60
  end

  def send
    @workout = Workout.find(params[:id])

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
