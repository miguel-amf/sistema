class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :codigo
      t.string :nome
      t.string :titulo
      t.integer :creditos
      t.string :turno
      t.string :modalidade
    end
  end
end
