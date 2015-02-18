class RememberedUserScreen < MediaMobile
	
	REMEMBERED_USER_SCREEN = {
		"android" => "* text:'Welcome'", 
		"ios" => "UILabel index:'Information'",
    	"web_mobile" => { "type" => "p", "expression" => {:css => "p.g-textL"}}
	} 
	REMEMBERED_USER_SUBMIT_BUTTON = {
		"android" => "* text:'Submit'", 
		"ios" => "* marked:'Continue'",
    	"web_mobile" => { "type" => "input", "expression" => {:id => "loginKnownUserSubmit"}}
	} 
	FORGOT_YOUR_USERNAME = {
		"android" => "", 
		"ios" => "UIButton index:2"
	}	

	def screen_exists?()
		wait(REMEMBERED_USER_SCREEN)
	end

	def touch_submit_button
		#wait(REMEMBERED_USER_SUBMIT_BUTTON)
		touch(REMEMBERED_USER_SUBMIT_BUTTON)
	end

	def touch_forgot_username_button()
		#wait(FORGOT_YOUR_USERNAME)
		touch(FORGOT_YOUR_USERNAME)
	end
end