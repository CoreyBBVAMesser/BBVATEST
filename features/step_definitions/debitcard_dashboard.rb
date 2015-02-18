And(/^I have a debitcard on file$/) do
  @dashboard_screen.check_dcaccounts_exist?
end

When(/^I select debitcard from accounts list$/) do |section|
  @dashboard_screen = Dashboard.new
  @dashboard_screen.screen_exists?
  @dashboard_screen.scroll_to_section(section)
end

And(/^I touch header named "(.*?)"$/) do |account|
   @dashboard_screen.touch_account_type(account)
end

Then(/^I should see debitcard screen$/) do
	@debitcard_screen = debitcardScreen.new
	@debitcard_screen.screen_exists?
end

And (/^I should see debitcard nickname$/) do
	@debitcard_screen.check_nickname
end

And (/^I should see debitcard number$/) do
	@debitcard_screen.check_cardnumber
end

And (/^I should see debitcard image$/) do
	@debitcard_screen.check_image
end

And (/^I should see debitcard expiration date$/) do
	@debitcard_screen.exp_date
end

And (/^I should see debitcard holder$/) do
	@debitcard_screen.holder
end

And (/^I should see debitcard available balance$/) do
	@debitcard_screen.av_balance
end

And (/^I should see debitcard posted balance$/) do
	@debitcard_screen.po_balance
end

When (/^I select transactions from debitcard screen$/) do |account|
	@debitcard_screen.select_account(account)
end

Then (/^I should see debitcard transactions list screen$/) do
	@debit_transaction_list_screen = DebitTransactionListScreen.new
	@debit_transaction_list_screen.screen_exists?
end

When (/^I select transaction number from the debitcard transactions list$/) do |position|
	@debit_transaction_list_screen.select_transaction_number(position.to_i)
end

Then (/^I should see debitcard transaction detail screen$/) do |account|
	@debit_transaction_detail_screen = TransactionDetailScreen.new
	@debit_transaction_deatil_screen.screen_exists?
end

And (/^I should see debitcard Transaction Date$/) do
	@debit_transaction_deatil_screen.dc_trans_date
end

And (/^I should see debitcard Posting Date$/) do
	@debit_transaction_deatil_screen.dc_po_date
end

And (/^I should see debitcard Description$/) do
	@debit_transaction_deatil_screen.dc_desc
end

And (/^I should see debitcard Amount$/) do
	@debit_transaction_deatil_screen.dc_amount 
end

And (/^I should see debitcard Location$/) do
	@debit_transaction_deatil_screen.dc_loc 
end

When (/^I select operations from debitcard screen$/) do |account|
	@debit_operations_list_screen.select_operations(account)
end

Then (/^I should see debitcard operations screen$/) do
	@debit_operations_list_screen = OperationsScreen.new
	@debit_operations_list_screen.screen_exists?
end

And (/^I should see Copy DebitCard Number$/) do
	@debit_operations_list_screen.check_copy_number
end

And (/^I should see Change DebitCard Nickname$/) do
	@debit_operations_list_screen.check_change_nickname
end
