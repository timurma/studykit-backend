Given(/^I am at google\.ru$/) do
  visit "http://google.com/"
end

Given(/^I type 'Ришат дурак'$/) do
 find("#lst-ib").set "Ришат дурак"
end

Then(/^I click button$/) do
  find('#tsf > div.tsf-p > div.jsb > center > input[type="submit"]:nth-child(1)').click
end