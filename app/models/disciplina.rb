class Disciplina < ActiveRecord::Base
  has_many :resultados
  has_many :alunos, through: :resultados
  attr_accessor :periodo

  def numero_avaliacoes
    self.resultados.length
  end


end
