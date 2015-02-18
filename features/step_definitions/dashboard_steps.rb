When(/^I scroll to group of accounts number (\d+)$/) do |section|
  @dashboard_screen = Dashboard.new
  @dashboard_screen.screen_exists?
  @dashboard_screen.scroll_to_section(section)
end

And(/^I touch header named "(.*?)"$/) do |account|
   @dashboard_screen.touch_account_type(account)
end

Then(/^I should see deposit screen$/) do
  @deposit_screen = Deposit.new
  @deposit_screen.screen_exists?
end

When(/^I select "(.*?)" account from the deposit accounts list$/) do |account|
  @deposit_screen.select_account(account)
end

Then(/^I should see transactions list screen$/) do
  @transaction_list_screen = TransactionListScreen.new
	@transaction_list_screen.screen_exists?
end

When(/^I select transaction number (\d+) from the transactions list$/) do |position|
  @transaction_list_screen.select_transaction_number(position.to_i)
end

Then(/^I should see transaction detail screen$/) do
  @transaction_detail_screen = TransactionDetail.new
  @transaction_detail_screen.screen_exists?
end

When(/^I select "(.*?)" account from accounts list$/) do |account|
	@dashboard_screen.select_account(account)
end

Given(/^I verify the amounts of from "(.*?)" and to "(.*?)" accounts$/) do |a_from, a_to|
  @dashboard_screen.set_initial_value_acount(a_from, a_to);
end

And(/^I verify amount account "(.*?)" and "(.*?)"$/) do |a_from, a_to|
  @dashboard_screen.get_value_acounts_after_transaction(a_from, a_to);
  @dashboard_screen.validate_accounts()
end

And(/^I count all transactions$/) do 
  @transactions_count = @transaction_list_screen.count_all_transactions.to_i
end

Then(/^I should see (\d+) position transaction detail screen$/) do |position|
  @position = position.to_i
  @transaction_detail_screen = TransactionDetail.new
  @transaction_detail_screen.screen_exists?
end

And(/^I swipe right in transaction detail as I can$/) do
  @transaction_detail_screen.swipe_right(@transactions_count, @position)
end

And(/^I swipe left in transaction detail as I can$/) do
  @transaction_detail_screen.swipe_left(@transactions_count, @position)
end


#TYPE ACCOUNTS 

Then(/^I should see "(.*?)" screen$/) do |account|
  @dashboard_screen.open_account_detail_screen(account)
end

#CHECKING 1

Then (/^I should see Checking account screen$/) do
  @checking_screen = Checking.new
  @checking_screen.wait_for_checking_screen_to_load
end

When (/^I touch transaction named "(.*?)"$/) do |check|
    @checking_screen.touch_cell(check)
end

Then(/^I should see plus sign$/) do
  @checking_screen_detail = CheckingDetail.new
  @checking_screen_detail.screen_exists?
  assert(@checking_screen_detail.is_check?, "This transaction is not a check")
end

When(/^I touch plus sign$/) do
  @checking_screen_detail.show_check
end

Then(/^I should see check images$/) do
  @checking_screen_detail.wait_for_images
end

#CREDITCARD

Then (/^I should see Creditcard screen$/) do 
  @creditcard_screen = CreditScreen.new 
  @creditcard_screen.screen_exists?
end

When(/^I select transaction number (\d+) from the creditcard transactions list$/) do |position|
  @creditcard_screen.select_transaction_number(position.to_i)
end



