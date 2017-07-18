Then(/^I see button for subscribe$/) do
  expect(page).to have_text('Подписаться')
end

Then(/^I subscribe$/) do
  find('#root > div > div > div > div.col-4 > div > div > button').click
end

Then(/^I see button for unsubscribe$/) do
  expect(page).to have_text('Отписаться')
end
