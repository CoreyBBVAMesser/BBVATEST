class TransactionListScreen < MediaMobile

	SCREEN = {
    "android" => "",
    "ios" => "UILabel text:'View card activity'",
    "web_mobile" => "",
  	}

	TRANSACTION = {
	"android" => "",
	"ios" => "scroll_to_cell(:row => 1, :section => 3)",
	"web_mobile" => "",
	}

	def screen_exists?
	  check(SCREEN)
  	end

	def select_transaction
		touch(TRANSACTION)
	end
end