

Given(/^I am on form sign up$/) do
  expect(page).to have_selector('#signup-form')
end

And(/^I click button "([^"]*)"$/) do |button_text|
  click_button button_text
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |name, value|
  fill_in name, with: value
end

And(/^I click "([^"]*)"$/) do |link_text|
  click_link(link_text)
end

Then(/^I see message with text "([^"]*)"$/) do |message_text|
  expect(page).to have_text(message_text)
end

