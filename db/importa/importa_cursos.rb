data = CSV.read("./db/importa/cursos.csv")
header = ["codigo","nome","titulo","creditos","turno","modalidade"]
sym_head = header.map { |head| head.to_sym}

cursos = []
data.each do |row|
  cursos << Hash[sym_head.zip(row)]
end
cursos.each do |course|
  aa = Curso.new(course)
  aa.save
  puts aa.nome
end
