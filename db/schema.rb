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

ActiveRecord::Schema.define(version: 20161211031957) do

  create_table "alunos", force: :cascade do |t|
    t.string  "nome"
    t.string  "email"
    t.string  "semestre"
    t.integer "curso_id"
    t.string  "password_digest"
    t.string  "foto"
    t.index ["curso_id"], name: "index_alunos_on_curso_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string  "codigo"
    t.string  "nome"
    t.string  "titulo"
    t.integer "creditos"
    t.string  "turno"
    t.string  "modalidade"
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string  "nome"
    t.string  "codigo"
    t.integer "creditos"
    t.string  "departamento"
  end

  create_table "item_fluxos", force: :cascade do |t|
    t.integer  "periodo"
    t.integer  "curso_id"
    t.integer  "disciplina_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["curso_id"], name: "index_item_fluxos_on_curso_id"
    t.index ["disciplina_id"], name: "index_item_fluxos_on_disciplina_id"
  end

  create_table "resultados", force: :cascade do |t|
    t.string  "mencao"
    t.text    "comentario"
    t.string  "semestre"
    t.integer "aluno_id"
    t.integer "disciplina_id"
    t.index ["aluno_id"], name: "index_resultados_on_aluno_id"
    t.index ["disciplina_id"], name: "index_resultados_on_disciplina_id"
  end

end
