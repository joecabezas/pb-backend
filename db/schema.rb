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

ActiveRecord::Schema[7.0].define(version: 2023_07_11_062252) do
  create_table "disorders", force: :cascade do |t|
    t.integer "orpha_code"
    t.string "expert_link"
    t.string "name"
    t.integer "type_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_disorders_on_group_id"
    t.index ["type_id"], name: "index_disorders_on_type_id"
  end

  create_table "disorders_hpos", id: false, force: :cascade do |t|
    t.integer "disorder_id", null: false
    t.integer "hpo_id", null: false
  end

  create_table "frequencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hpos", force: :cascade do |t|
    t.string "hpo_id"
    t.string "term"
    t.integer "frequency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequency_id"], name: "index_hpos_on_frequency_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "disorders", "groups"
  add_foreign_key "disorders", "types"
  add_foreign_key "hpos", "frequencies"
end
