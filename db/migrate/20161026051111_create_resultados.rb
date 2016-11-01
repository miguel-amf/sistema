class CreateResultados < ActiveRecord::Migration[5.0]
  def change
    create_table :resultados do |t|
      t.string :mencao
      t.text :comentario
      t.string :semestre
      t.references :aluno
      t.references :disciplina
    end
  end
end
