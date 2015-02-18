Feature: Creditcard Dashboard

Background:
	Given I successfully logged in
		And I have a creditcard on file

@DashboardCreditCardInfo
@HappyPath
Scenario Outline: View Credit Card Info
	When I see creditcard
		And I should see creditcard nickname "Creditcard"
		And I should see creditcard number "4355 7600 0144 0660"
		And I should see creditcard image 
		And I should see creditcard expiration date "17/10"
		And I should see creditcard holder "RAAMIZ GRUDDY"
		And I should see creditcard available balance "84,529.91"
		And I should see creditcard posted balance "15,470.09"

	Examples:
		|  account  | nickname |     cardnumber      | image    | exp_date |    holder    | avail balance | posted balance |
		| Creditcard | Personal | 4355 7600 0144 0660 | card.jpg | 10/14    | RAAMIZ GRUDDY | 100.00 | 50.00 |


@DashboardCreditCardPayments
@HappyPath
Scenario Outline: View creditcard Payments
	When I select creditcard from accounts list
	Then I should see creditcard screen
		And I should see creditcard limit "100,000.00"
		And I should see creditcard payment due date "15"
		And I should see creditcard minimum payment due "93.52"

#I may need to add more options for paying from the paydue and minpaydue 

	Examples:
		| section | account  | credit  | paydue | minpaydue |
		| Credit  | Personal | 5000.00 |  10/15 |   25.00   |


@DashboardCreditCardTransactions
@HappyPath
Scenario Outline: View Creditcard Transactions
	When I select creditcard from accounts list
	Then I should see creditcard screen 
	When I select transactions from creditcard screen
	Then I should see creditcard transactions list screen
	When I select transaction number from the transactions list
	Then I should see creditcard transaction detail screen
		And I should see creditcard Transaction Date 
        And I should see creditcard Posting Date 
        And I should see creditcard Description 
        And I should see creditcard Amount 

#I may need to add more detail to desc and loc

	Examples:
		| section | account  | position | date  | posted | desc | amount | loc    |
		| Credit  | Personal |    1     | 10/14 | 10/15  | Food | 3.14  | Houston |


@DashboardCreditCardOperations
@HappyPath
Scenario Outline: View Creditcard Operations
	When I select creditcard from accounts list
	Then I should see creditcard screen
#		And If the card is new
#			Then I should see Activate Card 
		And I should see Block Card 
#		And I should see Unblock Card 
#		And I should see Request PIN 
#		And I should see Change PIN 
		And I should see Copy Card Number 
		And I should see Change Nickname 
#		And I should see Display CVV2 
		And I should see creditcard Notifications 

	Examples:
		| operations      |
		| Block 		   |
		| Copy Number 	   |
		| Change Nickname |
		| Notifications   |