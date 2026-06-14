# Walmart Weekly Sales — Descriptive Analysis (Mini Project #1)

This is my first mini project focused on **descriptive analysis**, using the Walmart weekly sales dataset (2010-2012, 45 stores). The goal was to practice end-to-end EDA — combining SQL and Python (pandas, matplotlib) — and to build the habit of questioning results rather than accepting them at face value.

## Tools Used
- **PostgreSQL / SQL** (via DBeaver) for initial exploration
- **Python**: pandas, numpy, matplotlib, seaborn (Jupyter Notebook)

## Dataset Overview
- 6,435 rows, 8 columns: `Store`, `Date`, `Weekly_Sales`, `Holiday_Flag`, `Temperature`, `Fuel_Price`, `CPI`, `Unemployment`
- No missing values
- Sales recorded weekly, every **Friday**, across **2010, 2011, and 2012** (2012 data goes only up to October)

## Key Findings

**Overall sales extremes**
- Highest weekly sales: **$3,818,686.45** on **24 Dec 2010** (Christmas Eve)
- Lowest weekly sales: **$209,986.25** on **3 Dec 2010**

**Monthly trends**
- December was the top-selling month in both 2010 and 2011 (holiday season effect); June was highest in 2012 (data ends in October, so December isn't represented)
- January was consistently the weakest month (2011 and 2012); September was weakest in 2010

**Store rankings**
- **Store 33** had the lowest total weekly sales of all stores, in **every year (2010, 2011, 2012)**
- **Store 4** had the highest total weekly sales for **2 consecutive years (2011, 2012)**

**Why is Store 33 consistently the lowest?**

I compared Store 4 (highest) and Store 33 (lowest) for 2011 in depth:

- Store 4's sales operate at roughly **8x the scale** of Store 33's, consistently, throughout the year — this baseline difference, not any single event, is the main reason for the sales gap.
- Correlation analysis showed Store 4's sales had a **moderate positive correlation with CPI (+0.43)** and a **moderate negative correlation with Unemployment (-0.46)**, while Store 33 showed **near-zero correlation** with both (CPI: -0.02, Unemployment: +0.02).

**Digging into the CPI/Unemployment difference**

Further investigation (plotting CPI and sales over time, with and without holiday weeks) revealed:
- CPI is a **shared regional trend** — identical for both stores — that rose steadily across 2011 (from ~127 to ~130)
- Store 33's sales stayed in a **stable, narrow band** all year, regardless of CPI or season
- Store 4's sales became **more volatile and trended higher in the later months of 2011**, which happened to coincide with CPI also being at its highest

**Conclusion**: The CPI/Unemployment correlations for Store 4 don't reflect a direct causal relationship — they reflect two series (CPI and Store 4's late-year sales) that happened to trend in the same direction over the same period. This was a good practical reminder that **correlation ≠ causation**, especially with time-based data where multiple series can drift together coincidentally.

## What I Practiced
- SQL aggregation, filtering, and date functions
- pandas: `groupby`, `pivot`, `sort_values`, boolean indexing, datetime handling, categorical ordering
- matplotlib/seaborn: line plots, scatter plots, subplots, heatmaps
- Forming hypotheses, testing them against data, and revising conclusions when results didn't match expectations
