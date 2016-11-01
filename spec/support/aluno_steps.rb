module AlunoSteps



  def visit_pagina_do_aluno(aluno)
    visit aluno_path(aluno)
  end
      
  def deve_mostrar_informacoes_cadastro
    expect(page).to have_content("e-mail:")
  end

  def cria_aluno
    aa = Aluno.new
    aa.nome = "Testador"
    aa.email = "testador@teste"
    aa.curso_id = 1
    aa.save
  end

end