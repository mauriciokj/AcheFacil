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

ActiveRecord::Schema.define(:version => 20130304235910) do

  create_table "ambientes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "altura"
    t.float    "largura"
    t.float    "comprimento"
    t.integer  "empresa_id"
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.string   "razao_social"
    t.string   "cnpj"
    t.string   "telefone"
    t.string   "tipo"
    t.string   "prateleira"
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

end
