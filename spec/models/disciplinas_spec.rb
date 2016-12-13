require 'rails_helper'


describe "Disciplina" do

  it "cria nova disciplina" do
    expect{Disciplina.create.save}.to change{Disciplina.all.length}.by(1)
  end  

end