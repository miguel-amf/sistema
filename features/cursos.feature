Feature: Cursos
	As a user
	I should be able to see all the Cursos and interact with them

Scenario: Viewing a Curso
	Given I am on the cursos page
	Then I should see "Violino" as a element

Scenario: Insert Curso
	Given I am on the cursos page
	Then I click in "Adicionar novo curso"
	Then I insert "aaaa" as nome, "9876" as codigo, "Bacharel" as titulo, "200" as credito
	Then I submit the curso
	Then I should be in "/cursos"
	Then I should see "aaaa" as a element