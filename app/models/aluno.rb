require 'bcrypt'

class Aluno < ActiveRecord::Base
  include BCrypt
  mount_uploader :foto, ImageUploader


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

    #seleciona os resultados dos semestres selecionados
    r_selecionados = self.resultados.where ({semestre: semestres_unicos[0..max-1]})
    
    #calcula a quantidade de creditos adquiridos pelo aluno nos semestres selecionados
    cred_adquiridos = 0
    r_selecionados.map { |r| cred_adquiridos += r.disciplina.creditos if r.aprovado? }
    
    #calcula a velocidade de aquisição de créditos nos semestres selecionados
    @velocidade = cred_adquiridos.fdiv(max)
  end

  def tempo_estimado
    creditos_faltantes.fdiv(@velocidade)
  end

  def posicao_fluxo
    #seleciona somente os resultados com aprovação dos semestres 
    r_aprovados = self.resultados.select { |r| r.aprovado?}

    #gera a lista de códigos de disciplinas que o aluno já concluiu
    id_dis_concluidas = r_aprovados.map { |r| r.disciplina.id}

    #gera a lista dos itens de fluxo do curso das disciplinas que o aluno já passou
    fluxos = self.curso.item_fluxos.where disciplina_id: id_dis_concluidas

    #gera a lista de periodos destes itens de fluxo
    cod_per = []
    fluxos.each do | flx |
      cod_per << flx.periodo
    end

    logger.debug cod_per

    cod_per.uniq.max
  end

end
