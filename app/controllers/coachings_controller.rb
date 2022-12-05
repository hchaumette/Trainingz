class CoachingsController < ApplicationController
  def index
    @coachings = current_user.coachings
    @coaching = Coaching.new
  end

  def create
  end
end
