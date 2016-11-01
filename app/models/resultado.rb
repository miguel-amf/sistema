class Resultado < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :disciplina

  def self.possiveis_mencoes 
    ["SR","II","MI","MM","MS","SS"]
  end

end
