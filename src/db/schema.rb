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

ActiveRecord::Schema.define(version: 2021_08_09_232608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "calificacions", force: :cascade do |t|
    t.integer "ranking"
    t.string "descripcion"
    t.date "fecha"
    t.bigint "patrimonio_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patrimonio_id"], name: "index_calificacions_on_patrimonio_id"
    t.index ["user_id"], name: "index_calificacions_on_user_id"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "nombre"
    t.bigint "prov_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prov_id"], name: "index_comunas_on_prov_id"
  end

  create_table "patrimonio_tipos", force: :cascade do |t|
    t.string "nombre"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patrimonios", force: :cascade do |t|
    t.string "descripcion"
    t.string "ubicacion"
    t.string "telefono"
    t.string "email"
    t.decimal "geo_ref_latitud"
    t.decimal "geo_ref_longitud"
    t.bigint "patrimonio_tipo_id", null: false
    t.bigint "comuna_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comuna_id"], name: "index_patrimonios_on_comuna_id"
    t.index ["patrimonio_tipo_id"], name: "index_patrimonios_on_patrimonio_tipo_id"
    t.index ["user_id"], name: "index_patrimonios_on_user_id"
  end

  create_table "provs", force: :cascade do |t|
    t.string "nombre"
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_provs_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "nombre"
    t.string "region_ordinal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nombre", null: false
    t.string "apellidos", null: false
    t.integer "tipo_usuario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "calificacions", "patrimonios"
  add_foreign_key "calificacions", "users"
  add_foreign_key "comunas", "provs"
  add_foreign_key "patrimonios", "comunas"
  add_foreign_key "patrimonios", "patrimonio_tipos"
  add_foreign_key "patrimonios", "users"
  add_foreign_key "provs", "regions"
end
