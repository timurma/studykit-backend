Given(/^I am at StudyKit\.ru$/) do
  visit "http://46.101.216.31/"
end

Given(/^I not login$/) do
  if expect(page).to has_no_text('Выйти')
  else     
  	find('Выйти').click
  end
end

Given(/^I am on main page$/) do
  expect(page).to have_selector('#root > div > div > div')
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

# And(/^I click "([^"]*)"$/) do |link_text|
#   click_link(link_text)
# end

When(/^I am see message with text "([^"]*)"$/) do |error_text|
  expect(page).to have_text(error_text)
end

When(/^I am main page$/) do
  current_path.should == "/"
end

When(/^I click login$/) do
	find('#auth-submit').click
	sleep 1
end

Given(/^I login$/) do
  email = correct_email@gmail.com
  password = correct_password
  step 'I click "Войти"'
  step 'I am on form login'
  step 'I type email with #{email}'
  step 'I type password with #{password}'
  step 'I click login'
end

Given(/^I fill in "([^"]*)" with correct_password$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end


