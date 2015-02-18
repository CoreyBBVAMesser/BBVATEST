When (/^I tap on button slider menu from dashboard$/) do
  @dashboard_screen = Dashboard.new
  @dashboard_screen.open_sliding_menu
end

Then (/^I should see username screen before login$/) do
  @home_screen = HomeScreen.new
  @home_screen.wait_for_home_screen_menu
end

Then (/^I should see menu list screen$/) do
  @slider_menu = SettingMenu.new
  @slider_menu.wait_menu_screen_to_load
end

Then (/^I select "(.*?)" from menu list$/) do |label|
  @slider_menu.touch_cell(label)
end

Then (/^I should see configuration screen$/) do
  @configuration_screen = ConfigurationMenu.new
  @configuration_screen.wait_to_load_screen
end

And  (/^I select change language in configuration screen$/) do
    @configuration_screen.tap_button("language")
end

Then (/^I select change language to "(.*?)" and tap accept button$/) do |idiom|
   @configuration_screen.tap_button_language(idiom) 
   @configuration_screen.touch_sign_in_button
end

And (/^I should see dashboard screen with navigation title translated "(.*?)"$/) do |translated|
  @home_screen = HomeScreen.new
  @home_screen.wait_for_home_screen_menu
  @home_screen.check_idiom(translated)
end

And (/^I select change email in configuration screen$/) do
    @configuration_screen.tap_button("email")
end

Then (/^I should fill primary email address "(.*?)"$/) do |email|
   @configuration_screen.fill_field(email,"primary")
end

And (/^I should fill alternative email address and tap update button "(.*?)"$/) do |email|
  @configuration_screen.fill_field(email,"alternative")
  @configuration_screen.tap_button("change_mail")
end

And  (/^I select change tlf number in configuration screen$/) do
  @configuration_screen.tap_button("tlf")
end

Then (/^I should tap over the pencil button$/) do
  @updateTlfNumber_screen = UpdateTlfNumber.new
  @updateTlfNumber_screen.wait_to_load_screen
  @updateTlfNumber_screen.tap_pencil_button("primary")
end

Then (/^I should fill primary tlf number$/) do 
  #@value_old_primary, @value_old_alternative = @updateTlfNumber_screen.get_value_old_tlfs("primary")
  @updateTlfNumber_screen.wait_to_load_screen
  @updateTlfNumber_screen.fill_field("primary")
end

And  (/^I should tap save button$/) do
  @updateTlfNumber_screen.wait_for_element
  @updateTlfNumber_screen.tap_update_button_primary
end

Then (/^I should see Text Message Activation screen$/) do
  @activation_screen = Activation.new
  @activation_screen.wait_to_load_screen
end

Then (/^I tap in cancel button$/) do
    @activation_screen.tap_close
end

Then(/^I should see new number$/) do
  @updateTlfNumber_screen = UpdateTlfNumber.new
  @updateTlfNumber_screen.wait_to_load_screen
  @updateTlfNumber_screen.check_input_still_showing
end






