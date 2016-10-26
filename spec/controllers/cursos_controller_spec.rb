require 'rails_helper'

RSpec.describe CursosController, type: :controller do


  describe "crud" do

    it "creates a new curso" do
      expect{Curso.create.save}.to change{Curso.all.length}.by(1)
    end

    it "lista os cursos"
    it "edit um curso"
    it "destroi um curso"
  end

end
