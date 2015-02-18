Given(/^I am in search transactions screen$/) do
  account = env_config['autenticacion']['checking_account']

  steps %Q{
    Given I am successfuly logged in
    When I select "#{account}" account from accounts list
    Then I should see transactions list screen
    When I touch on option number 0 of I want to button
    Then I should see search transactions screen
  }
end 

When(/^I touch on option number (\d*) of I want to button$/) do |option|
  @transaction_list_screen.touch_i_want_to_button
  @transaction_list_screen.touch_option_of_iwt_button(option)
end

Then(/^I should see search transactions screen$/) do
  @search_transaction_screen = SearchTransactionScreen.new
  @search_transaction_screen.screen_exists?
end

When(/^I fill amounts with "(.*?)" and "(.*?)"$/) do |amount_from, amount_to|
  @search_transaction_screen.fill_amounts(amount_from.to_s, amount_to.to_s)
end
    
Then(/^I should see only transactions with amount between "(.*?)" and "(.*?)"$/) do |amount_from, amount_to|
  @filtered_transaction_list_screen = FilteredTransactionListScreen.new
  @filtered_transaction_list_screen.screen_exists?
  assert(@filtered_transaction_list_screen.are_transactions_filtered_by_amount(amount_from.to_s, amount_to.to_s), "Transactions are not filtered by amount")
end

When(/^I fill search field with "(.*?)"$/) do |text_search|
  @search_transaction_screen.fill_search(text_search.to_s)
end

Then(/^I should see only transactions with text "(.*?)"$/) do |text_search|
  @filtered_transaction_list_screen = FilteredTransactionListScreen.new
  @filtered_transaction_list_screen.screen_exists?
  assert(@filtered_transaction_list_screen.are_transactions_filtered_by_text(text_search.to_s), "Transactions are not filtered by text")
end

When(/^I fill date picker with date from "(.*?)","(.*?)" and date end "(.*?)","(.*?)"$/) do |day_from, month_from, day_to, month_to|
  @search_transaction_screen.touch_date_from(day_from.to_i, month_from.to_i)
  @search_transaction_screen.touch_date_to(day_to.to_i, month_to.to_i)
end

When(/^I fill date from picker with (\d+) days before today$/) do |days_offset|
  the_date = Date.today
  the_date -= days_offset.to_i
  @search_transaction_screen.touch_date_from(the_date.day, the_date.month)
end

And(/^I fill date to picker with (\d+) days before today$/) do |days_offset|
  the_date = Date.today
  the_date -= days_offset.to_i
  @search_transaction_screen.touch_date_to(the_date.day, the_date.month)
end

Then(/^I should see only transactions with date between "(.*?)","(.*?)" and "(.*?)","(.*?)" and year "(.*?)"$/) do |day_from, month_from, day_to, month_to, year|
  @filtered_transaction_list_screen = FilteredTransactionListScreen.new
  @filtered_transaction_list_screen.screen_exists?
  assert(@filtered_transaction_list_screen.are_transactions_filtered_by_date(day_from.to_i, month_from.to_i, day_to.to_i, month_to.to_i, year.to_i), "Transactions are not filtered by date")
end

Then(/^I should see only transactions with date between (\d+) and (\d+) days before today$/) do |date_from_offset, date_to_offset|
  @filtered_transaction_list_screen = FilteredTransactionListScreen.new
  @filtered_transaction_list_screen.screen_exists?
  
  from_date = Date.today
  from_date -= date_from_offset.to_i
  to_date = Date.today
  to_date -= date_to_offset.to_i

  assert(@filtered_transaction_list_screen.are_transactions_filtered_by_date(from_date.day, from_date.month, to_date.day, to_date.month), "Transactions are not filtered by date")
end

When (/^I turn 'only checks' switch on$/) do 
   @search_transaction_screen.select_checks_only
end

Then (/^I should see list of checks$/) do
   @filtered_transaction_list_screen = FilteredTransactionListScreen.new
   @filtered_transaction_list_screen.screen_exists?
   assert(@filtered_transaction_list_screen.are_transactions_filtered_by_check, "Transactions are not filtered by check")
end

And(/^I touch apply filters button$/){
  @search_transaction_screen.touch_apply_filters_button
}


