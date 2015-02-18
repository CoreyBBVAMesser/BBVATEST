Feature: Creditcard Operations

Background:
	Given I successfully logged in
		And I select creditcard from accounts list

@DashboardCreditCardChangePIN
@HappyPath
Scenario Outline: Change Creditcard PIN
	When I select change pin 
	Then I should see change pin screen
	When I change pin from "(.*?)" to "(.*?)"
		And I touch Accept
	Then I should see message in change pin screen
	When I touch Accept
	Then I should see creditcard details screen

	Examples:
		| operation   |   pin  | newpin | password | message |
		| change pin  |  2233  |  3322  |   1111   | Your pin has been changed. |

@DashboardCreditCardChangePINMatchError
@ErrorPath
Scenario Outline: Change Creditcard PIN new PINs do not match
	When I select change pin
	Then I should see change pin screen
	When I enter new pins that do not match "(.*?)" to "(.*?)"
		And I touch Accept
	Then I should see error message in change pin screen
	When I touch Accept
	Then I should see change pin screen

	Examples:
		| operation   |   pin  | newpin | wrong newpin | password | message |
		| change pin  |  2233  |  3322  |   3232       |   1111   | Your pin does not match, please check your pin and try again. |

@DashboardCreditCardChangeNickname
@HappyPath
Scenario Outline: Change Creditcard Nickname
	When I select change nickname 
	Then I should see change nickname screen
	When I change nickname to "(.*?)"
		And I touch Accept
	Then I should see confirmation message in the change nickname screen

Examples:
	| operation       |  nickname | new nickname | password | message |
	| Change Nickname |  Personal | Mycreditcard |   1111   | /^Your nickname has been changed to "(.*?)$/. |

@DashboardCreditCardEnableNotifications
@HappyPath
Scenario Outline: Enable Notifications
	When I select Notifications
	Then I should see notifications screen
	When I select Enable
		And I enter password
	Then I should see enable notification message

Examples:
	|   operation  | notification | password | message |
	| Notification |    Enable    |   1111   | You will now be notified of any changes made to your account. |

@DashboardCreditCardDisableNotifications
@HappyPath
Scenario Outline: Disable Notifications
	When I select Notifications
	Then I should see notifications screen
	When I select Disable
		And I enter password
	Then I should see disable notification message

Examples:
	|   operation  | notification | password | message |
	| Notification |    Disable   |   1111   | You will no longer be notified of any changes made to your account. |

@DashboardCreditCardViewNotifications
@HappyPath
Scenario Outline: View Notifications
	When I select Notifications
	Then I should see notifications screen
	When I select View
		And I enter password
	Then I should see notification view screen

Examples:
	|   operation  | notification | password |
	| Notification |     View     |   1111   |

@DashboardCreditCardBlock
@HappyPath
Scenario Outline: Block Creditcard
	When I select block card
	Then I select reason
		And I scroll to Temporary block
	Then I should see message in block options screen

	Examples:
		|   block   | password | message |
		| Temporary |   1111   | Your Creditcard has been temporarily blocked.  Please contact customer service. |

@DashboardCreditCardBlockPasswordError
@ErrorPath
Scenario Outline: Block Creditcard incorrect password
	When I select block card
	Then I select reason
		And I scroll to Temporary block
	Then I should see error message in block options screen

	Examples:
		|   block   | password | message |
		| Temporary |   2111   | The Password you have entered is incorrect, please check your password and try again. |
