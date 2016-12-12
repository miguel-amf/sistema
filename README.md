# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
A mais nova deve ser o suficiente

* System dependencies

* Configuration

* Database creation

- Para criar os arquivos .csv necessários para alimentar o banco de dados:
Executar os arquivos ruby:

.\importa\novo.rb
Este gera o arquivo "cursos.csv", extraindo informação dos cursos do site MatriculaWeb da UNB; uma conexão com a interenet é necessária

.\importa\crawler.rb
Este gera o arquivo "disciplinas.csv", extraindo informação das disciplinas do site MatriculaWeb da UNB; uma conexão com a interenet é necessária

.\importa\fluxo.rb
Este gera o arquivo "fluxos.csv", extraindo informação dos fluxos dos cursos do site MatriculaWeb da UNB; uma conexão com a interenet é necessária

Criar a base de dados com o comando de linha "rake db:migrate"

Imporrtar os dados dos arquivso .csv gerados para a base com os comandos:
"rails get_data_cursos"       - importa os cursos para a base
"rails get_data_disciplinas"  - importa os dados das disciplinas para a base
"rails get_data_fluxos"       - importa os dados dos fluxos de cada curso para a base

Após isso, basta executar o servidor Rails com o comando "rails server"

Boa sorte!