require 'open-uri'
require 'nokogiri'

# doc = Nokogiri::HTML(open("https://matriculaweb.unb.br/graduacao/oferta_dep.aspx?cod=1"))
# aa = doc.css('tr.PadraoMenor a')
# bb = aa.map {|link| link['href']}


# disciplinas = []
# bb.each do |link|
# 	html = open("https://matriculaweb.unb.br/graduacao/#{link}")
# 	pagina = Nokogiri::HTML(html.read)
# 	pagina.encoding = 'utf-8'
# 	departamento = pagina.css('h5').text
#   cc = pagina.css('tr.PadraoMenor')
# 	cc.each do |curso|
#     cod_nome = curso.text.split(/(^\d+)(\D+.*)/)
#     cod_nome.shift
#     cod_nome << departamento
# 		disciplinas << cod_nome
# 	end
# end


# html = open("https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=638")
# pagina = Nokogiri::HTML(html.read)
# pagina.encoding = 'utf-8'
# cc = pagina.css('tr.PadraoMenor')
# cc.each do |curso|
#   cod_nome = curso.text.split(/(^\d+)(\D+.*)/)
#   cod_nome.shift
#   cod_nome << "Faculdade de Planaltina"
#   disciplinas << cod_nome
# end



# html = open("https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=660")
# pagina = Nokogiri::HTML(html.read)
# pagina.encoding = 'utf-8'
# cc = pagina.css('tr.PadraoMenor')
# cc.each do |curso|
#   cod_nome = curso.text.split(/(^\d+)(\D+.*)/)
#   cod_nome.shift
#   cod_nome << "Faculdade da Ceilândia"
#   disciplinas << cod_nome
# end




# html = open("https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=650")
# pagina = Nokogiri::HTML(html.read)
# pagina.encoding = 'utf-8'
# cc = pagina.css('tr.PadraoMenor')
# cc.each do |curso|
#   cod_nome = curso.text.split(/(^\d+)(\D+.*)/)
#   cod_nome.shift
#   cod_nome << "Faculdade do Gama"
#   disciplinas << cod_nome
# end

# puts disciplinas

# html = open("https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=135")
# pagina = Nokogiri::HTML(html.read)
# pagina.encoding = 'utf-8'
# cc = pagina.css('tr.PadraoMenor')
# depart = pagina.css('h5')

###Refazendo para pegar o número de creditos de cada disciplina

doc = Nokogiri::HTML(open("https://matriculaweb.unb.br/graduacao/oferta_dep.aspx?cod=1"))
aa = doc.css('tr.PadraoMenor a')
bb = aa.map {|link| link['href']}

links_disciplinas = []
tmp_nomes_disciplinas = []
codigos_disciplinas =[]
bb.each do |link|
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'
  links = pagina.css('tr.PadraoMenor a')
  codigos = pagina.css('table.FrameCinza td.Padrao b').map { |cod| cod.text  }
  codigos_disciplinas << codigos
  links.each {|endereco| 
    links_disciplinas << endereco['href']
    tmp_nomes_disciplinas << endereco.text

  }
end
codigos_disciplinas = codigos_disciplinas.flatten
links_bons = []
nomes_disciplinas = []

links_disciplinas.each_with_index do |link,index|
  if index % 2 == 0
    links_bons << link   
  end 
end

tmp_nomes_disciplinas.each_with_index do |nome,index|
  if index % 2 == 0
    nomes_disciplinas << nome.split(/ |\_/).map(&:capitalize).join(" ")   
  end 
end

nomes_departamentos = []
creditos = []
links_bons.each do |link|
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'
  tabela = pagina.css('table.framecinza')[0]
  nomes_departamentos <<  pagina.css('table.framecinza tr')[0].text.split(/ |\_/).map(&:capitalize).join(" ")
  creditos << tabela.css('td')[2].children.text
  puts tabela.css('td')[1].children.text
end

nomes_departamentos = nomes_departamentos.map { |e| e.match(/(Departamento: )(.+)(\s*)/)[1]  }
creditos_reais = creditos.map{|valor| valor.scan(/(\d\d\d)/).map {|valor| valor[0].to_i}}
creditos_totais = creditos_reais.map {|vetor| vetor[0..2].inject(0){|sum,x| sum + x }}

CSV.open('disciplinas.csv', 'w') do |csv_object|
  nomes_disciplinas.each_with_index do |nome,index|
    csv_object << [nomes_disciplinas[index],
                  codigos_disciplinas[index],
                  creditos_totais[index],
                  nomes_departamentos[index]]
  end
end
