class WelcomeScreen < MediaMobile
	WELCOME_SCREEN  = {
		"android" => "", 
		"ios" => "UIWindow",
    	"web_mobile" => ""
	} 

	START_BUTTON  = {
		"android" => "", 
		"ios" => "button index:0",
    	"web_mobile" => ""
	} 


def screen_exists?()
	check_with_timeout(WELCOME_SCREEN)
end

def touch_start_button
	#wait(START_BUTTON)
	touch(START_BUTTON)
end
end
