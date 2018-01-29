register = RegisterPage.new

When(/^fill the name field with "([^"]*)"$/) do |name|
    register.sendKeysName(name)
end

When(/^fill the email field with "([^"]*)"$/) do |email|
    register.sendKeysEmail(email)
end

When(/^fill the date birth field with "([^"]*)"$/) do |date|
  register.sendKeysDate(date)
end

When(/^fill the phone field with "([^"]*)"$/) do |phone|
    register.sendKeysPhone(phone)
end

When(/^fill the alternative phone field with "([^"]*)"$/) do |alternativePhone|
  #find(:id, 'alternative_telephone').hover
  register.sendKeysAlternativePhone(alternativePhone)
end

When(/^fill the password field with "([^"]*)"$/) do |password|
    register.sendKeysPassword(password)
end

When(/^fill the password confirmation field with "([^"]*)"$/) do |password|
    register.sendKeysConfirmPassword(password)
end

And(/^click on process button$/) do
    register.clickOnContinue
    #find(:id, 'password-confirmation').hover
end

Then(/^should display the error message "([^"]*)" below "([^"]*)" field$/) do |msg, field|
    expect(register.getErrorMsg(field)).to eql(msg)
end

Then(/^should not display the error message "([^"]*)" below "([^"]*)" field$/) do |msg, field|
    expect(register.isVisible(field)).to be false
    register.hoverToScroll
end

And(/^fill the form out with valid data$/) do |table|
  # table is a table.hashes.keys # => [:name, :Maria Mercedez]
    data = table.rows_hash
    register.sendKeysName(data["name"])
    register.sendKeysEmail(data["email"])
    register.sendKeysDate(data["date birth"])
    register.sendKeysPhone(data["phone"])
    register.sendKeysAlternativePhone(data["alternative phone"])
    register.sendKeysPassword(data["password"])
    register.sendKeysConfirmPassword(data["password confirmation"])
end