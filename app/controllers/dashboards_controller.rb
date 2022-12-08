class DashboardsController < ApplicationController
  def index

    if current_user.coach
      @uw = current_user.workouts
    else
      @uw = current_user.user_workouts
    end
    if params[:query].present?
      @query = params[:query]
      @search_workouts = Workout.search_by(params[:query])
      unless @search_workouts.empty?
        @workouts = @search_workouts
      end
    else
      @duration = params[:duration]
      @duration_workouts = @workouts.where(duration: @duration) if @duration
    end
    # @user_workout = UserWorkout.find(params[:id])
    # @workout_user = @user_workout.Workout

  end
end
