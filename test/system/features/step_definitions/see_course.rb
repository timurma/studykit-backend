Then(/^I see course$/) do
  expect(page).to have_selector('#root > div > div > div > div > a')
end

When(/^I click on course$/) do
  find('#root > div > div > div > div > a').click
end

Then(/^I see info about course$/) do
  expect(page).to have_selector('#root > div > div')
  expect(page).to have_text('Автор')
  expect(page).to have_text('Дата создания')
  expect(page).to have_text('Теги')
end

Then(/^I not see "([^"]*)"$/) do |link|
  expect(page).to has_no_link?(link)
end