class Round < ApplicationRecord
  belongs_to :workout
  has_many :workout_exercises, dependent: :destroy
  before_update :update_exercises

  private

  def update_exercises
    params_exercise = {}
    params_exercise[:rest_duration] = exercises_rest if exercises_rest_changed?
    params_exercise[:duration] = exercises_time if exercises_time_changed?
    params_exercise[:repetitions] = exercises_reps if exercises_reps_changed?
    workout_exercises.each do |exercises|
      exercises.update(params_exercise)
    end
  end
end
