Feature: Login

@FirstAccessLogin
@HappyPath
@Reinstall
Scenario Outline: First Access Login
	Given I see welcome screen
	When I touch start
	Then I should see home screen
	When I enter username "wallet11"
	Then I enter password "1234"
	When I sign in
	Then I accept terms and conditions
	When I should see security question screen
		And I enter security answer "test"
		And I touch accept in security screen
	Then I should see dashboard

@sys2
Examples:
	| username | secanswer | password |
	| wallet11  |   test   |   1234   |

@CommonLogin
@HappyPath
Scenario Outline: Login
	Given I start app
#	When I select default language
	#necessary after initial setup?
	And I see welcome screen
	When I touch start
	Then I should see home screen
	When I enter username "wallet11"
	Then I enter password "1234"
	When I sign in
	Then I accept terms and conditions
		And I should see dashboard

@sys2
Examples:
	| start | username | password |
	| 0 | wallet11   | 1234   |

@LoginInvaildPassword
@ErrorPath
Scenario Outline: Invalid Password
	Given I am on home screen
	When I enter username "wallet11"
	Then I enter wrong password "wallet12"
	When I sign in
	Then I should see password error screen
	When I press accept
	Then I should see home screen

@sys2
Examples:
	| username | password |
	| wallet11   |   2222 |

@LoginInvalidUsername
@ErrorPath
Scenario Outline: Invalid Username
	Given I am on home screen
	When I enter wrong username "messer"
	Then I enter password "1234"
	When I sign in
	Then I should see username error screen 
	When I press accept
	Then I should see home screen

@sys2
Examples:
	| username | password | 
	| messer   |   1234  |

@RememberMeLogin
@AlternativePath
Scenario Outline: Remember Me Login
	Given I entered my credentials
	When I check remember me
	When I sign in
	Then I accept terms and conditions
		And I should see dashboard
	

@sys2
Examples:
	| rememberme | username | password |
	|     1      | wallet11   |   wallet11   |

@UncheckRememberMe
@AlternativePath
Scenario Outline: Uncheck Remember Me
	Given I entered my credentials
	When I uncheck remember me
	Then I should see remember me message screen
	When I touch continue
	Then I should see home screen

@sys2
Examples:
	| rememberme | username | password |
	|     0      | wallet11   |   wallet11   |

#@ChangeUserLogin
#@AlternatePath
#Scenario Outline: Change Users at Login
#	Given I am on home screen
#	When I select I'm not "(.*?)"
#	Then I should see home screen with cleared fields

#@sys2
#Examples:
#	| changeuser | username | password |
#	|     1      |  wallet11  |   wallet11   |

#@Logout
#@HappyPath
#Scenario Outline: Logout
#	Given I successfully logged in
#	When I select sliding menu
#		And I select logout
#	Then I should see home screen
#
#	Examples:
#	|  |
#	|  |

#@LogoutWithRememberMe
#@HappyPath
#Scenario Outline: Logout with Remeber me
#	Given I successfully log in with remember me
#	When I select sliding menu
#		And I select logout
#	Then I should see home screen
#		And I should see username filled in
#
#	Examples:
#	|  |
#	|  |

@ForgotUsername
@HappyPath
Scenario Outline: forgot username 
	Given I am on home screen
	When I select forgot username password 
	Then I should see forgot username password screen
	When I enter primary email "corey.messey.contractor@bbva.com"
		And I enter account number "14933689"
	Then I touch continue on the forgot user screen
	When I see security screen
		And I enter forgot user security answer "test"
	Then I should see forgot user conformation message
	When I touch continue on the forgot user screen
	Then I should see home screen

@sys2
Examples:
	| email | accountnumber | username | password |
	| corey.messer.contractor@bbva.com | 12344321  | wallet11   |  1234   |

@ForgotUsernameWrongEmail
@ErrorPath
Scenario Outline: forgot username Wrong Email
	Given I am on home screen
	When I select forgot username password
	Then I should see forgot username password screen
	When I enter invalid primary email "corey.messer.contractor@bbva.com"
		And I touch continue on the forgot user screen
	Then I should see error message in forgot username password screen
	When I touch accept in error message
	Then I should see forgot username password screen


@sys2
Examples:
	| email |
	| corey.messer.contractor@bbva.com |

@ForgotUsernameWrongAccountNumber
@ErrorPath
Scenario Outline: forgot username password Wrong Account Number
	Given I am on home screen
	When I select forgot username password
	Then I should see forgot username password screen
	When I enter invalid account number "1234567"
		And I touch continue on the forgot user screen
	Then I should see error message in forgot username password screen
	When I touch accept in error message
	Then I should see forgot username password screen

@sys2
Examples:
	| email | wrongaccountnumber |
	| corey.messer.contractor@bbva.com| 1234567 |

@ForgotPassword
@HappyPath
Scenario Outline: Forgot Password
	Given I am on home screen
	When I select forgot username password
	Then I should see forgot username password screen
	When I touch forgot password
	Then I should see forgot password screen
	When I enter username "wallet11" in forgot password screen 
		And I enter email "corey.messey.contractor@bbva.com" in forgot password screen 
		And I enter account number "14933689" in forgot password screen
		And I touch continue in forgot password screen
	Then I should see home screen

@sys2
Examples:
	| accountnumber | username | password |
	| 14933689  |  wallet11   |  1234  |

@ForgotPasswordWrongAccountNumber
@ErrorPath
Scenario Outline: Forgot Password Wrong Account Number
	Given I am on home screen
	When I select forgot username password
	Then I should see forgot username password screen
	When I touch forgot password
	Then I should see forgot password screen
	When I enter username "wallet11" in forgot password screen 
		And I enter email "corey.messey.contractor@bbva.com" in forgot password screen 
		And I enter invalid account number "19433869" in forgot password screen
		And I touch continue in forgot password screen
	Then I should see error message in forgot password screen
	When I touch accept in error message
	Then I should see forgot password screen

@sys2
Examples:
	| accountnumber | username | password |
	| 14933689  |  wallet11   |  1234  |

@ForgotPasswordWrongUsername
@ErrorPath
Scenario Outline: Forgot Password Wrong Username
	Given I am on home screen
	When I select forgot username password
	Then I should see forgot username password screen
	When I touch forgot password
	Then I should see forgot password screen
	When I enter invalid username "wallet12" in forgot password screen 
		And I enter email "corey.messey.contractor@bbva.com" in forgot password screen 
		And I enter account number "19433689" in forgot password screen
		And I touch continue in forgot password screen
	Then I should see error message in forgot password screen
	When I touch accept in error message
	Then I should see forgot password screen

@sys2
Examples:
	| accountnumber | username | password |
	| 14933689  |  wallet11   |  1234  |

@ForgotPasswordWrongEmail
@ErrorPath
Scenario Outline: Forgot Password Wrong Email
	Given I am on home screen
	When I select forgot username password
	Then I should see forgot username password screen
	When I touch forgot password
	Then I should see forgot password screen
	When I enter username "wallet11" in forgot password screen 
		And I enter invalid email "corey.messer.contractor@bbva.com" in forgot password screen 
		And I enter account number "19433689" in forgot password screen
		And I touch continue in forgot password screen
	Then I should see error message in forgot password screen
	When I touch accept in error message
	Then I should see forgot password screen

@sys2
Examples:
	| accountnumber | username | password |
	| 14933689  |  wallet11   |  1234  |

