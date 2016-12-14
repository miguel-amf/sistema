# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

Estamos usando a versão 2.3.1, mas qualquer uma acima da 2.3 deve ser o suficiente

* System dependencies

Rails versão 5 ou superior

* Configuration

* Database creation

- Para criar os arquivos .csv necessários para alimentar o banco de dados:
Executar os arquivos ruby abaixo, via IRB ou outro modo, para a extração automatizada do Matricula Web das informações de cursos, disciplinas e fluxos; estes passos de extração de dados automatizada é opcional, mas altamente recomendável, pois evita que o usuário
tenha que fornecer manualmente estes dados.

".\importa\novo.rb"
Este gera o arquivo "cursos.csv", extraindo informação dos cursos do site MatriculaWeb da UNB; uma conexão com a interenet é necessária

".\importa\crawler.rb"
Este gera o arquivo "disciplinas.csv", extraindo informação das disciplinas do site MatriculaWeb da UNB; uma conexão com a interenet é necessária

".\importa\fluxo.rb"
Este gera o arquivo "fluxos.csv", extraindo informação dos fluxos dos cursos do site MatriculaWeb da UNB; uma conexão com a interenet é necessária

Defina o ambiente de execução do Rails, via linha de comando "set RAILS_ENV=production"

De forma similar, pode-se trabalhar com o Rails em outros ambientes, bastando configurar o ambiente e executar a migração
correspondente; por exemplo, para o ambiente de desenvolvimento: set RAILS_ENV=development, para o ambiente de teste: set RAILS_ENV=test

Criar a base de dados com o comando de linha "rake db:migrate"

Importar os dados dos arquivso .csv gerados para a base com os comandos:

"rails get_data_cursos"       - importa os cursos para a base
"rails get_data_disciplinas"  - importa os dados das disciplinas para a base
"rails get_data_fluxos"       - importa os dados dos fluxos de cada curso para a base

Após isso, basta executar o servidor Rails com o comando "rails server"

Boa sorte!
