And(/^I select a debitcard$/) do
	@dashboard_screen = Dashboard.new
	@dashboard_screen.scroll_to_section(section)
	@dashboard_screen.touch_account_type(account)
	@debitcard_screen = debitcardScreen.new
end

And (/^I have selected debitcard operations$/) do |account|
	@debit_operations_list_screen.select_debit_operations(account)
end

When (/^I select copy debitcard number$/) do
	@debit_operations_list_screen.copy_debitcard_number
end

Then (/^I should see copy debitcard number screen message$/) do
	@copy_debitcard_screen = CopyDebitcardScreen.new
	@copy_debitcard_screen.copy_debitcard_message
end

When (/^I select change debitcard nickname$/) do
 	@changenickname_screen = ChangenicknameScreen.new
end










