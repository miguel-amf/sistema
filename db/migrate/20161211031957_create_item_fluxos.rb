class CreateItemFluxos < ActiveRecord::Migration[5.0]
  def change
    create_table :item_fluxos do |t|
      t.integer :periodo
      t.references :curso, foreign_key: true
      t.references :disciplina, foreign_key: true

      t.timestamps
    end
  end
end
