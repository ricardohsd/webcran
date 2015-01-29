# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150129221356) do

  create_table "authors", force: :cascade do |t|
    t.integer  "package_version_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "authors", ["package_version_id"], name: "index_authors_on_package_version_id"

  create_table "maintainers", force: :cascade do |t|
    t.integer  "package_version_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "maintainers", ["package_version_id"], name: "index_maintainers_on_package_version_id"

  create_table "package_versions", force: :cascade do |t|
    t.integer  "package_id"
    t.string   "version"
    t.datetime "publication_date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "package_versions", ["package_id"], name: "index_package_versions_on_package_id"

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "packages", ["name"], name: "index_packages_on_name"

end
