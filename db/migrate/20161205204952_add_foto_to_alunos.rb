class AddFotoToAlunos < ActiveRecord::Migration[5.0]
  def change
    add_column :alunos, :foto, :string
  end
end
