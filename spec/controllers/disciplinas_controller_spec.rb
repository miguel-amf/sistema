require 'rails_helper'

RSpec.describe DisciplinasController, type: :controller do

  describe "Get index" do
    
    it "direciona para pagina com todas as disciplinas" do
      get :index, params: { id: 1}, session: { user_id: 1}
      expect(response).to render_template("index")
    end

    it "passa como variavel o enumerable com as disciplinas" do
      materia = FactoryGirl.create(:disciplina)      
      get :index
      expect(assigns(:disciplinas)).to eq([materia])
    end
  
  end

  describe "Get show" do

    it "exibe informacoes sobre disciplina escolhida" do
      materia = FactoryGirl.create(:disciplina)
      get :show, params: {id: materia.id}
      expect(response).to render_template("show") 
    end

    it "passa como variavel a disciplina escolhida" do
      materia = FactoryGirl.create(:disciplina)
      get :show, params: {id: materia.id}
      expect(assigns(:disciplina)).to eq(materia)
    end

  end

end
