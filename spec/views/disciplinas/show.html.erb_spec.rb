require 'spec_helper'


describe 'disciplinas/show.html.erb' do
  it 'mostra informacoes da disciplina' do
    assign(:disciplina, Disciplina.create(nome: "Engenharia de Software"))

    render

    expect(response).to have_text('Engenharia de Software')
  end
end
