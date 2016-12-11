require 'csv'

data = CSV.read("./db/importa/fluxos.csv")

header = ["opcao","periodo","cod_dis"]
sym_head = header.map { |head| head.to_sym}

fluxos = []
data.each do |row|
  fluxos << Hash[sym_head.zip(row)]
end

fluxos.each do |fluxo|
	
	c = Curso.find_by      codigo: fluxo[:opcao]
	d = Disciplina.find_by codigo: fluxo[:cod_dis]
	if c && d
		i = { :periodo => fluxo[:periodo], :curso_id => c.id, :disciplina_id => d.id }
		flx = ItemFluxo.new(i)
        flx.save
	end
end
