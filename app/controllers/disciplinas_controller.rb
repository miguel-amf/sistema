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
    #binding.pry
    if params[:sort_by]
      @disciplinas = Disciplina.all.order("#{params[:sort_by]}" + " #{params[:sentido]}")
    else
      @disciplinas = Disciplina.all.sort_by {|disciplina| disciplina.nome}           
    end
    
  end


  def show
    @disciplina  = Disciplina.find(params[:id])
  end

  def disciplina_params
    params.require(:disciplina).permit(:nome, :creditos,
      :departamento, :codigo)  
  end

end
