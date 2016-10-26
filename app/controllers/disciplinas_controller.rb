class DisciplinasController < ApplicationController

def new
    @disciplina  = Disciplina.new
  end

  def create
    @disciplina = Disciplina.new(disciplina_params) 
    @disciplina.save
    redirect_to disciplinas_path 
  end

  def index
    @disciplinas = Disciplina.all    
  end

  
  def disciplina_params
    params.require(:disciplina).permit(:nome, :creditos,
      :departamento, :codigo)  
  end

end
