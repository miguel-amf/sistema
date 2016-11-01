class Disciplina < ActiveRecord::Base
  has_many :resultados
  has_many :alunos, through: :resultados
end
