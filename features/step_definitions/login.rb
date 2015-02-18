Given(/^I successfully logged in$/) do
		steps %Q{
			Given I see welcome screen
			When I touch start
			Then I should see home screen
			When I enter username "wallet11"
				And I enter password "1234"
				And I accept terms and conditions
			Then I should see dashboard
		}
end

Given (/^I have active wallet login$/) do
	steps %Q{
			Given I see welcome screen
			When I touch start
			Then I should see home screen
			When I enter username "wallet11"
			Then I enter password "1234"
			When I sign in
			Then I accept terms and conditions
			When I select sliding menu
				And I select logout
			Then I should see home screen
		}
end

Given (/^I see previous username at login$/) do
	steps %Q{
			Given I start app
			Then I should see welcome screen
			When I touch start
			Then I should see home screen
			When I enter username
				And I enter password
				And I accept terms and conditions
			Then I should see dashboard
			When I select sliding menu
				And I select logout
			Then I should see home screen
				And I should see username filled in
		}
end

Given (/^I successfully log in with remember me$/) do
	steps %Q{
			Given I have active wallet login
			When I check remember me
				And I enter username
				And I enter password
			Then I should see dashboard
		}
end

Given (/^I entered my credentials$/) do
	steps %Q{
			Given I see welcome screen
			When I touch start
			Then I should see home screen
			When I enter username "wallet11"
			Then I enter password "1234"
		}
end

Given (/^I am on home screen$/) do
	steps %Q{
			Given I see welcome screen
			When I touch start
			Then I should see home screen
		}
end


Given (/^I see welcome screen$/) do
	@welcome_screen = WelcomeScreen.new
	@welcome_screen.screen_exists?
end

#Given (/^I see home screen$/) do
#	@home_screen = HomeScreen.new
#end

#Then (/^I should see language selection screen$/) do
#	@language_screen.screen_exists?
#end

#When (/^I select default language$/) do
#	@language_screen.select_default_language
#end

When (/^I touch start$/) do
	@welcome_screen.touch_start_button
end

Then (/^I should see home screen$/) do
	@home_screen = HomeScreen.new
	@home_screen.screen_exists?
end

When (/^I enter username "(.*?)"$/) do |username|
	@home_screen.fill_username(username)
end

When (/^I sign in$/) do
	@home_screen.touch_submit_button
end

Then (/^I should see security question screen$/) do
	@security_question_screen = SecurityQuestionScreen.new
	@security_question_screen.screen_exists?
end

When (/^I enter security answer "(.*?)"$/) do | answer |
	@security_question_screen.fill_security_question(answer)
end

And (/^I touch accept in security screen$/) do
	@security_question_screen.touch_submit_button
end

Then (/^I should see password screen$/) do
	@password_screen = PasswordScreen.new
	@password_screen.screen_exists?
end

And (/^I accept terms and conditions$/) do
	@terms_screen = TermsScreen.new
	if @terms_screen.screen_exists? then
		@terms_screen.accept_terms
	end
end

Then (/^I should see dashboard$/) do
	@dashboard_screen = DashboardScreen.new
	@dashboard_screen.screen_exists?
end

Given (/^I start app$/) do
	@welcome_screen = WelcomeScreen.new
	@welcome_screen.screen_exists?
end

Then (/^I enter password "(.*?)"$/) do |password|
	@password_screen = PasswordScreen.new
	@password_screen.fill_valid_password(password)
#	@password_screen.touch_submit_button
end

And (/^I enter wrong password "(.*?)"$/) do |password|
	@password_screen = PasswordScreen.new
	@password_screen.fill_invalid_password(password)
#	@password_screen.touch_submit_button
end

Then (/^I should see password error screen$/) do 
	@home_error_screen = HomeErrorScreen.new
	@home_error_screen.screen_exists?
end

When (/^I press accept$/) do
	@home_error_screen.touch_accept
end

When (/^I enter wrong username "(.*?)"$/) do |username|
	@home_screen.fill_invalid_username(username)
end

Then (/^I should see username error screen$/) do 
	@home_error_screen = HomeErrorScreen.new
	@home_error_screen.screen_exists?
end

When (/^I check remember me$/) do 
	@home_screen.switch_on_remember_user
end

When (/^I uncheck remember me$/) do 
	@home_screen.switch_off_remember_user
end

Then (/^I should see remember me message screen$/) do
	@remembererd_user_screen = RememberedUserScreen.new
	@remembererd_user_screen.screen_exists?
end

