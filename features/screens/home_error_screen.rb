class HomeErrorScreen < MediaMobile

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

def screen_exists?()
	check_with_timeout(ERROR_SCREEN)
end

def touch_accept
	touch(ERROR_ACCEPT)
end
end
