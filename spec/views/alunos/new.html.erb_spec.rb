require 'spec_helper'


describe 'alunos/new.html.erb' do
  it 'mostra formulario para cadastro' do
    assign(:aluno, Aluno.new)

    render

    expect(response).to have_selector 'form'
  end
end
