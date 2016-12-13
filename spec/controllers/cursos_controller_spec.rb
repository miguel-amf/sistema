require 'rails_helper'

RSpec.describe CursosController, type: :controller do


  describe "get index" do


    it "passa a lista dos cursos" do
      curso = FactoryGirl.create(:curso)
      get :index
      expect(assigns(:cursos)).to eq([curso])
    end

    it "mostra a lista dos cursos" do
      get :index
      expect(response).to render_template("index") 
    end

  end

end
