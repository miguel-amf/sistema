require 'spec_helper'


describe 'disciplinas/index.html.erb' do
  it 'mostra informacoes das disciplinas' do
    disciplina = FactoryGirl.create(:disciplina)
    assign(:disciplinas, Disciplina.all)

    render

    expect(response).to have_text("#{disciplina.nome}")
  end
end
