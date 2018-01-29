class LoginPage < SitePrism::Page

  element :account_menu, 'a[class=my-account-link]'
  element :cpf_field, 'input[id=login-cpf]'
  element :password_field, 'input[id=login-password]'
  element :continue_btn, 'button[id=send2]'
  element :login_lable, '#maincontent > div > div.column.main > div.page-title-wrapper > h1 > span'

  #error messages
  element :cpf_error_msg, '#jq-loginvalidation-mgs'

  def send_CPF (cpf)
    wait_until_cpf_field_visible
    page.execute_script('arguments[0].value=arguments[1]', page.find('*[id="login-cpf"]'), cpf)
  end

  def send_password(password)
    wait_until_password_field_visible
    password_field.send_keys password
  end

  def clickLogin
    continue_btn.click
  end

  def clickMenu
    account_menu.click if wait_until_account_menu_visible
    account_menu.click
  end

  def getErrorMsg
      wait_until_cpf_error_msg_visible
      return cpf_error_msg.text
  end

  def isLoggedIn
    wait_until_login_lable_visible
    return login_lable.text
  end

end