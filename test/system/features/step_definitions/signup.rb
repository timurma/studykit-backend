Given(/^I am on form sign up$/) do
  expect(page).to have_selector('#auth-form')
end

Given(/^I type name with "([^"]*)"$/) do |text|
fill_in(id: 'firstName', with: text)
end

Given(/^I type surname with "([^"]*)"$/) do |text|
fill_in(id: 'lastName', with: text)
end

Then(/^I change login form$/) do
  find('#auth-change').click
	sleep 1
end

Then(/^I sign up$/) do
  find('#auth-submit').click
	sleep 1
end