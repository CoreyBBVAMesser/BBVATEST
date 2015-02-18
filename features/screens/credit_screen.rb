class CreditScreen < MediaMobile
	DEPOSIT_ACCOUNT = {
    "android" =>"* {text LIKE 'Creditcard *'} index:0", 
    "ios" => "* {text LIKE 'Creditcard *'} index:0",
    "web_mobile" => {}
	}

  TRANSACTION = {
    "android" =>"* {text LIKE 'Creditcard *'} index:0", 
    "ios" => "TransactionCell",
    "web_mobile" => {}

  }
  def screen_exists?
    wait(DEPOSIT_ACCOUNT)
  end

  def select_transaction_number(position)
    tap_in_cell_row(TRANSACTION, position)
  end

end