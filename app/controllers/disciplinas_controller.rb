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
      if (params[:sort_by] == "numero_avaliacoes")
        @disciplinas = Disciplina.all.sort_by {|disciplina| disciplina.numero_avaliacoes}           
        @disciplinas = (params[:sentido]== "ASC" ? @disciplinas : @disciplinas.reverse)
      else  
        @disciplinas = Disciplina.all.order("#{params[:sort_by]}" + " #{params[:sentido]}")
      end
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
