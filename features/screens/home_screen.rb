class HomeScreen < MediaMobile
	USERNAME_FIELD = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomEditText id:'userNameEditText'", 
		"ios" => "UITextFieldLabel index:0",
    "web_mobile" => { "type" => "input", "expression" => {:id => "username"}}
	} 

	REMEMBER_ME_BUTTON = {
		"android" => "android.widget.Switch id:'rememberMeSwitch'", 
		"ios" => "UISwitch",
    "web_mobile" => [
    	{ "type" => "input", "expression" => {:id => "onoffswitch02"}},
    	{ "type" => "label", "expression" => {:css => "label[for='onoffswitch02']"}}
    ]
 	}

	SUBMIT_BUTTON = {
		"android" => "android.widget.Button id:'submitButton'", 
		"ios" => "UIButtonLabel index:1",
    "web_mobile" => { "type" => "input", "expression" => {:id => "loginValidateSubmit"}}
	}

	HOME_SCREEN_TITLE = {
		"android" => "* text:'Sign in'", 
		"ios" => "UINavigationItemView",
    "web_mobile" => { }
	}

	FORGOT_USERNAME_BUTTON = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'forgotTextView'", 
		"ios" => "UIButtonLabel text:'Forgot your username or password?'",
    "web_mobile" => { }
	}

	MESSAGE = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'message'", 
		"ios" => "UIButtonLabel ",
    "web_mobile" => { }
	}

	LANGUAGE_VERIFICATION = {
		"android" => "", 
		"ios" => "UILabel ",
    "web_mobile" => { }
	}

	CLOSE_WEBVIEW = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomButton  id:'loginButton'", 
		"ios" => "UIBarButtonItemCustomButton",
    "web_mobile" => { "type" => "a", "expression" => {:css => ".g-marginM"}}
	}

	WEBVIEW = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomButton  id:'loginButton'", 
		"ios" => "UIWebView",
    "web_mobile" => { "type" => "a", "expression" => {:css => ".g-marginM"}}
	}

	WEBVIEW_BROWSER = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomButton  id:'lo'", 
		"ios" => "UIWebBrowserView",
    	"web_mobile" => { "type" => "a", "expression" => {:css => ".g-marginM"}}
	}

	REMEMBERED_USER_BUTTON = {
		"android" => "* {text CONTAINS 'Sign In to Mobile Banking'}", 
		"ios" => "* {text CONTAINS 'Sign In to Mobile Banking'}",
    "web_mobile" => { "type" => "p", "expression" => {:css => "p.g-textL"}}
	}

	IM_NOT_BUTTON = {
		"android" => "* text:'Welcome'", 
		"ios" => "* {text CONTAINS 'I'm not}",
    "web_mobile" => { "type" => "p", "expression" => {:css => "p.g-textL"}}
	}

	def check_if_webview_exist
		if check_with_timeout(WEBVIEW_BROWSER)
			wait(CLOSE_WEBVIEW)
  		touch(CLOSE_WEBVIEW)
		end
	end

	def wait_for_home_screen
		check_if_webview_exist
		wait(USERNAME_FIELD)
		wait(SUBMIT_BUTTON)
	end

	def wait_for_home_screen_menu
		wait(HOME_SCREEN_TITLE,120)
	end

	def fill_username(username)
		#wait(USERNAME_FIELD)
		fill(USERNAME_FIELD, username)
	end

	def fill_invalid_username(username)
		#wait(USERNAME_FIELD)
		fill(USERNAME_FIELD, username)
	end
	
	def touch_submit_button
		#wait(SUBMIT_BUTTON)
		touch(SUBMIT_BUTTON)
 	end

 	def wait_for_error_message(message)
 		wait_for_message(message.to_s)
 	end

 	def touch_forgot_username_button
 		#wait(FORGOT_USERNAME_BUTTON)
 		touch(FORGOT_USERNAME_BUTTON)
 	end

 	def check_idiom(translated)
	    wait_screen_to_load(LANGUAGE_VERIFICATION,translated)
 	end

	def wait_for_remembered_user_screen
		wait(REMEMBERED_USER_BUTTON)
	end

	def touch_remembered_user_submit_button
		touch(REMEMBERED_USER_BUTTON)
	end

	def switch_on_remember_user
		touch(REMEMBER_ME_BUTTON)
		#switch_status(REMEMBER_ME_BUTTON, true)
	end

	def switch_off_remember_user
		touch(REMEMBER_ME_BUTTON)
		#switch_status(REMEMBER_ME_BUTTON, false)
	end

	def touch_imnot_username_button
		#wait(IM_NOT_BUTTON)
		touch(IM_NOT_BUTTON)
	end



end