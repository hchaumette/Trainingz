class CoachingsController < ApplicationController
  def index
    @coachings = current_user.coachings_as_coach
    @coaching = Coaching.new
    @users = User.all.reject { |user| user.coachs.include?(current_user) }
    if params[:query]
      sql_query = "name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    end

  end

  def create
    @trainee = User.find(params[:coaching][:trainee])
    @coaching = Coaching.new(coach:current_user, trainee:@trainee)
    @coaching.save
    redirect_to coachings_path
  end
end
