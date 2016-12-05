class Resultado < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :disciplina

  def self.possiveis_mencoes 
    ["SR","II","MI","MM","MS","SS"]
  end

  def aprovado?
    ["MM","MS","SS"].include?(self.mencao)
  end
  
  def semestre_ordenavel
    aa = self.semestre.partition("/")
    aa[2] + " " + aa[0]
  end
  
  def self.ordena_por_semestre(resultados)
    resultados.sort { |a,b| a.semestre_ordenavel <=> b.semestre_ordenavel }    
  end

end
