class Resultado < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :disciplina

  def self.possiveis_mencoes 
    ["SR","II","MI","MM","MS","SS"]
  end

  def aprovado?
    ["MM","MS","SS"].include?(self.mencao)
  end
  
  def self.ordena_por_semestre(resultados)
    resultados.sort_by { |caso| caso.semestre }    
  end
  
end
