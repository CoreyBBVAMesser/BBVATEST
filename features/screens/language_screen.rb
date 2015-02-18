class LanguageScreen < MediaMobile

	ENGLISH_LANGUAGE_RADIO_BUTTON = {
		"android" =>"android.widget.RadioButton id:'englishRadioButton'",
		"ios" => "UIButtonLabel index:0",
    	"web_mobile" => { "type" => "label", "expression" => {:css => "label[for='englishLanguage']"}}
	}
	SPANISH_LANGUAGE_RADIO_BUTTON = {
		"android" =>"android.widget.RadioButton id:'spanishRadioButton'",
		"ios" => "UIButtonLabel index:1",
    	"web_mobile" => { "type" => "label", "expression" => {:css => "label[for='englishLanguage']"}}
	}
	SUBMIT_BUTTON = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomButton id:'acceptButton'", 
		"ios" => "UIButtonLabel index:2",
    	"web_mobile" => { "type" => "input", "expression" => {:id => "languageSubmit"}}
	}

	def screen_exists?()
		check_with_timeout(ENGLISH_LANGUAGE_RADIO_BUTTON) and check_element(SPANISH_LANGUAGE_RADIO_BUTTON) and check_element(SUBMIT_BUTTON)

	end

	def select_default_language()
		touch(ENGLISH_LANGUAGE_RADIO_BUTTON)
		touch(SUBMIT_BUTTON)
	end

	def select_language(language)
		if language == "es" then
			touch(ENGLISH_LANGUAGE_RADIO_BUTTON)
		else
			touch(SPANISH_LANGUAGE_RADIO_BUTTON)
		end
		touch(SUBMIT_BUTTON)
	end
end

