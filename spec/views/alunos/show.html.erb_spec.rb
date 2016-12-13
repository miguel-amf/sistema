require 'spec_helper'


describe 'alunos/show.html.erb' do
  it 'mostra informacoes do aluno' do
    curso = FactoryGirl.create(:curso)
    aluno = FactoryGirl.create(:aluno)
    assign(:aluno, aluno)

    render

    expect(response).to have_text("#{aluno.nome}")
  end
end
