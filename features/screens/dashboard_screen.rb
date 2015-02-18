class DashboardScreen < MediaMobile

  attr_accessor :account_to_value, :account_from_value

	SCREEN_HEADER = {
    "android" => "* text:'Accounts'",
    "ios" => "UIWindow",
    "web_mobile" => { "type" => "h1", "expression" => {:class => "m-header-text", :text => "Accounts"}}
  }

	DEPOSIT_BUTTON = {
		"android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'titleTextView' text:'Deposit'", 
		"ios" => "* text:'Deposit'",
    "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
	} 
	ACCOUNT = {
    "android" =>"* {text LIKE 'Checking *'} index:0", 
		"ios" => "*",
    "web_mobile" => { "type" => "a", "expression" => {:css => '.m-accountList-left a'}}
	} 
	SLIDING_MENU_BUTTON = {
		"android" =>"android.widget.LinearLayout id:'rightContainer'", 
		"ios" => "UIBarButtonItemCustomButton index:0",
    "web_mobile" => { "type" => "i", "expression" => {}}
	} 
	LOGOUT_BUTTON = {
		"android" =>"com.bbva.compassBuzz.commons.widget.CustomButton id:'logoutButton' text:'Sign out'", 
		"ios" => "* text:'Sign out'",
    "web_mobile" => { "type" => "a", "expression" => {:css =>'div.m-menu-navUnit:nth-child(3) > a:nth-child(1)'}}
	} 
	CONFIRM_BUTTON = {
		"android" =>"com.bbva.compassBuzz.commons.widget.CustomButton id:'positiveButton'", 
		"ios" => "UIButtonLabel text:'Yes'",
    "web_mobile" => ""
	}

	TRANSFER_OPTION = {
		"android" => "com.bbva.compassBuzz.commons.ui.components.CheckableButton id:'transfersButton' text:'Transfers'",
		"ios" => "CompassBuzzBasicCell index:1",
		"web_mobile" => { "type" => "a", "expression" => {:css => 'li.m-menu-navUnit:nth-child(3) > a'}}
	}

	ACCOUNT_OPTION = {
  	"android" => "",
  	"ios" => "",
  	"web_mobile" => { "type" => "a", "expression" => {:css => 'li.m-menu-navUnit:nth-child(1) > a'}}
	}

	ACCOUNT_SECTION = {
  	"android" => "",
  	"ios" => "",
  	"web_mobile" => { "type" => "sections", "expression" => {:css => 'section li'}, "subtype" => "spans" , "subexpression" => {:css => "p:nth-child(2) span:nth-child(1)"}}
	}

	CD_AND_RETIREMENT_BUTTON = {
  	"android" => "",
  	"ios" => "UILabel text:'CD & Retirement'",
  	"web_mobile" => { }
  }

	CREDIT_BUTTON = {
  	"android" => "",
  	"ios" => "UIButton index:0",
  	"web_mobile" => { }
	}

	TABLE_ACCOUNT_TYPE_SELECTED = {
		"android" => "",
		"ios" => "label text:",
    "web_mobile" => { }
	}

	TABLE_SELECT_TYPE_ACCOUNT ={
		"android" => [
      "* id:'titleTextView' height:41",
      "* id:'accountsListView'"
    ],
		"ios" => "HdrView ",
    "web_mobile" => { }
	}
	TABLE = {
  	"android" => "",
  	"ios" => "UITableView ",
  	"web_mobile" => ""
  }

    CREDITCARD_IMAGE = {
    "android" => "",
    "ios" => "UIImageView index:0",
    "web_mobile" => { }
  }

    CREDITCARD_NICKNAME = {
    "android" => "",
    "ios" => "UILabel index:6",
    "web_mobile" => { }
  }

    CREDITCARD_EXPDATE = {
    "android" => "",
    "ios" => "UILabel index:2",
    "web_mobile" => { }
  }

    CREDITCARD_NUMBER = {
    "android" => "",
    "ios" => "UILabel index:0",
    "web_mobile" => { }
  }

    CREDITCARD_HOLDER = {
    "android" => "",
    "ios" => "UILabel index:1",
    "web_mobile" => { }
  }

    CREDITCARD_AVBAL = {
    "android" => "",
    "ios" => "UILabel index:5",
    "web_mobile" => { }
  }

    CREDITCARD_POSTBAL = {
    "android" => "",
    "ios" => "UILabel index:3",
    "web_mobile" => { }
  }

  def screen_exists?
	  wait(SCREEN_HEADER)
  end
  
  def select_deposit_option
  	#wait(DEPOSIT_BUTTON)
  	touch(DEPOSIT_BUTTON)
  end

  def select_account(account)
  	wait_screen_to_load(ACCOUNT, account)
  	touch_in_ui_component(ACCOUNT, account)
  end

  def open_sliding_menu
  	wait(DEPOSIT_BUTTON)
  	wait(SLIDING_MENU_BUTTON)
  	touch(SLIDING_MENU_BUTTON)
  end
	
  def touch_logout_button
  	if is_web_mobile?
  	  touch(LOGOUT_BUTTON)
  	  return
    end
  	sleep(4)
  	wait(LOGOUT_BUTTON)
  	touch(LOGOUT_BUTTON)
  end

  def confirm_exit_dialog
	  return if is_web_mobile?
    wait(CONFIRM_BUTTON)
	  touch(CONFIRM_BUTTON)
  end

  def touch_transfer_option
    touch(TRANSFER_OPTION)
  end

  def touch_account_option
    touch(ACCOUNT_OPTION)
  end

  def set_initial_value_acount(account_from, account_to)
    @account_from_value = get_account_value(ACCOUNT_SECTION, account_from).to_f
    @account_to_value = get_account_value(ACCOUNT_SECTION, account_to).to_f
  end

  def get_value_acounts_after_transaction(account_from, account_to)
    @account_from_value_after_transaction = get_account_value(ACCOUNT_SECTION, account_from).to_f
    @account_to_value_after_transaction = get_account_value(ACCOUNT_SECTION, account_to).to_f
  end

  def validate_accounts()
    @account_from_value.should? @account_from_value_after_transaction-@amount
    @account_to_value.should? @account_to_value_after_transaction+@amount
  end

  def select_cd_and_retirement_option
  	wait(CD_AND_RETIREMENT_BUTTON)
  	touch(CD_AND_RETIREMENT_BUTTON)
  end

  def touch_creditcard
  	touch(CREDIT_BUTTON)
  end

  def scroll_to_section(section)
  	scroll_to_cell_number(TABLE_SELECT_TYPE_ACCOUNT, section.to_i)
  end

  def click_on_section(section)
  	scroll_to_cell_number(TABLE_SELECT_TYPE_ACCOUNT, section.to_i)
  	select_cell(section)
  end

  def touch_account_type(account_type)
    touch_in_ui_component(TABLE_SELECT_TYPE_ACCOUNT, account_type)
  end

  def open_account_detail_screen(account_type)
  	wait_to_load(TABLE_ACCOUNT_TYPE_SELECTED,account_type)
  	sleep(4)  	
  end

  def touch_cell(name_cell)
  	wait(TABLE)
    touch_in_ui_component(TABLE, name_cell)
  end

  def creditcard_image
    check(CREDITCARD_IMAGE)
  end

  def check_cc_nickname(nickname)
    check(CREDITCARD_NICKNAME)
  end

  def check_cccardnumber(number)
    check(CREDITCARD_NUMBER)
  end

  def creditcard_expdate(number)
    check(CREDITCARD_EXPDATE)
  end

  def creditcard_holder(name)
    check(CREDITCARD_HOLDER)
  end

  def creditcard_avbal(number)
    check(CREDITCARD_AVBAL)
  end

  def creditcard_postbal(number)
    check(CREDITCARD_POSTBAL)
  end

end
