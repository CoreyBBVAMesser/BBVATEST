When (/^I select button slider menu$/) do
	@dashboard_screen = Dashboard.new
	@dashboard_screen.open_sliding_menu
end

Then (/^I should see settings menu list$/) do
	pending #
end

When (/^I select configure$/) do
	@dashboard_screen.open_sliding_menu
	@dashboard_screen.touch_configure
end

Then (/^I should see configure screen$/) do
	@configure_screen = ConfigureScreen.new
	@configure_screen.screen_exists?
end

And (/^And I should see Review Terms of Service$/) do
	@configure_screen.terms_button
end

And (/^I should see Notifications$/) do 
	@configure_screen.notification_button
end

And (/^I should see Push Notifications$/) do
	@configure_screen.push_notifications_button
end

And (/^I should see Bonus Rewards$/) do
	@configure_screen.bonus_rewards_button
end

When (/^I select review terms of service$/) do 
	@configure_screen.touch_terms
	@terms_screen = TermsScreen.new
	@terms_screen.screen_exists?
end

When (/^I select change language$/) do
	@configure_screen.touch_language
end

When (/^I select language$/) do
	@language_screen.select_default_language
end

Then (/^I should see language message$/) do |message|
	@language_screen.language_confirm_message
end

When (/^I select notifications$/) do
	@configure_screen.touch_config_notifications
end

Then (/^I should see config notifications screen$/) do
	@notifications_config_screen = NotificationsConfigScreen.new
	@notifications_config_screen.screen_exists?
end

And (/^I should see enable all card notifications$/) do
	@notifications_config_screen.enableall_notifications_button
end

And (/^I should see disable all card notifications$/) do
	@notifications_config_screen.disableall_notifications_button
end

When (/^I select enable all card notifications$/) do
	@notifications_config_screen.touch_enableall_notifications
end

Then (/^I should see enable notification screen message$/) do |message|
	@notifications_config_screen.enableall_message
end

When (/^I select disable all card notifications$/) do
	@notifications_config_screen.touch_disableall_notifications
end

Then (/^I should see disable notification screen message$/) do |message|
	@notifications_config_screen.disableall_message
end

When (/^I select push notifications$/) do
	@configure_screen.touch_config_pushnotifications
end

When (/^I select automatic push notifications$/) do
	@configure_screen.touch_auto_push_notifications
end

When (/^I select bonus rewards$/) do
	@configure_screen.touch_bonus_rewards
end

Then (/^I should see simple cash back optin screen$/) do
	@cashback_opit_screen = CashbackOptinScreen.new
	@cashback_opit_screen.cashback_accept
	@cashback_opit_screen.cashback_decline
end

When (/^I select accept simple cash back$/) do
	@cashback_opit_screen.touch_cashback_accept
end

Then (/^I should see simple cash back walkthroug$/) do
	@cashback_walkthrough_screen = CashbackWalkthroughScreen.new
	@cashback_walkthrough_screen.screen_exists?
end

When (/^I complete simple cash back walkthrough$/) do
	@cashback_walkthrough_screen.swipe_to_end
end

Then (/^I should see simple cash back offers$/) do
	@cashback_offers_screen = CashbackOffersScreen.new
	@cashback_offers_screen.screen_exists?
end

When (/^I select simple cash back offer$/) do
	@cashback_offers_screen.touch_cashback_offer
end

Then (/^I should see offer details$/) do
	@cashback_offer_details_screen = CashbackOfferDetailsScreen.new
	@cashback_offer_details_screen.screen_exists?
end

When (/^I select activate offer$/) do
	@cashback_offer_details_screen.touch_accept_offer
end

Then (/^I should see confirmation message in offer details screen$/) do
	@cashback_offer_details_screen.offer_confirmation_message
end











