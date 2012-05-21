Feature: Manage Todos
	As a user
	I want to create and manage todos
	
	Scenario: Todo List
		Given I have a todo "Create rspec tests for app"
		When I go to the list of todos
		Then I should see "Create rspec tests for app"
		
	Scenario: Create Valid Todo
		Given I have no todos
		When I go to the list of todos
		And I fill in form with "Also create jasmine tests"
		And I press "Add"
		Then I should see "Also create jasmine tests"
		And I should have 1 todos
		
	Scenario: Adding an Invalid Todo
		Given I have no todos
		When I go to the list of todos
		And I fill in form with ""
		And I press "Add"
		Then I should see "Error adding todo!"
		And I should have 0 todos
		
	Scenario: Mark a Todo as complete
		Given I have no todos
		Given I have a todo "Create cucumber features"
		When I go to the list of todos
		And I check the todo
		Then the todo should be marked as completed
		
	Scenario: Unmark a Completed Todo
		Given I have a completed todo "Create cucumber features"
		When I go to the list of todos
		And I check the todo
		Then the todo should not be marked as completed