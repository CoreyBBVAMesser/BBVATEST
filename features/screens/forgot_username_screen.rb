class ForgotUsernameScreen < MediaMobile
	ACCOUNT_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'accountNumberEditText'", 
		"ios" => "UITextFieldLabel index:1",
    	"web_mobile" => {}
	} 

	EMAIL_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'emailEditText'", 
		"ios" => "UITextFieldLabel index:2",
    	"web_mobile" => { }
	}

	FORGOT_SUBMIT_BUTTON = {
		"android" => "android.widget.Button id:'submitButton'", 
		"ios" => "* text:'Continue'",
    	"web_mobile" => { "type" => "input", "expression" => {:id => "loginValidateSubmit"}}
	}

	FORGOT_USERNAME_SCREEN_TITLE = {
		"android" => "* id:'titleTextView' text:'Forgot username'",
		"ios" => "UINavigationBar id:'Forgot username'",
    	"web_mobile" => { }
	}

	SECURITY_QUESTION_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'answerEditText'", 
		"ios" => "UITextFieldLabel index:'Your answer'" ,
    	"web_mobile" => { "type" => "input", "expression" => {:id => "securityAnswer"}}
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

	FORGOT_PASSWORD_BUTTON = {
		"android" => "", 
		"ios" => "UISegment id:'Forgot Password'",
    	"web_mobile" => ""
	} 

	FORGOT_USER_COMFORMATION = {
	"android" => "", 
	"ios" => "* {text CONTAINS 'Your username reminder'}",
	"web_mobile" => ""
	} 



	def wait_for_forgot_username_screen
		wait(FORGOT_USERNAME_SCREEN_TITLE)
	end

	def fill_account_number(account_number)
		#wait(ACCOUNT_FIELD)
		fill(ACCOUNT_FIELD, account_number)
	end

	def fill_account_number(account_number)
		#wait(ACCOUNT_FIELD)
		fill(ACCOUNT_FIELD, account_number)
	end

	def fill_primary_email(email)
		#wait(EMAIL_FIELD)
		fill(EMAIL_FIELD, email)
	end
	
	def touch_submit_button
		#wait(FORGOT_SUBMIT_BUTTON)
		touch(FORGOT_SUBMIT_BUTTON)
  	end

  	def wait_for_error_message(message)
 		check(ERROR_SCREEN)
 	end

 	def fill_security_question(answer)
		#wait(SECURITY_QUESTION_FIELD)
		fill(SECURITY_QUESTION_FIELD, answer)
	end

	def touch_accept
		touch(ERROR_ACCEPT)
	end

	def touch_forgot_password
 		touch(FORGOT_PASSWORD_BUTTON)
 	end

 	def security_screen_exists?
 		check(SECURITY_QUESTION_FIELD)
 	end

	def forgot_user_conformation(message)
		check(FORGOT_USER_COMFORMATION)
	end

 end