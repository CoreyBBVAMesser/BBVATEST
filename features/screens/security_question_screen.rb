class SecurityQuestionScreen < MediaMobile

	#------------
	#TO DO: QUITAR EL DICCIONARIO SECURITY ANSWER Y COLOCAR LOS DATOS DESDE EL FEATURE
	#------------

	SECURITY_QUESTION_SCREEN = {
		"android" => "* text:'Security Question'", 
		"ios" => "* marked:'Security Question'",
    "web_mobile" => { "type" => "h1", "expression" => {:class => "m-headerModal-text", :text => "Security question"}}
	} 
	SECURITY_QUESTION_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'answerEditText'", 
		"ios" => "UITextfield index:0" ,
    "web_mobile" => { "type" => "input", "expression" => {:id => "securityAnswer"}}
	} 
	REMEMBER_ME_BUTTON = {
		"android" => "android.widget.Switch id:'rememberMeCheckbox'", 
		"ios" => "UISwitch index:0",
    "web_mobile" => [
    	{ "type" => "input", "expression" => {:id => "rememberDevice"}},
    	{ "type" => "label", "expression" => {:css => "label[for='rememberDevice']"}}
    ]
	} 
	SUBMIT_BUTTON_SECURITY_QUESTION = {
		"android" => "android.widget.Button id:'submitButton'", 
		"ios" => "* text:'Submit'",
    "web_mobile" => { "type" => "input", "expression" => {:id => "validateQuestionSubmit"}}
	}

	ERROR_MESSAGE = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'message'",
		"ios" => "TSMessageView ",
    	"web_mobile" => { }
		
	}

	def screen_exists?()
		check_with_timeout(SECURITY_QUESTION_SCREEN, 20)
	end

	def fill_security_question(answer)
		#wait(SECURITY_QUESTION_FIELD)
		fill(SECURITY_QUESTION_FIELD, answer)
	end

	def touch_submit_button
		#wait(SUBMIT_BUTTON_SECURITY_QUESTION)
		touch(SUBMIT_BUTTON_SECURITY_QUESTION)
	end

	def switch_off_remember_device
		#wait(REMEMBER_ME_BUTTON)
		switch_status(REMEMBER_ME_BUTTON, false)
	end

	def switch_on_remember_device
		#wait(REMEMBER_ME_BUTTON)
		switch_status(REMEMBER_ME_BUTTON, true)
	end

	def wait_for_confirmation_message
		wait(REMEMBER_PASSWORD_MESSAGE)
	end

	def wait_for_dismiss_message
		wait_for_element_not_exist(REMEMBER_PASSWORD_MESSAGE)
	end

  	def wait_for_error_message(message)
 		wait_for_message(message.to_s)
 	end
end