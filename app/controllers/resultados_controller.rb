class ResultadosController < ApplicationController

  def new
      @resultado = Resultado.new
      @disciplina = Disciplina.find(params[:disciplina_id])
      # @disciplina_id = aluno_params[:disciplina_id]
  end

  def create
    #binding.pry
    @resultado = Resultado.new
    @resultado.aluno_id = current_user.id
    @resultado.mencao = resultado_params[:mencao]
    @resultado.disciplina_id = resultado_params[:disciplina_id]
    @resultado.comentario = resultado_params[:comentario]
    @resultado.semestre = resultado_params[:semestre]
    @resultado.save
    redirect_to aluno_path(current_user), notice: 'Resultado was successfully created.' 

  end

  def resultado_params
        params.require(:resultado).permit(:mencao, :disciplina_id, :semestre, :comentario)
  end

end
