Given(/^I am in transactions list screen$/) do
  account = env_config['autenticacion']['checking_account']

  steps %Q{
    Given I am successfuly logged in
    When I select "#{account}" account from accounts list
    Then I should see transactions list screen
  }
  @transaction_list_screen = TransactionListScreen.new
end

When(/^I sort by date$/) do
  @transaction_list_screen.touch_sort_type_button(0)
end

When(/^I sort by text$/) do
  @transaction_list_screen.touch_sort_type_button(1)
end

When(/^I sort by amount$/) do
  @transaction_list_screen.touch_sort_type_button(2)
end

And(/^I select sort direction (.*?)$/) do |direction|
  desc = direction.equal? "desc"
  @transaction_list_screen.touch_sort_button(desc)
end

Then(/^I should see transactions list sorted by date in (.*?) direction$/) do |direction|
  desc = direction.equal? "desc"
  assert(@transaction_list_screen.are_transactions_sorted_by_date(desc), "Transactions aren't sorted by date #{desc ? 'descendant' : 'ascendant'}")
end

Then(/^I should see transactions list sorted by text in (.*?) direction$/) do |direction|
  desc = direction.equal? "desc"
  assert(@transaction_list_screen.are_transactions_sorted_by_text(desc), "Transactions aren't sorted by text #{desc ? 'descendant' : 'ascendant'}")
end

Then(/^I should see transactions list sorted by amount in (.*?) direction$/) do |direction|
  desc = direction.equal? "desc"
  assert(@transaction_list_screen.are_transactions_sorted_by_amount(desc), "Transactions aren't sorted by amount #{desc ? 'descendant' : 'ascendant'}")
end