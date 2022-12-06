class Workout < ApplicationRecord
  belongs_to :user
  has_many :rounds
  has_many :workout_exercises, through: :rounds

  include PgSearch::Model

  pg_search_scope :search_by,
  against: [ :title, :duration],
  using: {
    tsearch: { prefix: true }
  }


end
