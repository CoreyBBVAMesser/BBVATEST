Given(/^I select the menu option$/) do
  @dashboard_screen = Dashboard.new
  @dashboard_screen.open_sliding_menu
end

And(/^I touch the transfer option$/) do
  @dashboard_screen.touch_transfer_option
end

And(/^I select New Domestic Transfer$/) do
  @transfer_domestic_international_screen = TransferDomesticInternational.new
  @transfer_domestic_international_screen.touch_new_domestic_transfer
end

And(/^I enter a valid amount to transfer "(.*?)"$/) do |amount|
  @amount = amount.to_f
  @transfer_insert_screen.type_amount(amount)
end

And(/^I acknowledge and confirm all entries$/) do
  @transfer_insert_screen.continue_transfer
end

And(/^I verify that the data is correct before confirming the transfer$/) do
  @transfer_confirmation_screen = TransferConfirmation.new
  @transfer_confirmation_screen.validate_screen_transaction
  @transfer_confirmation_screen.confirm_operation
end

Then(/^I should see transfer error message "(.*?)"$/) do |msg|
  @transfer_insert_screen.check_message_error(msg.to_s)
end

And(/^I enter the number of days "(.*?)" that will make a future transfer$/) do |day|
  @transfer_insert_screen.type_day(day.to_i)
end

Then(/^I select a valid account from "(.*?)"$/) do |account|
  @transfer_insert_screen = TransferInsertScreen.new
  @transfer_insert_screen.select_account_from(account)
end

And(/^I select a valid account to "(.*?)"$/) do |account|
  @transfer_insert_screen.select_account_to(account)
end

Then(/^I confirm transfer and message "(.*?)"$/) do |msg|
  @transfer_screen = TransferScreen.new
  @transfer_screen.check_message_successful(msg)
end


And(/^I enter a valid amount to transfer$/) do
  @transfer_insert_screen.type_amount(rand.round(2))
end

And(/^I go to dashboard$/) do
  @dashboard_screen = Dashboard.new
  @dashboard_screen.open_sliding_menu
  @dashboard_screen.touch_account_option
end

And(/^I select New international$/) do
  @transfer_screen = TransferScreen.new
  @transfer_screen.wait_for_component_to_load
  @transfer_screen.tap_new_international
  @transfer_insert_screen = TransferInsertScreen.new
  @transfer_insert_screen.wait_for_element_to_load
end

Then (/^I tap over account selection$/) do
  @transfer_insert_screen.tap_element("account")
  @transfer_insert_screen.tap_detail_accordion
  @transfer_account = AccountSelectionTransfer.new
  @transfer_account.wait_for_element_to_load
  @transfer_account.tap_account
end

And(/^I tap over recipient selection$/) do
  @transfer_insert_screen.tap_element("recipient")
  @transfer_insert_screen.tap_detail_accordion
  @transfer_recipient = RecipientSelectionTransfer.new
  @transfer_recipient.wait_for_element_to_load
  @transfer_recipient.tap_recipient
end

And(/^I fill amount "(.*?)"$/) do |amount|
  @transfer_insert_screen.tap_element("amount")
  @transfer_insert_screen.type_amount(amount)
end

Then(/^I tap continue transfer$/) do
  @transfer_insert_screen.ok_in_keyboard
  @transfer_insert_screen.continue_transfer
end

Then(/^I see confirmation screen with "(.*?)"$/) do |amount|
    @transfer_confirmation = TransferConfirmation.new
    @transfer_confirmation.wait_for_element_to_load(amount)
    @transfer_confirmation.confirm_operation
end

Then (/^I should see confirmation message "(.*?)"$/) do |message|
  @transfer_confirmation.wait_for_element_to_load(message)
  @transfer_confirmation.check_label_confirm(message)
end
