class Curso < ActiveRecord::Base
  has_many :alunos  
  has_many :item_fluxos

  def encontra_resultados_de_curso
    resultados = []
    self.alunos.each do |aluno|
      resultados << aluno.resultados
    end
    resultados.flatten
  end
 
end
