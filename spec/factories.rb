include BCrypt

FactoryGirl.define do
  
  # factory :aluno do
  #   nome "alunofactory"
  #   password_digest Password.create("1234")
  #   semestre "1/2015"
  #   curso "ruby on rails"
  # end

  # factory :resultado do
  #   mencao "MI"
  #   aluno_id 1
  #   disciplina_id 1
  # end

  # factory :disciplina do
  #   nome "Delineamento de Experimentos"
  #   codigo "1155"
  #   creditos 6
  #   departamento "estat"
  # end

  factory :curso do 
    nome "Estatística"
    creditos 200
    codigo "0800"
    titulo "Bacharel"
    turno "Diurno"
    modalidade "Presencial"
  end

end



