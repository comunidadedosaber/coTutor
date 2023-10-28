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

ActiveRecord::Schema[7.1].define(version: 2023_10_28_075727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "department"
    t.string "area"
    t.string "course"
    t.string "category", default: "TCC"
    t.string "state", default: "Iniciado"
    t.integer "lective_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_archives", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "type"
    t.string "archive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_boards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_drafts", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "theme"
    t.text "introdution"
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
    t.string "state", default: "Analisando"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme"], name: "index_projects_drafts_on_theme", unique: true
  end

  create_table "projects_keywords", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "type"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword"], name: "index_projects_keywords_on_keyword"
  end

  create_table "projects_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_monographs", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "theme"
    t.string "editor", default: "Comunidade do Saber - CS"
    t.string "language", default: "Português"
    t.string "country", default: "Angola"
    t.string "type", default: "Monografia/TCC"
    t.string "pages"
    t.text "terms_use"
    t.text "objective"
    t.string "keywords"
    t.text "index"
    t.text "summary"
    t.string "state", default: "Analisando"
    t.string "privacy", default: "Privado"
    t.integer "lective_year", default: 2021
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme"], name: "index_projects_monographs_on_theme", unique: true
  end

  create_table "projects_proposals", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "theme"
    t.text "objectives"
    t.text "summary"
    t.text "literature"
    t.string "state", default: "Analisando"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme"], name: "index_projects_proposals_on_theme", unique: true
  end

  create_table "projects_sugestions", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "type"
    t.text "sugestions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "institution"
    t.string "type"
    t.string "email"
    t.datetime "email_verified_at", precision: nil
    t.string "password"
    t.string "remember_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "projects_archives", "projects", on_delete: :cascade
  add_foreign_key "projects_boards", "projects", on_delete: :cascade
  add_foreign_key "projects_boards", "users", on_delete: :cascade
  add_foreign_key "projects_drafts", "projects", on_delete: :cascade
  add_foreign_key "projects_keywords", "projects", on_delete: :cascade
  add_foreign_key "projects_members", "projects", on_delete: :cascade
  add_foreign_key "projects_members", "users", on_delete: :cascade
  add_foreign_key "projects_monographs", "projects", on_delete: :cascade
  add_foreign_key "projects_proposals", "projects", on_delete: :cascade
  add_foreign_key "projects_sugestions", "projects", on_delete: :cascade
end
