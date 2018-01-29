class RegisterPage < SitePrism::Page

  element :fullname_field, 'input[id=firstname]'
  element :email_field,'input[id=email_address]'
  element :date_birth_field,'input[id=dob]'
  element :telephone_field,'input[id=telephone]'
  element :alternative_phone_field,'input[id=alternative_telephone]'
  element :password_field,'input[id=password]'
  element :password_confirmation_field,'input[id=password-confirmation]'
  element :cep_field,'input[id=zip_code]'
  element :continue_btn, 'button[class=black-bg]'

  #error messages
  element :name_error_msg, '#firstname-error'
  element :email_error_msg, '#email_address-error'
  element :date_error_msg, '#dob-error'
  element :phone_error_msg, '#telephone-error'
  element :alternative_phone_error_msg, '#alternative_telephone-error'
  element :password_error_msg, '#password-error'
  element :password_confirmation_error_msg, '#password-confirmation-error'


  def sendKeysName(name)
      wait_until_fullname_field_visible
      fullname_field.send_keys name
  end

  def sendKeysEmail(email)
      wait_until_email_field_visible
      email_field.send_keys email
  end

  def sendKeysDate(date)
      wait_until_date_birth_field_visible
      date.each_char{ |item| date_birth_field.send_keys item}
  end

  def sendKeysPhone(phone)
      wait_until_telephone_field_visible
      telephone_field.send_keys phone
  end

  def sendKeysAlternativePhone(phone)
      wait_until_alternative_phone_field_visible
      alternative_phone_field.send_keys phone
  end

  def sendKeysPassword(password)
    wait_until_password_field_visible
    password.each_char{ |item| password_field.send_keys item}
  end

  def sendKeysConfirmPassword(password)
    wait_until_password_confirmation_field_visible
    password.each_char{ |item| password_confirmation_field.send_keys item}
  end

  def clickOnContinue
    continue_btn.click
  end

  def getErrorMsg(field)
    case field
      when "name"
          wait_until_name_error_msg_visible
          return name_error_msg.text
      when "email"
          wait_until_email_error_msg_visible
          return email_error_msg.text
      when "datebirth"
          wait_until_date_error_msg_visible
          return date_error_msg.text
      when "phone"
          hoverToScroll
          wait_until_phone_error_msg_visible
          return phone_error_msg.text
      when "second_phone"
          hoverToScroll
          wait_until_alternative_phone_error_msg_visible
          return alternative_phone_error_msg.text
      when "password"
          hoverToScroll
          wait_until_password_error_msg_visible
          return password_error_msg.text
      when "password_confirmation"
          hoverToScroll
          wait_until_password_confirmation_error_msg_visible
          return password_confirmation_error_msg.text
    end
  end

  #Hover is necessary to scroll the page in order to take a screenshot focused on the field
  def hoverToScroll
      find(:id, 'zip_code').hover
  end

  def isVisible(field)
    case field
      when "second_phone"
          return has_alternative_phone_error_msg?
      end
  end

end
