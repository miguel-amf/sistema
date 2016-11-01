class AlunosController < ApplicationController

  def new
    @aluno = Aluno.new    
  end

  def create
    @aluno = Aluno.new(aluno_params)
    @aluno.save
    redirect_to disciplinas_path
  end

  def show
    @aluno = Aluno.find(params[:id])
  end


  def aluno_params
    params.require(:aluno).permit(:nome, :curso_id,
      :email, :password_digest)  
  end



end
