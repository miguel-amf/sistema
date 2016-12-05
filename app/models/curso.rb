class Curso < ActiveRecord::Base
  has_many :alunos  

  def encontra_resultados_de_curso
    resultados = []
    self.alunos.each do |aluno|
      resultados << aluno.resultados
    end
    resultados.flatten
  end
  
end
