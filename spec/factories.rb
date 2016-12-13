include BCrypt

FactoryGirl.define do
  
  factory :aluno do
    nome "alunofactory"
    password_digest Password.create("1234")
    semestre "2015/1"
    curso_id 1
  end

  factory :resultado do
    mencao "MI"
    semestre "2015/1"
    aluno_id 1
    disciplina_id 1
  end

  factory :disciplina do
    nome "Delineamento de Experimentos"
    codigo "1155"
    creditos 6
    departamento "estat"
  end

  factory :curso do 
    nome "Estatística"
    creditos 200
    codigo "0800"
    titulo "Bacharel"
    turno "Diurno"
    modalidade "Presencial"
  end

end

