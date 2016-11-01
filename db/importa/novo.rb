require 'open-uri'
require 'nokogiri'
require 'csv'

doc = Nokogiri::HTML(open("https://matriculaweb.unb.br/graduacao/curso_rel.aspx?cod=1"))
doc.encoding = 'utf-8'
aa = doc.css('tr.PadraoMenor a')
periodo = doc.css('tr.PadraoMenor').map { |e| e.css('td')[3].text  }
modalidade = doc.css('tr.PadraoMenor').map { |e| e.css('td')[0].text  }
bb = aa.map {|link| link['href']}

#html = open("https://matriculaweb.unb.br/graduacao/#{bb.first}")

modalidades_cursos = []
periodos_cursos = []
nomes_cursos = []
codigos_cursos = []
creditos = []
graus_cursos = []
cursos = []
bb.each_with_index do |link,indice|
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'
  cursos = pagina.css('tr.PadraoBranco').map do |valor| valor.text end
  cursos.each_with_index {|val,index| 
    creditos << pagina.css('tr.Padrao')[3+7*index].text 
    periodos_cursos << periodo[indice]
    modalidades_cursos << modalidade[indice]
    graus_cursos << pagina.css('tr.Padrao')[7*index].children[1].text
    puts pagina.css('tr.Padrao')[7*index].children[1].text
    nomes_cursos << val.match(/(\d+)\W+([a-zA-Z].+)/)[2].split(/ |\_/).map(&:capitalize).join(" ")
    codigos_cursos << val.match(/(\d+)\W+([a-zA-Z].+)/)[1]}   
end

numero_creditos = creditos.map { |credito| credito.scan(/(\d\d\d)/).flatten[0].to_i}

CSV.open('cursos.csv', 'w') do |csv_object|
  nomes_cursos.each_with_index do |nome,index|
    csv_object << [codigos_cursos[index],nomes_cursos[index],
                  graus_cursos[index],numero_creditos[index],
                  periodos_cursos[index],modalidades_cursos[index]]
  end
end