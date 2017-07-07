class CursosController < ApplicationController

  def new
    @curso  = Curso.new
  end

  def create
    @curso = Curso.new(curso_params)
    @curso.save
    redirect_to cursos_path
  end

  def index
    @cursos = Curso.all
  end

  def show
    @curso = Curso.find(params[:id])
  end
  
  def curso_params
    params.require(:curso).permit(:nome, :creditos,
      :titulo, :turno, :modalidade, :codigo)  
  end

  #tem como funcao pegar o arquivo html resumo do matriculaWeb e atualizar o banco dados
  def atualizaTxt
    #abre o arquivo para leitura
    uploaded_file = params[:file]
    uploaded_file = uploaded_file.read();

    #declara a regexp a ser utilizada para o parse
    regexp = /(aspx\?cod=([\d]{6}))|(<div align="center">([A-Z]{2})<\/div>)/

    #faz o scan no arquivo
    result = uploaded_file.scan(regexp)

    #Transforma de matchData para um vetor de hash
    #i é uma flag auxiliar para orientar qual o indice a ser gravado no hash, visto
    #que o matchData armazena matchs diferentes em posicoes diferentes 
    #a matricula está em [1] e a menção em [3].
    i = true
    array = Array.new()
    novoElem = Hash.new()
    result.each do |elem|
      if i
        sql = "select id from disciplinas where codigo = " + elem[1]
        records_array = ActiveRecord::Base.connection.execute(sql)
        if records_array[0] != nil
          records_array = records_array[0]
          novoElem[:id] = records_array["id"]
        else
          novoElem[:id] = 1
        end
        i = false
      else
        novoElem[:nota] = elem[3]
        i = true
        array.push(novoElem)
        novoElem = Hash.new()
      end
    end

    #remove as disciplinas em que o aluno reprovou
    array.delete_if {|disc| (disc[:nota] != "MM" && disc[:nota] != "MS" && disc[:nota] != "SS")}
    
    #adiciona as disciplinas no Resultado da pessoa


    i = 0
    array.each do |disc|
      i = i + 1
      resultado = Resultado.new
      resultado.aluno_id = current_user.id
      resultado.mencao = disc[:nota]
      resultado.disciplina_id = disc[:id]
      resultado.comentario = "Adicao Automatica"
      resultado.semestre = "2000/01"
      resultado.save
    end

    #redirect_back(fallback_location: root_path)


    #puts array
  end
  

end
