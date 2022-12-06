class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coachings_as_trainee, class_name: :Coaching, foreign_key: :trainee_id
  has_many :coachs, through: :coachings_as_trainee, source: :coach

  has_many :coachings_as_coach, class_name: :Coaching, foreign_key: :coach_id
  has_many :trainees, through: :coachings_as_coach, source: :trainee


  has_many :notifications
  has_many :workouts
  has_many :user_workouts
  has_many :coachings
end
