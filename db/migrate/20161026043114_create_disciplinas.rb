class CreateDisciplinas < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.string :codigo
      t.integer :creditos
      t.string :departamento
    end
  end
end
