class Aluno < ActiveRecord::Base
  belongs_to :curso
  has_many :resultados
  has_many :disciplinas, through: :resultados

def Aluno.possiveis_semestres
  possiveis_semestres = [] 
  anos = Array(2005..2025)
  semestres = Array(0..2)
  anos.each {|ano| semestres.map{|sem| possiveis_semestres << "#{sem}/" + "#{ano}" }}  
  possiveis_semestres
end  

def conta_creditos
  cred = self.resultados.map {|result| result.disciplina.creditos} 
  cred.inject(0) { |mem, var| mem + var  }
end

def creditos_faltantes
  self.curso.creditos - self.conta_creditos
end


end
