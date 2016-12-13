require 'rails_helper'

describe "Curso" do

	it "creates a new curso" do
		expect{Curso.create.save}.to change{Curso.all.length}.by(1)
  end

end