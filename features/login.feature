Feature: Login
	As a user
	I should enter correct login and password
	then I am correctly adressed

Scenario: Failed Login
	Given I am on the home page
	Then I should fill in "nome" with "dontexist"
	Then I should fill in "senha" with "nopassword"
	Then I submit
	Then I should be in "/login"

Scenario: Sucessful Login
	Given I am on the home page
	Then I should fill in "nome" with "iexist"
	Then I should read in "nome" the string "iexist"
	Then I should fill in "senha" with "1234"
	Then I should read in "senha" the string "1234"
	Then I submit
	Then I should be in "/alunos/12"

Scenario: Sucessful Logout
	Given I am on the home page
	Given I am logged in with "iexist" and "1234" as values
	Then I click in "Logout"
	Then i should not see "Página do iexist"