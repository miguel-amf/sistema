require 'bcrypt'

class Aluno < ActiveRecord::Base
  include BCrypt

  belongs_to :curso
  has_many :resultados
  has_many :disciplinas, through: :resultados

  has_secure_password

  def Aluno.possiveis_semestres
    possiveis_semestres = [] 
    anos = Array(2005..2025)
    semestres = Array(0..2)
    anos.each {|ano| semestres.map{|sem| possiveis_semestres << "#{sem}/" + "#{ano}" }}  
    possiveis_semestres
  end  

  def conta_creditos
    cred = self.resultados.select {|resultado| resultado.aprovado? }.inject(0) { |soma,x| soma + x.disciplina.creditos}
  end

  def creditos_faltantes
    self.curso.creditos - self.conta_creditos
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end



require 'bcrypt'

class Aluno < ActiveRecord::Base
  include BCrypt

  has_many :resultados
  has_many :disciplinas, through: :resultados 

  has_secure_password  

  def Aluno.possiveis_semestres
    possiveis_semestres = [] 
    anos = Array(2005..2025)
    semestres = Array(0..2)
    anos.each {|ano| semestres.map{|sem| possiveis_semestres << "#{sem}/" + "#{ano}" }}  
    possiveis_semestres
  end  

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end



end