Feature: Login
	As a user
	I should enter correct login and password
	then I am authenticated

Scenario: Login
	Given I am on the home page
	Then I should fill in "nome" with "mamfbr"
	Then I should fill in "senha" with "123"
	Then I press "Entrar"
	Then I should be in "/alunos/10"