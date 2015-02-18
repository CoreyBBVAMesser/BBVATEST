class ForgotPasswordScreen < MediaMobile
	USERNAME_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'emailEditText'", 
		"ios" => "UITextFieldLabel index:0",
    	"web_mobile" => { }
	}

	ACCOUNT_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'accountEditText'",
		"ios" => "UITextFieldLabel index:1",
    	"web_mobile" => {}
	} 

	EMAIL_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'emailEditText'", 
		"ios" => "UITextFieldLabel index:2",
    	"web_mobile" => { }
	}

	SUBMIT_BUTTON = {
		"android" => "android.widget.Button id:'submitButton'",
		"ios" => "* text:'Continue'",
    	"web_mobile" => { "type" => "input", "expression" => {:id => "loginValidateSubmit"}}
	}

	FORGOT_PASSWORD_SCREEN_TITLE = {
		"android" => "* id:'titleTextView' text:'Forgot password'", 
		"ios" => "UISegment id:'Forgot password'",
    	"web_mobile" => { }
	}

	ERROR_SCREEN = {
		"android" => "", 
		"ios" => "ErrorMessagesContainerView",
    	"web_mobile" => ""
	} 

	ERROR_ACCEPT = {
		"android" => "", 
		"ios" => "UIButton index:'Accept'",
    	"web_mobile" => ""
	} 

	def wait_for_forgot_password_screen
		wait(FORGOT_PASSWORD_SCREEN_TITLE)
	end

	def fill_username(username)
		fill(USERNAME_FIELD, username)
	end

	def fill_email(email)
		fill(EMAIL_FIELD, email)
	end

	def fill_account_number(account_number)
		fill(ACCOUNT_FIELD, account_number )
	end

	def touch_submit_button
		touch(SUBMIT_BUTTON)
  	end

  	def wait_for_error_message
 		check(ERROR_SCREEN)
 	end

 	def touch_forgot_password
 		touch(FORGOT_PASSWORD_SCREEN_TITLE)
 	end


end