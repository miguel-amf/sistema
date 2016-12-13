require 'rails_helper'


describe "Alunos" do
  it "Salva novo aluno no banco" do
    numero_alunos = Aluno.all.length
    expect { FactoryGirl.create(:aluno)
    numero_alunos = Aluno.all.length}.to change{numero_alunos}.by(1)
  end

end