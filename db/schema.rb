# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_05_090847) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coachings", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "trainee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coachings_on_coach_id"
    t.index ["trainee_id"], name: "index_coachings_on_trainee_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "duration"
    t.integer "rest_time"
    t.integer "repetitions"
    t.string "demonstration"
    t.string "title"
    t.string "equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "body_part"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "name"
    t.bigint "workout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sets", default: 1
    t.integer "exercises_time", default: 30
    t.integer "exercises_rest", default: 0
    t.integer "round_rest", default: 30
    t.integer "exercises_reps", default: 10
    t.index ["workout_id"], name: "index_rounds_on_workout_id"
  end

  create_table "user_workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_workouts_on_user_id"
    t.index ["workout_id"], name: "index_user_workouts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "coach", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.integer "duration", default: 30
    t.integer "rest_duration", default: 0
    t.integer "repetitions", default: 10
    t.string "demonstration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "round_id", null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["round_id"], name: "index_workout_exercises_on_round_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "type_of_workout"
    t.integer "duration"
    t.bigint "user_id", null: false
    t.string "title"
    t.string "body_focus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "coachings", "users", column: "coach_id"
  add_foreign_key "coachings", "users", column: "trainee_id"
  add_foreign_key "rounds", "workouts"
  add_foreign_key "user_workouts", "users"
  add_foreign_key "user_workouts", "workouts"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "rounds"
  add_foreign_key "workouts", "users"
end
