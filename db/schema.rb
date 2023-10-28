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

ActiveRecord::Schema[7.1].define(version: 2023_10_28_093654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "department"
    t.string "area"
    t.string "course"
    t.string "category"
    t.string "state"
    t.integer "lective_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_archives", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "project_type"
    t.string "archive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_archives_on_project_id"
  end

  create_table "projects_boards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.string "perfil_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_boards_on_project_id"
    t.index ["user_id"], name: "index_projects_boards_on_user_id"
  end

  create_table "projects_drafts", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "theme"
    t.text "introduction"
    t.text "problem"
    t.text "study_object"
    t.text "action_field"
    t.text "general_objective"
    t.text "specific_objective"
    t.text "justification"
    t.text "hypothesis"
    t.text "variables"
    t.text "methodology"
    t.text "search"
    t.text "methods"
    t.text "techniques"
    t.text "structure"
    t.text "references"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_drafts_on_project_id"
  end

  create_table "projects_keywords", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "project_type"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_keywords_on_project_id"
  end

  create_table "projects_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.string "perfil_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_members_on_project_id"
    t.index ["user_id"], name: "index_projects_members_on_user_id"
  end

  create_table "projects_monographs", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "theme"
    t.string "editor"
    t.string "language"
    t.string "country"
    t.string "project_type"
    t.string "pages"
    t.text "terms_use"
    t.text "objective"
    t.string "keywords"
    t.text "index"
    t.text "summary"
    t.string "state"
    t.string "privacy"
    t.integer "lective_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_monographs_on_project_id"
  end

  create_table "projects_proposals", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "theme"
    t.text "objectives"
    t.text "summary"
    t.text "literature"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_proposals_on_project_id"
  end

  create_table "projects_suggestions", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "project_type"
    t.text "sugestions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_suggestions_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "institution"
    t.string "user_type"
    t.string "email"
    t.datetime "email_verified_at", precision: nil
    t.string "password"
    t.string "remember_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "projects_archives", "projects"
  add_foreign_key "projects_boards", "projects"
  add_foreign_key "projects_boards", "users"
  add_foreign_key "projects_drafts", "projects"
  add_foreign_key "projects_keywords", "projects"
  add_foreign_key "projects_members", "projects"
  add_foreign_key "projects_members", "users"
  add_foreign_key "projects_monographs", "projects"
  add_foreign_key "projects_proposals", "projects"
  add_foreign_key "projects_suggestions", "projects"
end
