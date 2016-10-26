class CreateAlunos < ActiveRecord::Migration[5.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.string :semestre
      t.references :curso
      t.string :password_digest
    end
  end
end
