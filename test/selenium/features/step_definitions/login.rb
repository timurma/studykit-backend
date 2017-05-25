Given(/^I am at StudyKit\.com$/) do
  # visit "http://46.101.216.31"
end

Given(/^I am on form login$/) do
  visit "http://46.101.216.31/login"
end

Given(/^I type email with "([^"]*)"$/) do |text|
  
end

Given(/^I type password with "([^"]*)"$/) do |text|
  
end

And(/^I click "([^"]*)"$/) do |link_text|
  # click_link(link_text)
end

When(/^I am see error with text "([^"]*)"$/) do |error_text|
  
end

When(/^I am main page$/) do
  
end

When(/^I login$/) do
	find('#auth-submit').click
end

