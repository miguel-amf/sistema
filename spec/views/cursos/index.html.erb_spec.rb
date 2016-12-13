require 'spec_helper'


describe 'cursos/index.html.erb' do
  it 'mostra informacoes das disciplinas' do
    curso = FactoryGirl.create(:curso)
    assign(:cursos, Curso.all)

    render

    expect(response).to have_text("#{curso.nome}")
  end
end
