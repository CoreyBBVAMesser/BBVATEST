
When (/^I tap on button slider menu$/) do
  @dashboard_screen = Dashboard.new
  @dashboard_screen.open_sliding_menu
end

Then(/^I should see list menu in slider$/) do
    @slider_menu = SettingMenu.new
    @slider_menu.wait_menu_screen_to_load
end

Then (/^I select alerts from menu list$/) do
     @slider_menu.touch_cell("Alerts")
end

Then (/^I select account name "(.*?)" from list$/) do |account|
    @alert_screen = AlertsScreen.new
    @alert_screen.wait_for_alert_screen
    @alert_screen.tap_account(account)
end

Then (/^I select account name "(.*?)" from list again$/) do |account|
    @alert_screen = AlertsScreen.new
    @alert_screen.wait_for_table
    @alert_screen.tap_account(account)
end

Then (/^I tap over balance from list$/) do 
    @alerts_detail_screen = AlertsDetailScreen.new
    @alerts_detail_screen.wait_for_alert_detail_screen("balance")
    @alerts_detail_screen.tap_over_type("balance")
end

Then(/^I verify if the switch is on$/) do
   @alerts_detail_screen.wait_switch(0)
   @alerts_detail_screen.switch_status_alerts(0)
end

Then (/^I fill text checking "(.*?)" and "(.*?)"$/) do |min, max|
   @alerts_detail_screen.wait_for_input_field

   if(@alerts_detail_screen.check_value_input(max))
     max = @alerts_detail_screen.get_random_number
   end

   @alerts_detail_screen.fill_text_two_inputs(min,max)
   
end

Then(/^I verify if the switch is on account summary$/) do
   @alerts_detail_screen.wait_switch(1)
   @alerts_detail_screen.switch_status_alerts(1)
end

Then (/^I tap drop down list$/) do
  @alerts_detail_screen.open_drop_down_list_index(1)
end

And  (/^I select element drop down list "(.*?)"$/) do |text|
  @alerts_detail_screen.select_element_drop_down_list_index(1,text)
  @alerts_detail_screen.tap_ok_button_keyboard
end

Then (/^I verify if the switch is on for insufficient funds$/) do
   @alerts_detail_screen.switch_status_alerts(2)
   @alerts_detail_screen.tap_over_type("balance")
end

And  (/^I tap over submit button$/) do
  @alerts_detail_screen.scroll_view
  @alerts_detail_screen.submit_button
end

And  (/^I check if "(.*?)" and "(.*?)" are present$/) do |min,max|
   @alerts_detail_screen.checking_elements_existence_first(min)
   @alerts_detail_screen.checking_elements_existence_second(max)
end

Then(/^I tap over withdrawal from list$/) do 
    @alerts_detail_screen = AlertsDetailScreen.new
    @alerts_detail_screen.wait_for_alert_detail_screen("withdrawal")
    @alerts_detail_screen.tap_over_type("withdrawal")
end

Then (/^I fill text "(.*?)"$/) do |max|
  @alerts_detail_screen.wait_for_input_field_withdrawal_first
  if(@alerts_detail_screen.check_value_input(max))
     max = @alerts_detail_screen.get_random_number
   end
  @alerts_detail_screen.fill_text_one_inputs_withdrawal(max)
end

Then (/^I verify if the switch is on daily$/) do
  @alerts_detail_screen.wait_switch(1)
  @alerts_detail_screen.switch_status_alerts(1)
end

Then (/^I fill text "(.*?)" and "(.*?)" withdrawal$/) do |min, max|
  @alerts_detail_screen.fill_text_two_inputs_withdrawal(min,max)
end

And  (/^I check "(.*?)" and "(.*?)" and "(.*?)" are present in screen$/) do |min,max,exceeds|
   @alerts_detail_screen.checking_elements_existence_first(exceeds)
   @alerts_detail_screen.checking_elements_existence_second(min)
   @alerts_detail_screen.checking_elements_existence_third(max)

end

Then (/^I tap over deposits from list$/) do
    @alerts_detail_screen = AlertsDetailScreen.new
    @alerts_detail_screen.wait_for_alert_detail_screen("deposits")
    @alerts_detail_screen.tap_over_type("deposits")
end

Then (/^I tap over fraud from list$/) do
    @alerts_detail_screen = AlertsDetailScreen.new
    @alerts_detail_screen.wait_for_alert_detail_screen("fraud")
    @alerts_detail_screen.tap_over_type("fraud")
end
Then (/^I verify if the switch is on for fraud$/) do
  @alerts_detail_screen.wait_switch(0)
  @alerts_detail_screen.switch_status_alerts_for_fraud(0)
end

Then (/^I tap over other transactions from list$/) do
    @alerts_detail_screen = AlertsDetailScreen.new
    @alerts_detail_screen.wait_for_alert_detail_screen("other")
    @alerts_detail_screen.tap_over_type("other")
end

Then (/^I fill text advance exceeding "(.*?)"$/) do |max|
  @alerts_detail_screen.fill_text_inputs_advance(max)
end

Then (/^I tap on first drop down list$/) do
  @alerts_detail_screen.open_drop_down_list_index(1)
end

And  (/^I select value in first drop down list "(.*?)"$/) do |text|
  @alerts_detail_screen.select_element_drop_down_list_index(1,text)
  @alerts_detail_screen.tap_ok_button_keyboard
end

Then (/^I verify if the second switch is on$/) do
  @alerts_detail_screen.switch_status_alerts(1)
end

Then (/^I fill text check number (.*?)$/) do |max|
  @alerts_detail_screen.fill_text_inputs_check(max)
end

Then (/^I tap on second drop down list$/) do 
  @alerts_detail_screen.open_drop_down_list_index(2)
end

And  (/^I select value in second drop down list "(.*?)"$/) do |text|
  @alerts_detail_screen.select_element_drop_down_list_index(2,text)
  @alerts_detail_screen.tap_ok_button_keyboard
end