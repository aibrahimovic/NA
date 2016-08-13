# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160813091536) do

  create_table "academic_years", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "all_subject_roles", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "subject_role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ensembles", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.string   "academic_year"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
    t.integer  "subject_role_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "label"
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.string   "academic_year"
    t.integer  "number_of_students"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "privileges", force: :cascade do |t|
    t.string   "name"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_numbers", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "predicted_student_number"
    t.integer  "student_number"
    t.string   "academic_year"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "academic_year_id"
    t.integer  "group_number"
  end

  create_table "subject_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "number_of_lectures"
    t.integer  "number_of_exercises"
    t.integer  "number_of_tutorials"
    t.integer  "number_of_special_activities"
    t.string   "study_program"
    t.integer  "study_cicle"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "department_id"
    t.integer  "study_year"
    t.integer  "semestar"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "position"
    t.datetime "election_date"
    t.integer  "election_period"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
  end

end
