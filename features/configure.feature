Feature: Configure

Background:
	Given I successfully logged in

@DashboardConfigure
@HappyPath
Scenario Outline: Configure View
	When I select button slider menu
	Then I should see settings menu list
	When I select configure 
	Then I should see configure screen
		And I should see Review Terms of Service 
		And I should see Notifications 
		And I should see Push Notifications 
		And I should see Bonus Rewards

Examples: 
	|  |

@DashboardConfigureReviewTOS
@Happypath
Scenario Outline: Review Terms of Service
	When I select button slider menu
	Then I should see settings menu list
	When I select configure 
	Then I should see configure screen
	When I select reveiw terms of service 
	Then I should see terms of service screen

Examples: 
	|  |

@DashboardConfigureLanguage
@HappyPath
Scenario Outline: Change Language
	When I select button slider menu
	Then I should see settings menu list
	When I select configure 
	Then I should see configure screen
	When I select change language
	Then I should see language selection screen
	When I select language
	Then I should see language message

Examples: 
	|  |

@DashboardConfigureNotifications
@Happypath
Scenario Outline: Changing Global Notification settings
	When I select button slider menu
	Then I should see settings menu list
	When I select configure
	Then I should see configure screen
	When I select notifications 
	Then I should see config notifications screen
		And I should see enable all card notifiations
		And I should see disable all card notifications
#androidAnd I should see open automatically "<open_notifications>"
#androidAnd I should see vibrate only "<vibrate_notifications>"

Examples: 
	|  |

@DashboardConfigureNotificationsEnableAll
@Happypath
Scenario Outline: Enable Notifications All Cards
	When I select button slider menu
	Then I should see settings menu list
	When I select configure
	Then I should see configure screen
	When I select notifications
	Then I should see config notifications screen
	When I select enable all card notifiations 
		And I enter password 
	Then I should see enable notification screen message

Examples: 
	|  |

@DashboardConfigureNotificationsDisableAll
@Happypath
Scenario Outline: Disable Notifications All Cards
	When I select button slider menu
	Then I should see settings menu list
	When I select configure 
	Then I should see configure screen
	When I select notifications 
	Then I should see config notifications screen
	When I select disable all card notifiations 
		And I enter password
	Then I should see disable notification screen message

Examples: 
	|  |

@DashboardAutomaticCreditcardPushNotification
@HappyPath
Scenario Outline: Automatic Creditcard Push Notification
	When I select button slider menu
	Then I should see settings menu list
	When I select configure
	Then I should see configure screen
	When I select push notifications
	Then I should see push notifications screen
	When I select automatic push notifications
#finish

Examples: 
	|  |

@DashboardBonusRewards
@HappyPath
Scenario Outline: Bonus Rewards
	When I select button slider menu
	Then I should see settings menu list
	When I select bonus rewards 
	Then I should see simple cash back optin screen
	When I select accept simple cash back
	Then I should see simple cash back walkthrough
	When I complete simple cash back walkthrough 
	Then I should see simple cash back offers
	When I select simple cash back offer
	Then I should see offer details 
	When I select activate offer
	Then I should see confirmation message in offer details screen

Examples: 
	|  |

	