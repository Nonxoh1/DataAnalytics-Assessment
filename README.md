# DataAnalytics-Assessment

Hi there
This project includes my SQL solutions for a Data Analyst assessment. The goal was to analyze customer behaviors using real-world banking data and come up with useful insights.

Each question focused on a practical business case, and I’ve included one clean SQL query per task with comments where needed. Below is a quick summary of how I approached each one, along with any challenges I faced.

---

## Q1: High-Value Customers with Multiple Products

**What it does:**  
Finds customers who have both a savings plan and an investment plan — and shows how much they've deposited in total.

**How I approached it:**  
I joined the user, savings, and plan tables, then filtered for deposits that were actually funded (`confirmed_amount > 0`).  
I used conditional counts to check if a customer had at least one savings plan and one investment plan. I also summed their deposits and sorted by total amount saved.

**Challenge:**  
The challenge here was understanding what “funded” meant in this context. I assumed it referred to transactions where `confirmed_amount > 0`, which seemed to make the most business sense.

---

## Q2: Transaction Frequency Analysis

**What it does:**  
Groups users by how often they make deposits each month — categorized into High, Medium, or Low frequency.

**How I approached it:**  
I counted how many transactions each user made and calculated how many months they were active based on their first and last deposit dates.  
Then I calculated their average transactions per month and grouped them using case logic (≥10 = High, 3–9 = Medium, ≤2 = Low).  
Finally, I grouped the results to show how many users fall into each category.

**Challenge:**  
One tricky part was making sure I didn’t divide by zero when calculating average per month — for users who might have only deposited once. I used a fallback to handle that safely.

---

## Q3: Account Inactivity Alert

**What it does:**  
Flags any savings or investment plan that hasn't had a deposit in over a year, even though the plan is still active.

**How I approached it:**  
I joined the savings transactions with their respective plans and found the most recent deposit date for each.  
If it’s been more than 365 days since the last deposit, I considered the plan inactive.  
I labeled each plan as either “Savings” or “Investment” based on its attributes so the team knows how to handle them.

**Challenge:**  
There were a lot of fields in the plans table, and understanding which ones meant “active” or which type of plan it was took a bit of digging. I had to rely on `is_regular_savings` and `is_a_fund` as flags.

---

## Q4: Customer Lifetime Value (CLV)

**What it does:**  
Estimates how valuable each customer is over time using a simplified CLV formula.

**How I approached it:**  
I calculated each customer's tenure in months from their signup date.  
Then I counted how many deposits they’ve made and computed the average profit per transaction (using 0.1% of the deposit amount).  
I plugged everything into the formula and sorted the results by estimated CLV.

**Challenge:**  
The formula required dividing by tenure, so I had to make sure customers with 0-month tenure (like same-month signups) didn’t break the calculation. I added a condition to avoid division errors.

I know some of my queries where a bit long, but it was how i could achieve the result.


