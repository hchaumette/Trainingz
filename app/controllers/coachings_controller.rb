class CoachingsController < ApplicationController
  def index
    @coaching = Coaching.new
    if current_user.coach
      @coachings = current_user.coachings_as_coach
      @users = User.all.reject { |user| (user == current_user) || user.coachs.include?(current_user) }
    else
      @coachings = current_user.coachings_as_trainee
      @users = User.where(coach: true).reject { |user| (user == current_user) || user.trainees.include?(current_user) }
    end

    if params[:query]
      sql_query = "name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def create
    if current_user.coach
      @trainee = User.find(params[:coaching][:trainee])
      @coaching = Coaching.new(coach:current_user, trainee:@trainee)
    else
      @coach = User.find(params[:coaching][:coach])
      @coaching = Coaching.new(coach:@coach, trainee:current_user)
    end
    @coaching.save
    redirect_to coachings_path
  end
end
