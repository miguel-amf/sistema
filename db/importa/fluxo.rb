require 'open-uri'
require 'nokogiri'
require 'csv'

doc = Nokogiri::HTML(open("https://matriculaweb.unb.br/graduacao/curso_rel.aspx?cod=1"))
doc.encoding = 'utf-8'
aa = doc.css('tr.PadraoMenor a')
link_cursos = aa.map {|link| link['href']}

idx_opcoes  = 0

opcoes      = []
periodos    = []
disciplinas = []

link_cursos.each do |link|
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'
  link = pagina.css('tr.PadraoMenor a')[0]['href']
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'
  info  = pagina.css('.padraobranco b , td:nth-child(3) a')
  opcao = pagina.css('.padrao .padrao br+ b')[0].text.match(/.+:\s(\d*)/)[1]
  #puts opcao,'---------'
  periodo = 0
  info.each do |node|
    str = node.text.split(' ')[0]
    case str
      when 'PERÍODO:'
        periodo += 1

      when 'CRÉDITOS:'

      else
        disciplina = str
        gera_linha = true
    end
    if gera_linha
       opcoes      <<  opcao
       periodos    <<  periodo
       disciplinas <<  disciplina
      gera_linha = false
    end
  end
  idx_opcoes += 1
end


CSV.open('fluxos.csv', 'w') do |csv_object|
  opcoes.each_with_index do |opcao,index|
    csv_object << [opcoes[index], periodos[index], disciplinas[index]]
  end
end
