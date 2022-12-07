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
    @workout_exercises = @workout.workout_exercises
    @images = @workout_exercises.map { |exercice| [exercice.exercise.demonstration, "rest.png"] }.flatten
    @images.pop
    @images << "finished.png"
    @durations = @workout_exercises.map { |exercice| [exercice.duration, exercice.rest_duration] }.flatten
    @durations.pop
    @durations << 5
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
    @workout.update(duration:time, body_focus:body_part.join(','))

    redirect_to created_path(@workout)

  end

  def created
    @workout = Workout.find(params[:id])
    @user = @workout.user
    @title = @workout.title
    @workout.duration = @workout.duration / 60
    @hour = @workout.duration / 60
    @body_focus = @workout.body_focus.split(',')
  end

  def share
    @workout = Workout.find(params[:id])
    @user_workout = UserWorkout.new
    @trainees = current_user.trainees
    @user = @workout.user
    @title = @workout.title
    @avatar = @user.avatar
  end

  def destroy
  end

  def index
    @workouts = Workout.all

    if params[:query].present?
      @query = params[:query]
      @search_workout = Workout.search_by(params[:query])
      unless @search_workout.empty?
        @workouts = @search_workout
      end
    else
      @duration = params[:duration]
      @duration_workout = @workouts.where(duration: @duration) if @duration
    end
  end

  def success
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises
    @user = @workout.user
    @title = @workout.title
    @workout.duration = @workout.duration / 60
    @hour = @workout.duration / 60
    @body_focus = @workout.body_focus.split(',')
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :duration)
  end
end
