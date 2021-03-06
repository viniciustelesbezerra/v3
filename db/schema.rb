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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130224001402) do

  create_table "abrangencia", :force => true do |t|
    t.integer  "contrato_id", :null => false
    t.integer  "uf_id",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "abrangencia", ["contrato_id"], :name => "index_abrangencia_on_contrato_id"
  add_index "abrangencia", ["uf_id"], :name => "index_abrangencia_on_uf_id"

  create_table "arquivos", :force => true do |t|
    t.string   "tipo",                 :limit => 1
    t.boolean  "em_uso",                            :default => false
    t.boolean  "carregado_evora",                   :default => false
    t.datetime "data_carregado_evora"
    t.integer  "user_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "image"
  end

  add_index "arquivos", ["user_id"], :name => "index_arquivos_on_user_id"

  create_table "contratos", :force => true do |t|
    t.integer  "numero",                :null => false
    t.string   "fornecedor",            :null => false
    t.string   "comprador_responsavel", :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "lpus", :force => true do |t|
    t.string   "provedor"
    t.boolean  "carregado_evora",      :default => false
    t.datetime "data_carregado_evora"
    t.integer  "arquivo_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "lpus", ["arquivo_id"], :name => "index_lpus_on_arquivo_id"

  create_table "ufs", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false, :null => false
    t.string   "name",                                      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
