class UserWorkoutsController < ApplicationController
  def create
    @user_workout = UserWorkout.new(user_workout_params)
    @user_workout.workout = Workout.find(params[:workout_id])
    @user_workout.save
    Notification.create!(user: @user_workout.user)
  end

  private

  def user_workout_params
    params.require(:user_workout).permit(:user_id, :workout_id)
  end
end
