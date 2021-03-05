# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_26_061602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "adminName"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "adminphoto"
  end

  create_table "commentaires", force: :cascade do |t|
    t.text "comment"
    t.bigint "admin_id"
    t.bigint "publication_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_commentaires_on_admin_id"
    t.index ["publication_id"], name: "index_commentaires_on_publication_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.string "subject"
    t.text "message"
    t.string "onligne"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string "love"
    t.bigint "publication_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publication_id"], name: "index_likes_on_publication_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "nomMvola"
    t.string "nombre"
    t.string "numero"
    t.string "nomProduit"
    t.string "cout"
    t.string "payment"
    t.bigint "user_id"
    t.string "image"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "produits", force: :cascade do |t|
    t.string "nom"
    t.string "other"
    t.string "groupe"
    t.string "cout"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "produitphoto"
  end

  create_table "publications", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.bigint "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "publishingphoto"
    t.index ["admin_id"], name: "index_publications_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "onligne"
    t.string "email"
    t.string "telephone"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "photoUser"
    t.text "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  end

end
