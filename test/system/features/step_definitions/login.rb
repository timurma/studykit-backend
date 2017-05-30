Given(/^I am at StudyKit\.com$/) do
  visit "http://46.101.216.31/"
end

Given(/^I am on form login$/) do
  expect(page).to have_selector('#auth-form')
end

Given(/^I type email with "([^"]*)"$/) do |text|
  fill_in('Электронная почта', with: text)
end

Given(/^I type password with "([^"]*)"$/) do |text|
  fill_in('Пароль', with: text)
end

And(/^I click "([^"]*)"$/) do |link_text|
  click_link(link_text)
end

When(/^I am see message with text "([^"]*)"$/) do |error_text|
  expect(page).to have_text(error_text)
end

When(/^I am main page$/) do
  current_path.should == "/"
end

When(/^I login$/) do
	find('#auth-submit').click
	sleep 1
end

