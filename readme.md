# Iran-USA Conflict: Impact on Indian Economy

**Domain:** Economics and Data Analytics
**Tools:** Power BI, MySQL Workbench, DAX
**Timeline:** January 2025 to March 2026
**Type:** End-to-End Business Intelligence Dashboard

## Brief Summary

A Power BI dashboard analyzing the macroeconomic impact of the Iran-USA conflict on India, covering crude oil prices, currency depreciation, inflation, stock market performance, trade balance, and sector-level cost disruption across 15 months of data.

## Overview

The Iran-USA conflict created significant economic turbulence for India, one of the world's largest oil importers. This project builds a structured analytical dashboard to measure and communicate that impact using real macroeconomic data from January 2025 to March 2026.

The dashboard is divided into two pages. Page 1 (Price and Market) focuses on oil prices, the rupee-dollar exchange rate, consumer inflation, and a geopolitical event timeline. Page 2 (Trade and Sectors) examines the Nifty 50 and Sensex crash, India's trade deficit, sector-level cost indices, and gold price movements as a safe-haven indicator.

## Problem Statement

India imports approximately 85% of its crude oil requirements. When the Iran-USA conflict intensified in 2025, Brent crude prices spiked by 78.5%, the Indian rupee fell to a record low of Rs. 93.88 per USD, and the Nifty 50 dropped by 19%. This project quantifies the full extent of that damage and maps it to specific conflict events.

The core research question is: how did the Iran-USA conflict impact India's energy costs, currency stability, inflation, equity markets, trade balance, and sectoral operations, and what does the data reveal about India's economic vulnerabilities?

## Dataset

| Source | Description |
|--------|-------------|
| MySQL Workbench | Primary data store with normalized tables built from public economic data |
| Brent Crude Prices | Monthly international crude oil benchmark prices |
| RBI and FOREX Data | INR/USD exchange rate history |
| MoSPI and CPI Data | Consumer Price Index and fuel inflation figures |
| NSE and BSE | Nifty 50 and Sensex historical index values |
| Ministry of Commerce | Monthly export, import, and trade deficit data in INR Crore |
| MCX and Gold Data | Gold price per 10g in INR |
| Conflict Event Log | Manually curated geopolitical timeline of key Iran-USA escalation events |

**Time Range:** January 2025 to March 2026

## Tools and Technologies

| Tool | Role |
|------|------|
| Power BI Desktop | Dashboard development, data modeling, and visual design |
| MySQL Workbench | Relational database for data storage and SQL-based transformation |
| DAX | Calculated measures, KPIs, and time intelligence functions |
| Microsoft Excel and CSV | Data staging and pre-processing |

## Methods

**Data Collection:** Macroeconomic indicators were sourced from RBI, NSE, MoSPI, MCX, and the Ministry of Commerce. A geopolitical event timeline was manually compiled from verified news sources.

**Data Engineering:** Raw data was imported into MySQL Workbench and organized into normalized relational tables with consistent date keys for time-series joins.

**Data Modeling:** Power BI was connected to MySQL and a star schema data model was built with fact and dimension tables linked on date and category fields.

**DAX Measures:** Custom measures were written for crude price percentage change, rupee depreciation, market crash percentage, sector cost index, and severity scoring.

**Dashboard Design:** Two interactive pages were built with KPI cards, slicers, line charts, area charts, clustered column charts, combo charts, and bar charts. Conflict events were overlaid on trend visuals to support causal analysis.

## Key Insights

| Indicator | Observed Impact |
|-----------|----------------|
| Crude Oil Price | Brent crude spiked 78.5%, directly raising India's import costs |
| INR/USD Exchange Rate | Rupee depreciated to a record low of Rs. 93.88 per USD |
| Equity Markets | Nifty 50 declined 19%; Sensex showed correlated movement |
| Trade Deficit | Import costs surged, significantly widening India's trade deficit |
| Sector Cost Index | Peak disruption recorded on March 9, 2026, with transportation and manufacturing most affected |
| Gold Prices | Gold surged in INR terms, reflecting increased safe-haven demand |
| CPI and Fuel Inflation | Consumer price index and fuel inflation rose sharply across H2 2025 |

## Dashboard Output

The complete Power BI dashboard is included in this repository as a .pbix file.

**Page 1: Price and Market**
- Brent Crude and India Petrol Monthly Trend (Line Chart)
- INR/USD Rupee Depreciation Trend (Area Chart)
- CPI and Fuel Inflation Monthly Breakdown (Clustered Column Chart)
- Conflict Events Timeline (Table)
- 6 Summary KPI Cards

**Page 2: Trade and Sectors**
- Nifty 50 and Sensex Market Performance 2025-2026 (Line Chart)
- Exports vs Imports vs Trade Deficit in INR Crore (Combo Chart)
- Sector Cost Index and Severity at March 9 2026 Peak (Bar Chart)
- Gold Price in INR per 10g (Area Chart)
- 6 Summary KPI Cards

## How to Run This Project

**Prerequisites**
- [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free download)
- [MySQL Workbench](https://www.mysql.com/products/workbench/) (optional, required only for data refresh)

**Steps**

1. Clone this repository
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>
   ```

2. Open Power BI Desktop and load `pre-pem_project_Final_output.pbix`

3. The file includes an embedded data model. No database connection is required to view or interact with the dashboard.

4. To refresh data from MySQL, go to Home > Transform Data > Data Source Settings and update the host, port, and credentials for your local MySQL instance.

5. Use the navigation button on the Cover page to enter the dashboard. Slicers on each page allow filtering by date range.

## Results and Conclusion

The dashboard confirms that the Iran-USA conflict served as a significant external economic shock for India. Oil supply disruption fears, currency outflows, and equity market selloffs compounded simultaneously, with the sector cost index reaching its peak on March 9, 2026 as downstream supply chain pressure peaked.

The findings highlight India's structural exposure to geopolitical oil shocks given its dependence on imports. The simultaneous depreciation of the rupee and rise in crude prices created a double impact on the import bill, while equity market declines reflected broader investor risk aversion. The data supports the case for accelerating domestic energy investment and maintaining stronger forex buffers as policy priorities.

## Future Work

- Integrate predictive modeling using ARIMA or linear regression for crude price and rupee forecasting
- Expand coverage to include FII/FDI flow data and sovereign bond yield movements
- Connect the dashboard to live data APIs for real-time monitoring
- Add state-level granularity for fuel price and inflation analysis across Indian states
- Benchmark India's economic response against other major oil-importing nations such as China, Japan, and South Korea
- Deploy the final dashboard to Power BI Service for browser-based public access

## Author and Contact

**Heet Ketan Rathod**

| Platform | Link |
|----------|------|
| GitHub | [@HeetKetanRathod](https://github.com/HeetKetanRathod) |
| LinkedIn | [linkedin.com/in/heetrathod](https://linkedin.com/in/heetrathod) |
| Email | heetrathod9802@gmail.com |

*Power BI and MySQL Workbench | January 2025 to March 2026*
