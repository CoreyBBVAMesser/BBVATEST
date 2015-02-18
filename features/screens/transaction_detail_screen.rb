class TransactionDetailScreen < MediaMobile

TDSCREEN = {
	"android" => "",
	"ios" => "UILabel text:'Details of transaction'",
	"web_mobile" => {}
	}

CC_TRANS_DATE = {
	"android" => "UILabel index:3",
	"ios" => "",
	"web_mobile" => {}
	}

CC_PO_DATE = {
	"android" => "",
	"ios" => "UILabel index:5",
	"web_mobile" => {}
	}

CC_DESC = {
	"android" => "",
	"ios" => "UILabel index:1",
	"web_mobile" => {}
	}

CC_AMOUNT = {
	"android" => "",
	"ios" => "UILabel index:0",
	"web_mobile" => {}
	}

CC_LOC = {
	"android" => "",
	"ios" => "",
	"web_mobile" => {}
	}

def screen_exists?
	check(TDSCREEN)
end

def cc_po_date
	check(CC_PO_DATE)
end

def cc_desc
	check(CC_DESC)
end

def cc_amount
	check(CC_AMOUNT)
end

def cc_trans_date
	check(CC_TRANS_DATE)
end

end