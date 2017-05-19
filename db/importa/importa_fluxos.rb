require 'csv'

data = CSV.read("./db/importa/fluxos.csv")

header = ["opcao","periodo","cod_dis"]
sym_head = header.map { |head| head.to_sym}

fluxos = []
i = 0
data.each do |row|
  fluxos << Hash[sym_head.zip(row)]
end

fluxos.each do |fluxo|
	puts "hue"
	#busco na base o curso associado a opção lida do .csv
	c = Curso.find_by      codigo: fluxo[:opcao]

	#busco na base a disciplina associada ao código lido na base
	d = Disciplina.find_by codigo: fluxo[:cod_dis]

    #se tenho simultaneamente curso e displina, insiro na tabela de itens de fluxos
	if c && d
		#construo um item novo
		i = { :periodo => fluxo[:periodo], :curso_id => c.id, :disciplina_id => d.id }
		flx = ItemFluxo.new(i)

		#persisto
        flx.save
	end
end
