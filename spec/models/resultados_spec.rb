require 'rails_helper'


describe "Resultados" do
  it "Salva nova nota no banco" do
    FactoryGirl.create(:aluno)
    FactoryGirl.create(:disciplina)
    numero_notas = Resultado.all.length
    expect { FactoryGirl.create(:resultado)
    numero_notas = Resultado.all.length}.to change{numero_notas}.by(1)
  end

end

