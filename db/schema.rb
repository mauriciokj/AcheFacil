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

ActiveRecord::Schema.define(:version => 20130322030634) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "ambientes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "altura"
    t.float    "largura"
    t.float    "comprimento"
    t.integer  "empresa_id"
    t.string   "imagem_chao"
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.string   "razao_social"
    t.string   "cnpj"
    t.string   "telefone"
    t.string   "tipo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "niveis", :force => true do |t|
    t.integer  "prateleira_id"
    t.integer  "numero"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "descricao"
  end

  add_index "niveis", ["prateleira_id"], :name => "index_niveis_on_prateleira_id"

  create_table "niveis_produtos", :id => false, :force => true do |t|
    t.integer "produto_id"
    t.integer "nivel_id"
  end

  add_index "niveis_produtos", ["nivel_id", "produto_id"], :name => "index_niveis_produtos_on_nivel_id_and_produto_id"
  add_index "niveis_produtos", ["produto_id", "nivel_id"], :name => "index_niveis_produtos_on_produto_id_and_nivel_id"

  create_table "prateleiras", :force => true do |t|
    t.string   "descricao"
    t.integer  "x"
    t.integer  "y"
    t.string   "posicao"
    t.float    "tamanho"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "style"
    t.integer  "ambiente_id"
    t.integer  "largura"
    t.integer  "comprimento"
    t.string   "imagem"
  end

  create_table "produtos", :force => true do |t|
    t.string   "nome"
    t.float    "preco"
    t.float    "quantidade"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "codigo_de_barras"
    t.text     "descricao"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

end
