require 'spec_helper'


describe 'cursos/show.html.erb' do
  it 'mostra informacoes do curso' do
    assign(:curso, Curso.create(nome: "Computacao"))

    render

    expect(response).to have_text('Computacao')
  end
end