When (/^I touch continue$/) do
	@remembererd_user_screen.touch_submit_button
end

When (/^I select I'm not "(.*?)"$/) do
	@home_screen.touch_imnot_username_button
end

Then (/^I should see home screen with cleared fields$/) do
	@home_screen = HomeScreen.new
end

When (/^I select sliding menu$/) do
	@dashboard_screen.open_sliding_menu
end

And (/^I select logout$/) do
	@dashboard_screen.touch_logout_button
	@dashboard_screen.confirm_exit_dialog
end

And (/^I should see username filled in$/) do
	@home_screen.check_username
end

When (/^I select forgot username password$/) do
	@home_screen.touch_forgot_username_button
end

Then (/^I should see forgot username password screen$/) do
	@forgot_username_screen = ForgotUsernameScreen.new
	@forgot_username_screen.screen_exists?
end

When (/^I enter primary email "(.*?)"$/) do | email |
	@forgot_username_screen.fill_primary_email(email)
end

And (/^I enter account number "(.*?)"$/) do | account_number |
	@forgot_username_screen.fill_account_number(account_number)
end

And (/^I enter forgot user security answer "(.*?)"$/) do | answer |
	@forgot_username_screen.fill_security_question(answer)
end 

Then (/^I touch continue on the forgot user screen$/) do
	@forgot_username_screen.touch_submit_button
end

When (/^I see security screen$/) do
	@forgot_username_screen.security_screen_exists?
end

Then (/^I should see forgot user conformation message$/) do
	@forgot_username_screen.forgot_user_conformation(message)
end

When (/^I enter invalid primary email "(.*?)"$/) do | email |
	@forgot_username_screen.fill_invalid_email(email)
end

Then (/^I should see error message in forgot username password screen$/) do
	@forgot_username_screen.wait_for_error_message(message)
end

When (/^I touch accept in error message$/) do
	@forgot_username_screen.touch_accept
end

And (/^I enter invalid account number "(.*?)"$/) do | account_number |
	@forgot_username_screen.fill_invalid_account_number(account_number)
end

When (/^I enter wrong security answer "(.*?)"$/) do
	@security_question_screen.fill_invalid_answer
end

Then (/^I should see error message in security question screen/) do | message |
	@security_question_screen.wait_for_error_message(message)
end

#And (/^I confirm password$/) do |password|
#	@password_screen.fill_confirm_password
#end

Then (/^I should see error message in forgot password screen/) do
	@forgot_password_screen.wait_for_error_message
end

When (/^I touch forgot password$/) do 
	@forgot_username_screen.touch_forgot_password
end

Then (/^I should see forgot password screen$/) do 
	@forgot_password_screen = ForgotPasswordScreen.new
	@forgot_password_screen.screen_exists?
end

#Then (/^I should see change password screen$/) do 
#	@change_password_screen = ChangePasswordScreen.new
#	@change_password_screen.screen_exists?
#end

When (/^I enter username "(.*?)" in forgot password screen$/) do | username |
	@forgot_password_screen.fill_username(username)
end

And (/^I enter email "(.*?)" in forgot password screen$/) do | email |
	@forgot_password_screen.fill_email(email)
end

And (/^I enter account number "(.*?)" in forgot password screen$/) do | account_number |
	@forgot_password_screen.fill_account_number(account_number)
end

And (/^I enter invalid account number "(.*?)" in forgot password screen$/) do | account_number |
	@forgot_password_screen.fill_account_number(account_number)
end

And (/^I touch continue in forgot password screen$/) do
	@forgot_password_screen.touch_submit_button
end

#When (/^I enter new password$/) do |password|
#	@change_password_screen.fill_new_password
#end

#And (/^I confirm new password$/) do |password|
#	@change_password_screen.fill_new_password
#	@touch_submit_button
#end

When (/^I select view terms and conditions$/) do
	@home_screen.touch_terms
	@terms_screen = TermsScreen.new
	@terms_screen.screen_exists?
end

When (/^I confirm wrong password$/) do |password|
	@change_password_screen.fill_invalid_password
	@change_password_screen.touch_submit_button
end

Then (/^I should see error message in change password screen$/) do |password|
	@change_password_screen.wait_for_error_message(message)
end

When (/^I enter invalid username "(.*?)" in forgot password screen$/) do | username |
	@forgot_password_screen.fill_username(username)
end

When (/^I enter invalid email "(.*?)" in forgot password screen$/) do | email |
	@forgot_password_screen.fill_email(email)
end