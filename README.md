# README

* Versão Ruby 

Estamos usando a versão 2.3.1, mas qualquer uma acima da 2.3 deve ser o suficiente

* Versão Rails

Rails versão 5 ou superior

* Configuração do ambiente Ruby e Rails
 
 Excutar o comando de linha "bundle install"; isso irá baixar e instalar no seu sistema todas as gems e dependências necessárias para que o sistema funcione a contento; uma conexão com a internet é necessária.
 
* Extração automatizada de informações do Matricula WEB
 
Executar os arquivos ruby abaixo, via IRB ou outro modo, para a extração automatizada do Matricula Web das informações de cursos, disciplinas e fluxos; estes passos de extração de dados automatizada é opcional, mas altamente recomendável, pois evita que o usuário
tenha que fornecer manualmente estes dados. Junto com esta distribuição voce encontrará cópias dos arquivos .csv que são gerados por este programa ruby, de modo que você só precisará executar a extração de dados se quiser obter a informação mais atualizada possível do Matricula Web.

- ".\importa\novo.rb"
Este gera o arquivo "cursos.csv", extraindo informação dos cursos do site MatriculaWeb da UNB; uma conexão com a internet é necessária

- ".\importa\crawler.rb"
Este gera o arquivo "disciplinas.csv", extraindo informação das disciplinas do site MatriculaWeb da UNB; uma conexão com a internet é necessária

- ".\importa\fluxo.rb"
Este gera o arquivo "fluxos.csv", extraindo informação dos fluxos dos cursos do site MatriculaWeb da UNB; uma conexão com a internet é necessária

* Criação da base de dados

Defina o ambiente de execução do Rails, via linha de comando "set RAILS_ENV=production"

De forma similar, pode-se trabalhar com o Rails em outros ambientes, bastando configurar o ambiente e executar a migração
correspondente; por exemplo, para o ambiente de desenvolvimento: set RAILS_ENV=development, para o ambiente de teste: set RAILS_ENV=test

Criar a base de dados com o comando de linha "rake db:migrate"

* Migrar os dados os dados dos arquivos .csv gerados para a base com os comandos

- "rails get_data_cursos"       - importa os cursos para a base
- "rails get_data_disciplinas"  - importa os dados das disciplinas para a base
- "rails get_data_fluxos"       - importa os dados dos fluxos de cada curso para a base

Este passo é opcional, mas altamente recomendável pois evita a criação das bases de Cursos, Disciplinas e Fluxos de forma manual, mas o sistema também permite a entrada destas informações se isso for desejável.

* Definindo SECRET_KEY_BASE

O próximo passo é definir a chave SECRET_KEY_BASE, utilizada pelo Rails, para gerar e autenticar todos os cookies e sessões do ambiente de produção. Isto é feito através do comando de linha "set SECRET_KEY_BASE = "minhastringúnicasecretalongaedificildeentenderereproduzir", onde "minhastringúnicasecretalongaedificildeentenderereproduzir" é uma string única, secreta, longa e difícil de entender e reproduzir. Esta string deverá ser mantida segura e longe de olhares indiscretos, se alguém copiar ela poderá em tese acessar todos os cookies e sessões do seu sistema e você não irá querer isso!

De forma similar, a perda ou troca acidental desta informação implica que todos os cookies e sessões salvas estão perdidos, devendo ser novamente inicidos.

Esta string pode ser gerada pelo comando de linha "rails secret" e só é necessária no ambiente de produção, os outros ambientes já dispõem de valores devidamente armazenados no arquivo config\secrets.yml.

Garanta que antes de iniciar o servidor Rails a váriável de ambiente "SECRET_KEY_BASE"esteja definida com o seu valor gerado por você.

NÃO armazene neste arquivo a sua string secreta de produção e muito menos permita acesso irrestrito a ele. Você foi avisado!


* Execução do sistema

Executar o servidor Rails com o comando de linha "rails server", que iniciará o servidor Rails no ambiente escolhido pelo usuário. A janela do terminal deverá permanecer aberta durante a execução do sistema; para parar o servidor, basta digitar "Control-c" e responder "S" a pergunta.

Para interagir com o sistema ALUNB, abra seu browser preferido e digite o endereço: "http:/localhost/login"

* Testando o sistema

Utilizando-se da filosofia TDD, o sistema pode ser testadoo de forma automatizada, utilizando a gem Rspec, instalada e configurada no passo inicial de configuração do sistema. No diretório "spec" encontram-se vários cenários de testes já configurados.

Para iniciar os testes, os procedimentos são parecidos com os da inicialização para produção:

- Configurar o ambiente de teste: "set RAILS_ENV=test"
- Fazer a migração da base de dados: "rake db:migrate:

Nao há a necessidade de popular o banco de dado de teste, visto que os testes serão conduzidos com dados pré-definidos e no caso de todos os testes passarem, a base é reinicializada em preparação para novos testes.

Não se esqueça de reconfigurar o ambiente ao terminar os testes, com o comando de linha "SET RAILS_ENV=production" ou outro ambiente desejado.


Boa sorte!
