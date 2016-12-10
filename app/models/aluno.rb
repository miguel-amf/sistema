require 'bcrypt'

class Aluno < ActiveRecord::Base
  include BCrypt

  belongs_to :curso
  has_many :resultados
  has_many :disciplinas, through: :resultados

  has_secure_password

  attr_accessor :num_semestres

  def Aluno.possiveis_semestres
    possiveis_semestres = [] 
    anos = Array(2000..2025)
    semestres = Array(1..2)
    anos.each {|ano| semestres.map{|sem| possiveis_semestres << "#{ano}/" + ("%02d" % "#{sem}")  }}  
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

  def semestres_unicos
    self.resultados.order(semestre: :desc).distinct.pluck(:semestre)
  end

  def velocidade 
    #seleciona a quantidade máxima de semestres a serem pesquisados
    max = (self.semestres_unicos.count > @num_semestres ? @num_semestres : self.semestres_unicos.count)

    #logger.debug semestres_unicos[0..max]

    #seleciona os resultados dos semestres selecionados
    r_selecionados = self.resultados.where ({semestre: semestres_unicos[0..max-1]})
    r_selecionados.map { |r| logger.debug r.disciplina_id }

    #calcula a quantidade de creditos solicitados pelo aluno nos semestres selecionados
    #cred_solicitados = 0
    #r_selecionados.map { |r| cred_solicitados += r.disciplina.creditos}
    
    ##calcula a quantidade de creditos adquiridos pelo aluno nos semestres selecionados
    cred_adquiridos = 0
    r_selecionados.map { |r| cred_adquiridos += r.disciplina.creditos if r.aprovado?; logger.debug r.aprovado? }
    logger.debug cred_adquiridos

    #calcula a velocidade de aquisição de créditos nos semestres selecionados
    @velocidade = cred_adquiridos.fdiv(max)
  end

  def tempo_estimado
    creditos_faltantes.fdiv(@velocidade)
  end

end

