
# DataAnalytics-Assessment

This repository contains SQL solutions for a Data Analyst technical assessment focused on customer transaction insights and account behaviors.

---

## ✅ Assessment Questions & Solutions

### Q1: High-Value Customers with Multiple Products
**Goal:** Identify users with both a funded savings plan and a funded investment plan, sorted by total deposits.

**Approach:**
- Joined `users_customuser`, `savings_savingsaccount`, and `plans_plan`.
- Counted distinct savings and investment plans per user.
- Filtered for users having both.
- Summed total confirmed deposits (`confirmed_amount`).

**Challenge:** Interpreting "funded" was handled by using `confirmed_amount > 0`.

---

### Q2: Transaction Frequency Analysis
**Goal:** Classify users into High, Medium, or Low frequency based on average transactions per month.

**Approach:**
- Counted all savings transactions per user.
- Computed active duration using difference between first and last transaction.
- Grouped users by average monthly frequency into categories.

**Challenge:** Edge case of `0 months` handled to avoid divide-by-zero errors.

---

### Q3: Account Inactivity Alert
**Goal:** Flag savings or investment plans with no inflow in the last 365 days.

**Approach:**
- Originally planned to join with `plans_plan`, but the dataset lacked labeled savings/investment plans.
- Instead, worked directly with `savings_savingsaccount` and grouped by `plan_id` and `owner_id`.
- Calculated last inflow date and number of days since.
- Marked plan `type` as `'Unknown'` since plan type wasn't derivable from data.

**Challenge:** Adjusted logic after finding `plans_plan` contained no active or labeled plan records.

---

### Q4: Customer Lifetime Value (CLV) Estimation
**Goal:** Estimate CLV using tenure and transaction volume.

**Approach:**
- Tenure: `TIMESTAMPDIFF(MONTH, signup_date, today)`
- Profit per transaction = 0.1% of confirmed amount
- Applied given formula to calculate estimated CLV.
- Ordered customers by highest CLV.

**Challenge:** Excluded users with 0-month tenure to avoid invalid math.

---

## 🗂️ File Structure

```
DataAnalytics-Assessment/
├── Assessment_Q1.sql
├── Assessment_Q2.sql
├── Assessment_Q3.sql
├── Assessment_Q4.sql
└── README.md
```

Each SQL file contains a single query for the respective assessment question with proper formatting and comments.
