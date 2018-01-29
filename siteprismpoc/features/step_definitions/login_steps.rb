page = LoginPage.new
register = RegisterPage.new

Given(/^I access the Riachuelo website$/) do
  visit('')
end

When(/^I click on Register icon$/) do
  page.clickMenu
end

And(/^click on Continuar$/) do
  page.clickLogin
end

Then(/^my registration should be transfered to register page$/) do
  expect(register.has_fullname_field?).to be(true)
end

Then(/^should display the error message "([^"]*)"$/) do |msg|
  #page.getErrorMessages
  # p find('#jq-loginvalidation-mgs').text
  # expect(find("#jq-loginvalidation-mgs")).to have_content(msg)
  expect(page.getErrorMsg).to eql(msg)
end

And(/^fill CPF "([^"]*)"$/) do |cpf|
  page.send_CPF(cpf)
end

And(/^fill password "([^"]*)"$/) do |password|
  page.send_password(password)
end

Then(/^should see the label "([^"]*)"$/) do |logged_Lable|
  expect( page.isLoggedIn).to eql(logged_Lable)
end