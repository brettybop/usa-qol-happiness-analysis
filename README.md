# 🏘️ US Metro Affordability & Housing Shock (2008–2023) / Tableau + MS SQL

SQL Server + Tableau portfolio project analyzing how housing-driven cost shifts reshaped affordability and purchasing power across U.S. metropolitan areas from **2008 to 2023** using **BEA Regional Price Parities (RPP)** data.

This project focuses on three core questions:

- Which metros became **more expensive relative to the U.S. average** from **2019 to 2023**, and was that shift **housing-driven**?
- Where did **purchasing power improve or worsen** as cost-of-living changed?
- Which metros offered the strongest “value” in **2023** when comparing **real income vs cost-of-living**?

---

## Project Overview

This project was built to explore metro-level affordability in a way that goes beyond simple “expensive vs cheap” rankings. Instead of looking only at cost-of-living, this analysis combines:

- **Regional Price Parities (RPP)** for overall cost-of-living
- **Housing-specific RPP**
- **Real per capita personal income**
- A custom **Value Index** to approximate metro-level purchasing power

The result is a Tableau workbook with **3 interactive dashboards** supported by a structured **SQL Server semantic layer**.

---

## Dashboards

### 00 – Project Overview
A landing page that introduces the project, explains the methodology in plain English, and provides navigation to the 3 analytical dashboards.

### D1 – Housing Shock & Affordability (2019–2023)
Shows which metros experienced the largest changes in cost-of-living from **2019 to 2023**, with a specific focus on whether those changes were **housing-driven**.

**Key visuals:**
- Housing Shock scatterplot
- Top Value Losers
- Top Value Winners

### D2 – Value Quadrant (2023)
A quadrant-style dashboard that compares metros by:
- **Cost of living**
- **Real per capita income**
- **Relative value / purchasing power**

This view helps identify metros that fall into categories like:
- High Income / Low Cost
- High Income / High Cost
- Low Income / Low Cost
- Low Income / High Cost

### D3 – Metro Explorer
An interactive metro selector that allows the user to:
- Search and select a metro area
- View long-term macro trends from **2008–2023**
- Review a 2023 metro snapshot
- Compare cost, housing, income, and value over time

---

## Key Business Questions

This project was designed to answer the following questions:

1. **Which U.S. metros saw the largest cost-of-living increases from 2019 to 2023?**
2. **Were those increases primarily driven by housing?**
3. **Which metros lost the most affordability over the same period?**
4. **Which metros improved in value or purchasing power despite cost pressures?**
5. **In 2023, which metros sit in the strongest value zone when comparing real income to price levels?**
6. **How has a given metro evolved over time across cost-of-living, housing, income, and value?**

---

## Data Source

### Primary Source
**U.S. Bureau of Economic Analysis (BEA)**  
**Dataset used:** `MARPP_MSA_2008_2023.csv`

This metro-level dataset includes annual measures for:

- Real personal income
- Real per capita personal income
- Regional Price Parities (All items)
- RPP Goods
- RPP Housing
- RPP Utilities
- RPP Other Services
- Implicit regional price deflator

### Coverage
- **Geography:** U.S. Metropolitan Statistical Areas (MSAs)
- **Time period:** 2008–2023
- **Grain:** Metro-Year

---

## Tech Stack

- **SQL Server** — data preparation, reshaping, modeling, analytics views
- **Tableau** — dashboard development and data storytelling
- **SSMS** — raw file import and SQL workflow
- **CSV export** — Tableau data connection layer used for this local workflow

---

## Data Pipeline / Methodology

### 1. Raw Import
The BEA metro RPP file was imported into SQL Server as a raw table in the `raw` schema:

- `raw.bea_rpp_msa_2008_2023_raw`

Because the source file contains year columns in wide format, the data first needed to be reshaped.

### 2. Staging Layer
A long-format metro-year-linecode staging view was created:

- `stg.v_rpp_long`
- `stg.v_rpp_long_msa`

This converted the wide year columns into a normalized structure:

- `cbsa_code`
- `metro_name`
- `year`
- `linecode`
- `metric_description`
- `value`

### 3. Mart / Semantic Layer
The core Tableau-facing metro-year dataset was built in SQL:

- `mart.v_metro_year_rpp`
- `mart.v_metro_year_ranked`
- `mart.v_metro_year_yoy`
- `mart.v_metro_delta_2019_2023`
- `mart.v_metro_delta_2019_2023_enhanced`
- `mart.v_metro_year_segment`
- `mart.v_tableau_metro_dataset`

This layer powers all dashboard calculations and avoids doing heavy logic directly inside Tableau.

---

## Core Metrics

### RPP (All Items)
A metro-level price index where **100 = U.S. average**.

- Above 100 = more expensive than the U.S. average
- Below 100 = cheaper than the U.S. average

### RPP (Housing)
The housing-specific component of RPP.

Used to isolate whether cost changes were primarily driven by housing.

### Real Per Capita Personal Income (constant 2017 dollars)
Inflation-adjusted per-person income.

This allows comparison across time using a consistent real-dollar basis.

### Value Index
A simple affordability / purchasing power proxy:

```text
Value Index = Real Per Capita Income / RPP All Items * 100
```
..
..
TBD
