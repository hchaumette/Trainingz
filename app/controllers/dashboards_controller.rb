class DashboardsController < ApplicationController
  def index
    @workouts = []


    @workout = current_user.user_workouts


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
  end
end
