# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require './config/environment'
require 'csv'
# require 'pry'

Rails.application.load_tasks

task "get_data_disciplinas" do
  require './db/importa/importa_disciplinas.rb'
end

task "get_data_cursos" do
  require './db/importa/importa_cursos.rb'
end

task "get_alunos" do
  require './db/geracao_dados/generate_data.rb'
end