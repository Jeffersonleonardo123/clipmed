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

ActiveRecord::Schema.define(version: 20170319143058) do

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
  end

end
