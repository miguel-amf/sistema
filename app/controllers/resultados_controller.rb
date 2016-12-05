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
    @resultado.mencao = aluno_params[:nota]
    @resultado.disciplina_id = aluno_params[:disciplina_id]
    @resultado.save
    # redirect_to aluno_path(current_user), notice: 'Resultado was successfully created.' 

  end

  def aluno_params
        params.require(:resultado).permit(:nota, :disciplina_id)
  end

end
