And(/^I have a creditcard on file$/) do
  @dashboard_screen.check_ccaccounts_exist?
end

When(/^I see creditcard$/) do
	@dashboard_screen.creditcard_image
end

When(/^I select creditcard from accounts list$/) do 
  @dashboard_screen.touch_creditcard
end

And(/^I touch header named "(.*?)"$/) do |account|
   @dashboard_screen.touch_account_type(account)
end

Then(/^I should see creditcard screen$/) do
	@creditcard_screen = CreditcardScreen.new
	@creditcard_screen.screen_exists?
end

And (/^I should see creditcard nickname "(.*?)"$/) do | nickname |
	@dashboard_screen.check_cc_nickname(nickname)
end

And (/^I should see creditcard number "(.*?)"$/) do | number |
	@dashboard_screen.check_cccardnumber(number)
end

And (/^I should see creditcard image$/) do
	@dashboard_screen.creditcard_image
end

And (/^I should see creditcard expiration date "(.*?)"$/) do | number |
	@dashboard_screen.creditcard_expdate(number)
end

And (/^I should see creditcard holder "(.*?)"$/) do | name |
	@dashboard_screen.creditcard_holder(name)
end

And (/^I should see creditcard available balance "(.*?)"$/) do | number |
	@dashboard_screen.creditcard_avbal(number)
end

And (/^I should see creditcard posted balance "(.*?)"$/) do | number |
	@dashboard_screen.creditcard_postbal(number)
end

And (/^I should see creditcard limit "(.*?)"$/) do | number |
	@creditcard_screen.creditcard_limit(number)
end

And (/^I should see creditcard payment due date "(.*?)"$/) do | number |
	@creditcard_screen.creditcard_duedate(number)
end

And (/^I should see creditcard minimum payment due "(.*?)"$/) do | number |
	@creditcard_screen.creditcard_mindue(number)
end

When (/^I select transactions from creditcard screen$/) do
	@creditcard_screen.touch_transactions
end

Then (/^I should see creditcard transactions list screen$/) do
	@transaction_list_screen = TransactionListScreen.new
	@transaction_list_screen.screen_exists?
end

When (/^I select transaction number from the transactions list$/) do
	@transaction_list_screen.select_transaction_number
end

Then (/^I should see creditcard transaction detail screen$/) do 
	@transaction_detail_screen = TransactionDetailScreen.new
	@transaction_detail_screen.screen_exists?
end

And (/^I should see creditcard Transaction Date$/) do
	@transaction_detail_screen.cc_trans_date
end

And (/^I should see creditcard Posting Date$/) do
	@transaction_detail_screen.cc_po_date
end

And (/^I should see creditcard Description$/) do
	@transaction_detail_screen.cc_desc
end

And (/^I should see creditcard Amount$/) do
	@transaction_detail_screen.cc_amount 
end

When (/^I select operations from creditcard screen$/) do |account|
	@creditcard_screen.select_operations(account)
end

Then (/^I should see operations screen$/) do
	@creditcard_screen = OperationsScreen.new
	@creditcard_screen.screen_exists?
end

And (/^If the card is new$/) do
	@creditcard_screen.check_newcard
end

Then (/^I should see Activate Card$/) do
	@creditcard_screen.activate_card
end

And (/^I should see Block Card$/) do
	@creditcard_screen.check_cc_block
end
And (/^I should see Unblock Card$/) do
	@creditcard_screen.check_cc_unblock
end

And (/^I should see Request PIN$/) do
	@creditcard_screen.check_cc_requestpin
end

And (/^I should see Change PIN$/) do
	@creditcard_screen.check_cc_changepin
end

And (/^I should see Copy Card Number$/) do
	@creditcard_screen.check_cc_copy_number
end

And (/^I should see Change Nickname$/) do
	@creditcard_screen.check_cc_change_nick
end

And (/^I should see Display CVV2$/) do
	@creditcard_screen.check_cc_cvv2
end

And (/^I should see creditcard Notifications$/) do
	@creditcard_screen.check_cc_notifications
end