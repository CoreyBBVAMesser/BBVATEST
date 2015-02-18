class CreditcardDetail < MediaMobile
 

NAVBAR = {
    "android" => "* {text LIKE 'Checking *'} index:2", 
    "ios" =>  "UILabel ",
    "web_mobile" => { "type" => "a", "expression" => {:css => '.m-accountList-left a'}}
}

	def wait_for_creditcard_detail_screen(text)
		wait_screen_to_load(NAVBAR,text)
	end
end