class PasswordScreen < MediaMobile
	SUBMIT_BUTTON = {
		"android" => "android.widget.Button id:'submitButton'", 
		"ios" => "* marked:'Submit'",
    	"web_mobile" => { "type" => "input", "expression" => {:id => "validatePasswordSubmit"}}
	} 
	PASSWORD_SCREEN = {
		"android" => "* text:'Sign on'", 
		"ios" => "UINavigationItemView", #{}"UILabel index:7",
		"web_mobile" => { "type" => "h1", "expression" => {:css => ".m-headerModal-text"}}
  	}
	PASSWORD_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'passwordEditText'", 
		"ios" => "UITextFieldLabel index:1",
		"web_mobile" => { "type" => "input", "expression" => {:id => "password"}}
	} 
	TERMS_SCREEN = {
		"android" => "* text:'Terms of use'", 
		"ios" => "UINavigationBar id:'Terms of use'"
	}
	ACCEPT_TERMS_BUTTON = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomButton id:'acceptButton' enabled:'true'",
		"ios" => "UIButtonLabel index:1",
		"web_mobile" => ""
	}

	FORGOT_PASSWORD_BUTTON = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'forgotTextView'", 
		"ios" => "* marked:'Forgot your password?'",
		"web_mobile" => ""
	} 

	def wait_for_password_screen
		wait(PASSWORD_SCREEN)
	end

	def fill_valid_password(password)
		#wait(PASSWORD_FIELD)
		fill(PASSWORD_FIELD,password)
	end

	def fill_invalid_password(password)
		#wait(PASSWORD_FIELD)
		fill(PASSWORD_FIELD,password)
	end

	def touch_submit_button
		#wait(SUBMIT_BUTTON)
		touch(SUBMIT_BUTTON)
	end
	
  	def touch_forgot_password
  		#wait(FORGOT_PASSWORD_BUTTON)
  		touch(FORGOT_PASSWORD_BUTTON)
  	end

  	def wait_for_error_message(message)
 		wait_for_message(message.to_s)
 	end

  	def wait_for_error_messages(messages)
 		wait_for_any_message(messages)
 	end

 	def check_error_message(message)
 		check_message(message.to_s)
 	end
end
