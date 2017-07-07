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
  fluxos = ItemFluxo.all;
  disc = []
  discEPeriodo = []
  if current_user != nil
    current_user.curso_id
    fluxos = ItemFluxo.where(:curso_id => current_user[:curso_id])
  end
  
  fluxos.each do |flux|
    disc << flux[:disciplina_id]
  end

  if params[:sort_by]
    if (params[:sort_by] == "numero_avaliacoes")
      @disciplinas = Disciplina.where(:id => disc).sort_by {|disciplina| disciplina.numero_avaliacoes}           
      @disciplinas = (params[:sentido]== "ASC" ? @disciplinas : @disciplinas.reverse)
      @disciplinas.each do |disciplina|
        fluxos.each do |flux|
          if flux.disciplina_id == disciplina.id
            disciplina.periodo = flux.periodo
          end
        end
      end
    else
      if params[:sort_by] == "periodo"
        @disciplinas = Disciplina.where(:id => disc)
        @disciplinas.each do |disciplina|
          fluxos.each do |flux|
            if flux.disciplina_id == disciplina.id
              disciplina.periodo = flux.periodo
            end
          end
        end
        @disciplinas = @disciplinas.sort_by(&:periodo)
        @disciplinas = (params[:sentido]== "ASC" ? @disciplinas : @disciplinas.reverse)
      else
        @disciplinas = Disciplina.where(:id => disc).order("#{params[:sort_by]}" + " #{params[:sentido]}")
        @disciplinas.each do |disciplina|
          fluxos.each do |flux|
            if flux.disciplina_id == disciplina.id
              disciplina.periodo = flux.periodo
            end
          end
        end
      end  
    end
  else
    @disciplinas = Disciplina.where(:id => disc)
    @disciplinas.each do |disciplina|
      fluxos.each do |flux|
        if flux.disciplina_id == disciplina.id
          disciplina.periodo = flux.periodo
        end
      end
    end
    @disciplinas = @disciplinas.sort_by(&:periodo)    
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
