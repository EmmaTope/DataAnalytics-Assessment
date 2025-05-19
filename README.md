# DataAnalytics-Assessment
Cowrywise - Data Analytics Assessment submission

Question 1
I inner joined the users_customer to plans_plan to have the plans that are associated with customers and then Inner joined with savings_savingsaccount to get funded plans. 
Then the WHERE statement helps to ensure that results only comes for when is_regular_savings = 1 AND is_a_fund = 1.

We can the group u.id and u.name to see the counted numbers per customer when we count distinct Savings plan and unique investment plan.
We need to sum the total deposits to get total per customer but I also converted it to Naira since the confirmed amount column is also in Kobo.
I used the HAVING clause to make sure that if a customer's does not have an investment AND savings plan they will not be included in my result.

------------------------------------------------------

Question 2
Especially because everything has to be one query, I used the CTE to first get the customer Id, the number of transactions, how long the customer has joined calculated in months. Then the average transaction per month is to divide total transaction by total months.

Then I used the outer SELECT statement to label each level of average transaction while counting the number of customers that fall into each category/level.

Some customer months were giving me "0" so I used the HAVING clause to stop the dividing by zero error (you cannot divide anything by zero). This also makes sense because I know that in the runtime the HAVING clause will run before my SELECT statement though the SELECT statement is at the top of the code.


-----------------------------------------------------------

Question 3
The WHERE clause is helping to ensure that it is picking up saving account or investment account but at the same time making sure that the accounts are not archived or deleted already.

I used the SELECT statement to label the saving and investment accounts.
COALESCE and LEFT JOIN will help us fall back to created_on when plans that has no transactions are included which is good because those the the really inactive accounts.
My HAVING clause is where the greater than or equal to 365 days criteria is specified.


--------------------------------------------------------

Question 4
Here I also converted from kobo to Naira.

Customers with zero transactions are included because of the LEFT JOIN.
The CASE nested inside the SELECT statement helps me to make sure that I am not running into another division by zero issues. 
That's why I specified that "WHEN DATEDIFF(CURDATE(), u.date_joined) / 30 > 0"

Mostly in this question, the formular for calculating each column is already indicated in the question.




Thank you for the opportunity!

