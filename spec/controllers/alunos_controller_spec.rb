require 'rails_helper'

RSpec.describe AlunosController, type: :controller do

  describe "Get new_aluno" do
    it "mostra o formulario" do
      get :new
      expect(response).to render_template("new")
    end
  end

  

end
