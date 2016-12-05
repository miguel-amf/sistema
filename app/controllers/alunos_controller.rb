class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]
  before_action :authorize, :except => [:new, :create]


  def new
    @aluno = Aluno.new    
  end

  def create
    valores_iniciais = aluno_params
    valores_iniciais[:curso] = Curso.find_by nome: aluno_params[:curso]
    #binding.pry
    @aluno = Aluno.new(valores_iniciais)
    #@aluno.password_digest = Password.create(@aluno.password_digest)
    @aluno.password = aluno_params[:password_digest]
    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno was successfully created.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @aluno = Aluno.find(params[:id])
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:nome, :password_digest, :semestre, :curso)
    end

end
