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
  

end
