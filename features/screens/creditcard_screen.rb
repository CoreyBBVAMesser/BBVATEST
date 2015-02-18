class CreditcardScreen < MediaMobile

	SCREEN = {
    "android" => "",
    "ios" => "UILabel index:3",
    "web_mobile" => { }
  }

	CREDITCARD_LMIT = {
    "android" => "",
    "ios" => "UILabel index:6",
    "web_mobile" => { }
  }

	CREDITCARD_DUEDATE = {
    "android" => "",
    "ios" => "UILabel index:9",
    "web_mobile" => { }
  }

	CREDITCARD_MINDUE = {
    "android" => "",
    "ios" => "UILabel index:8",
    "web_mobile" => { }
  }

  CREDITCARD_TRANS = {
    "android" => "",
    "ios" => "UILabel marked:'View card activity'",
    "web_mobile" => { }
  }

  CREDITCARD_BLOCK = {
    "android" => "",
    "ios" => "UILabel marked:'Lock card'",
    "web_mobile" => { }
  }

  CREDITCARD_NOTIFICATIONS = {
    "android" => "",
    "ios" => "UILabel marked:'Notifications'",
    "web_mobile" => { }
  }

  CREDITCARD_COPY_NUMBER = {
    "android" => "",
    "ios" => "UILabel marked:'Copy card number'",
    "web_mobile" => { }
  }

  CREDITCARD_CHANGE_NICK = {
    "android" => "",
    "ios" => "UILabel marked:'Change nickname'",
    "web_mobile" => { }
  }


  def screen_exists?
    wait(SCREEN)
  end

  def creditcard_limit(number)
  	check(CREDITCARD_LMIT)
  end

  def creditcard_duedate(number)
  	check(CREDITCARD_DUEDATE)
  end

  def creditcard_mindue(number)
  	check(CREDITCARD_MINDUE)
  end

  def touch_transactions
    touch(CREDITCARD_TRANS)
  end

  def check_cc_block
    check(CREDITCARD_BLOCK)
  end

  def check_cc_copy_number
    check(CREDITCARD_COPY_NUMBER)
  end

  def check_cc_change_nick
    check(CREDITCARD_CHANGE_NICK)
  end

  def check_cc_notifications
    check(CREDITCARD_NOTIFICATIONS)
  end

end

