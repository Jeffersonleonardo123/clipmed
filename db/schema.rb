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

ActiveRecord::Schema.define(version: 20170406012114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cnpj"
    t.string   "fone"
    t.integer  "company_id"
    t.integer  "number"
    t.string   "address"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.text     "observation"
    t.string   "contact"
    t.text     "site"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "professional_id"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "agreement_id"
    t.datetime "date"
    t.string   "acompanhante"
    t.string   "status"
    t.text     "antecedentes"
    t.text     "habitos"
    t.text     "isda"
    t.text     "exame_fisico"
    t.text     "diagnostico"
    t.text     "conduta"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "hma"
    t.integer  "time_begin"
    t.integer  "time_end"
    t.string   "tipo_atendimento"
    t.text     "medicamentos"
    t.text     "outras_informacoes"
  end

  create_table "card_operators", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "deleted_at"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.string   "celular"
    t.string   "fone"
    t.integer  "company_id"
    t.integer  "number"
    t.string   "address"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.text     "observation"
    t.string   "situation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "professional_id"
    t.date     "nascimento"
    t.datetime "deleted_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cnpj"
    t.string   "fone"
    t.integer  "number"
    t.string   "address"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.text     "observation"
    t.string   "contact"
    t.text     "site"
    t.text     "logo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "financials", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "conditions_payments"
    t.integer  "way_payments_id"
    t.integer  "client_id"
    t.date     "date_vencto"
    t.string   "status"
    t.string   "category"
    t.date     "date_receiopt"
    t.decimal  "value_document"
    t.decimal  "value_ticket"
    t.decimal  "interest"
    t.decimal  "discount"
    t.decimal  "addition"
    t.string   "reference"
    t.integer  "parcel"
    t.datetime "deleted_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.string   "celular"
    t.string   "fone"
    t.integer  "company_id"
    t.integer  "number"
    t.string   "address"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.text     "observation"
    t.string   "situation"
    t.string   "function"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
  end

  create_table "schedullers", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "professional_id"
    t.time     "time_marked"
    t.text     "observation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "date"
    t.time     "time_marked_end"
    t.string   "celphone"
    t.string   "phone"
    t.string   "status"
    t.integer  "client_id"
    t.string   "name"
    t.string   "tipo_atendimento"
    t.integer  "agreement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "encrypted_password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "adm"
    t.integer  "company_id"
    t.string   "restart_login"
    t.datetime "deleted_at"
  end

  create_table "way_payments", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "deleted_at"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
