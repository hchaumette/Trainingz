class UserWorkout < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  validates :workout, uniqueness: { scope: :user }
end
