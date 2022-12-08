class DashboardsController < ApplicationController
  def index


    if current_user.coach
      @uw = current_user.workouts
    else
      @uw = current_user.user_workouts
    end

    if params[:query].present?
      @query = params[:query]
      @uw = Workout.search_by(@query)
      unless @uw.empty?
        @workouts = @uw
      end
    else
      @duration = params[:duration]
      @duration_workouts = @uw.where(duration: @duration) if @duration
    end
    # @user_workout = UserWorkout.find(params[:id])
    # @workout_user = @user_workout.Workout

  end
end
