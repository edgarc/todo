Given /^I have a todo "([^"]*)"$/ do |content|
  Todo.create!(:description => content)
end

When /^I go to the list of todos$/ do
  visit('/todos')
end

Then /^I should see "([^"]*)"$/ do |param|
  page.should have_content(param)
end

Given /^I have no todos$/ do
  Todo.delete_all
end

When /^I fill in form with "([^"]*)"$/ do |content|
  fill_in('todo_description', :with => content)
end

When /^I press "([^"]*)"$/ do |link|
  click_on(link)
end

Then /^I should have (\d+) todos$/ do |count|
  Todo.count.should == count.to_i
end

When /^I check the todo$/ do
  check('todo_cb')
end

Then /^the todo should be marked as completed$/ do
  page.has_css?('ul li.completed_true')
end

Given /^I have a completed todo "([^"]*)"$/ do |content|
    Todo.create!(:description => content, :complete=>true)
end

Then /^the todo should not be marked as completed$/ do
  page.has_css?('ul li.completed_false')
end