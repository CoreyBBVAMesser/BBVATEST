And(/^I select a creditcard$/) do
	@dashboard_screen = Dashboard.new
	@dashboard_screen.scroll_to_section(section)
	@dashboard_screen.touch_account_type(account)
	@creditcard_screen = CreditcardScreen.new
end

When (/^I touch Accept$/) do
	@changepin_screen.touch_accept_button
end

When (/^I select change pin$/) do
	@changepin_screen = PinScreen.new
	@changepin_screen.change_pin
end

Then (/^I should see change pin screen$/) do
	@changepin_screen = ChangepinScreen.new
	@changepin_screen.screen_exists?
end

When (/^I change pin from "(.*?)" to "(.*?)"$/) do |newpin|
	@changepin_screen.fill_new_pin(newpin)
	@changepin_screen.fill_confirm_new_pin(newpin)
	@changepin_screen.touch_accept_button
end

Then (/^I should see message in change pin screen$/) do |message|
	@changepin_screen.pinconfirmation_message(message_pin)
end

When (/^I enter new pins that do not match "(.*?)" to "(.*?)"$/) do |pin, newpin|
	@changepin_screen.fill_new_pin(newpin)
	@changepin_screen.fill_wrong_pin(wrongpin)
	@changepin_screen.touch_accept_button
end

Then (/^I should see error message in change pin screen$/) do |message|
	@changepin_screen.error_pinmatch_message(message_matchpin)
end

Then (/^I should see error message in change pin screen$/) do |message|
	@changepin_screen.error_pinsame_message(message_samepin)
end

And (/^I have selected operations$/) do |account|
	@operations_list_screen.select_operations(account)
end

When (/^I have entered a new creditcard$/) do
	@creditcard_screen.cardnew
end

Then (/^I should see activate$/) do
	@creditcard_screen.check_activate
end

And (/^I should see all other operations disabled$/) do
  pending # express the regexp above with the code you wish you had
end

When (/^I press activate$/) do
	@creditcard_screen.activate
end

Then (/^I should see confirmation message$/) do |message|
	@password_screen.confirmation_message(message)
end


Then (/^I should see error message$/) do |message|
	@password_screen.wait_for_error_message(message)
end

When (/^I select block card$/) do
	@block_screen = BlockScreen.new
	@block_screen.block_screen
end

Then (/^I select temporary$/) do
	@block_screen.temp_block
end

Then (/^I should see message in block options screen$/) do |message|
	@block_screen.tempblock_message
end

Then (/^I should see error message in block options screen$/) do |message|
	@block_screen.tempblock_error_message
end

When (/^I select unblock card$/) do
	@block_screen = BlockScreen.new
	@block_screen.block_screen
end

Then (/^I select unblock$/) do
	@block_screen.tap_unblock
end

Then (/^I should see message in unblock screen$/) do |message|
	@block_screen.unblock_message
end

Then (/^I should see error message in unblock screen$/) do |message|
	@block_screen.unblock_error_message
end

When (/^I select request pin$/) do
	@pin_screen = PinScreen.new
	@pin_screen.request_pin
end

Then (/^I should see message in request pin screen$/) do |message|
	@pin_screen.requestpin_message(requestpin_message)
end

Then (/^I should see error message in request pin screen$/) do |message|
	@pin_screen.requestpin_error_message
end

When (/^I select copy card number$/) do
	@operations_list_screen.copy_number
end

Then (/^I should see copy card number screen message$/) do
	@copy_card_screen = CopycardScreen.new
	@copy_card_screen.copy_card_message
end

When (/^I select change nickname$/) do
 	@changenickname_screen = ChangenicknameScreen.new
 end

Then (/^I should see change nickname screen$/) do
 	@changenickname_screen.screen_exists?
end

When (/^I change nickname from "(.*?)" to "(.*?)"$/) do |nickname, newnickname|
	@changenickname_screen.fill_current_nickname(nickname)
	@changenickname_screen.fill_new_nickname(newnickname)
	@changenickname_screen.fill_confirm_newnickname(newnickname)
	@changenickname_screen.touch_submit_button
end

When (/^I enter nicknames that do not match "(.*?)" to "(.*?)"$/) do |newnickname, wrongnickname|
	@changenickname_screen.fill_current_nickname(nickname)
	@changenickname_screen.fill_new_nickname(newnickname)
	@changenickname_screen.fill_wrong_nickname(wrongnickname)
	@changenickname_screen.touch_submit_button
end

When (/^I enter new nickname that matches old "(.*?)" to "(.*?)"$/) do |nickname, oldnickname|
	@changenickname_screen.fill_current_nickname(nickname)
	@changenickname_screen.fill_old_nickname(oldnickname)
	@changenickname_screen.fill_old_nickname(oldnickname)
	@changenickname_screen.touch_submit_button
end

Then (/^I should see confirmation message in the change nickname screen$/) do |message|
	@changenickname_screen.nickname_confirm_message
end

Then (/^I should see error message in the change nickname screen$/) do |message|
	@changenickname_screen.nickname_error_message
end

When (/^I select display cvv$/) do
	@cvv2_screen = CopycardScreen.new
	@cvv2_screen.screen_exists?
end

Then (/^I should see cvv screen message$/) do |message|
	@cvv2_screen.cvv_confirm_message(message_cvv)
end

Then (/^I should see cvv screen error message$/) do |message|
	@cvv2_screen.cvv_error_message(error_message_cvv)
end

When (/^I select Notifications$/) do 
	@notification_list_screen = NotifcationsScreen.new
end

Then (/^I should see notifications screen$/) do
	@notification_list_screen.screen_exists?
end

And (/^I should see Enable$/) do
	@notification_list_screen.en_notifications

end

And (/^I should see Disable$/) do
	@notification_list_screen.di_notifications
end

And (/^I should see View$/) do
	@notification_list_screen.view_notifications
end

When (/^I select Enable$/) do
	@notification_list_screen.touch_enable_notifications
end

Then (/^I should see enable notification message$/) do |message|
	@notification_list_screen.enable_notification_message(enable_notification_message)
end

Then (/^I should see enable notification error message$/) do |message|
	@notification_list_screen.enable_error_message(enable_error_message)
end

When (/^I select Disable$/) do
	@notification_list_screen.touch_disable_notifications
end

Then (/^I should see disable notification message$/) do |message|
	@notification_list_screen.disable_notification_message(diable_notification_message)
end

Then (/^I should see disable notification error message$/) do |message|
	@notification_list_screen.disable_error_message(diable_error_message)
end

When (/^I select View$/) do
	@notification_list_screen.touch_view_notifications
end

Then (/^I should see notification view screen$/) do
	@notification_view_screen = NotificationsViewScreen.new
	@notification_view_screen.screen_exists?
end

Then (/^I should see view notification error message$/) do |message|
	@notification_list_screen.view_notification_message(view_error_message)
end


















