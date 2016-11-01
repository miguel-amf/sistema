require 'faker'

possiveis_semestres = [] 
anos = Array(2005..2016)
semestres = [1,2]
anos.each {|ano| semestres.map{|sem| possiveis_semestres << "#{sem}/" + "#{ano}" }}  
possiveis_semestres
possiveis_cursos = Curso.all.pluck("id")
possiveis_disciplinas = Disciplina.all.pluck("id")


i = 0
200.times do 
  
  aluno = Aluno.new
  aluno.nome = Faker::Name.name 
  aluno.password_digest = "1234"
  # aluno.email = ["test",i].join("")
  aluno.email = Faker::Internet.email
  aluno.semestre = possiveis_semestres.sample(1)[0]
  aluno.curso_id = possiveis_cursos.sample(1)[0]
  # binding.pry
  aluno.save
  i += 1
end
possiveis_alunos = Aluno.all.pluck("id")


1000.times do
  resultado = Resultado.new
  resultado.mencao = Resultado.possiveis_mencoes.sample(1)[0]
  resultado.disciplina_id = possiveis_disciplinas.sample(1)[0]
  resultado.aluno_id = possiveis_alunos.sample(1)[0]
  resultado.comentario = Faker::Hacker.say_something_smart
  resultado.semestre = possiveis_semestres.sample(1)[0]
  resultado.save
end