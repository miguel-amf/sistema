require 'open-uri'
require 'nokogiri'
require 'csv'

#lê a página do MW com todos os cursos
doc = Nokogiri::HTML(open("https://matriculaweb.unb.br/graduacao/curso_rel.aspx?cod=1"))
doc.encoding = 'utf-8'
aa = doc.css('tr.PadraoMenor a')

link_cursos = aa.map {|link| link['href']}

idx_opcoes  = 0

opcoes      = []
periodos    = []
disciplinas = []

link_cursos.each do |link|
  #abre a página de cada fluxo de cada curso
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'

  #pega o link do fluxo; estou lendo apenas o primeiro fluxo de cada curso, no caso de haver mais de um
  link = pagina.css('tr.PadraoMenor a')[0]['href']
  html = open("https://matriculaweb.unb.br/graduacao/#{link}")
  pagina = Nokogiri::HTML(html.read)
  pagina.encoding = 'utf-8'

  #info tem as infomações do fluxo do curso
  info  = pagina.css('.padraobranco b , td:nth-child(3) a')

  #opção contém o código da opção do curso
  opcao = pagina.css('.padrao .padrao br+ b')[0].text.match(/.+:\s(\d*)/)[1]

  #inicializo o contador de períodos do fluxo
  periodo = 0

  #para cada período
  info.each do |node|

    #str contém as informações deste período
    str = node.text.split(' ')[0]
    case str
      when 'PERÍODO:'
        periodo += 1

      when 'CRÉDITOS:'

      else
        disciplina = str
        gera_linha = true
    end

    #para disciplina lida, gera uma linha no arquivo de saída
    if gera_linha
       opcoes      <<  opcao
       periodos    <<  periodo
       disciplinas <<  disciplina
      gera_linha = false
    end
  end
  idx_opcoes += 1
end

#gera o .csv de saída
CSV.open('fluxos.csv', 'w') do |csv_object|
  opcoes.each_with_index do |opcao,index|
    csv_object << [opcoes[index], periodos[index], disciplinas[index]]
  end
end
