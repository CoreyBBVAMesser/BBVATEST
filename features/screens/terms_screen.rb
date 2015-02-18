class TermsScreen < MediaMobile

	HEADER = {
		"android" => "* text:'Terms of use'",
		"ios" => "* marked:'Terms of use'",
    	"web_mobile" => { "type" => "label", "expression" => {:css => "label[for='englishLanguage']"}}
	}
	DECLINE_BUTTON = {
		"android" =>"com.bbva.compassBuzz.commons.widget.CustomButton id:'declineButton'",
		"ios" => "UIButton index:0",
    	"web_mobile" => { "type" => "label", "expression" => {:css => "label[for='englishLanguage']"}}
	}
	ACCEPT_BUTTON = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomButton id:'acceptButton' enabled:true", 
		"ios" => "UIButton index:1",
    	"web_mobile" => { "type" => "input", "expression" => {:id => "languageSubmit"}}
	}

	def screen_exists?()
		check_with_timeout(HEADER)
	end

	def decline_terms()
		#wait(DECLINE_BUTTON)
		touch(DECLINE_BUTTON)
	end

	def accept_terms()
		#wait(ACCEPT_BUTTON)
		touch(ACCEPT_BUTTON)
	end
end

